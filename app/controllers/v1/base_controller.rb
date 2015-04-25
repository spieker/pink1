class V1::BaseController < ApplicationController
  include Pundit
  include Rails::API::HashValidationErrors

  before_action :doorkeeper_authorize!

  # Custom exceptions
  class BadRequest < StandardError; end
  class UnknownLocale < StandardError; end
  class UnauthorizedAccess < StandardError; end

  # Exception handling
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid
  rescue_from ActiveRecord::RecordNotSaved, with: :record_invalid
  rescue_from BadRequest,                   with: :bad_request
  rescue_from UnknownLocale,                with: :unknown_locale
  rescue_from UnauthorizedAccess,           with: :unauthorized_request
  rescue_from Pundit::NotAuthorizedError,   with: :unauthorized_request

  ##################################
  # Security
  ##################################

  def setup_session
    @current_user = nil

    token, options = token_and_options(request)
    if token.present?
      setup_session_by_token token, options
    end
  end

  def setup_session_by_token(token, options)
    type = options['type']
    if type.present?
      send :"setup_session_by_token_type_#{type}", token, options
    end
  end

  def setup_session_by_token_type_secret(secret, options)
    viddle = Viddle.find_token options[:id]
    @current_user = AuthSecret.new secret, viddle
  end

  def current_user
    if doorkeeper_token
      @current_user ||= User.find(doorkeeper_token.resource_owner_id)
    end
  end

  ##################################
  # Exception handling
  ##################################

  # Override Rails 404 responder, to return a custom JSON message.
  def record_not_found(exception)
    Airbrake.notify exception
    render json: {
             status: 404,
             message: exception.message.to_s
           },
           status: :not_found
  end

  # If a record cannot be saved, because it is either malformed or some
  # callback failed, an error message containing the record's errors is
  # returned.
  def record_invalid(exception)
    Airbrake.notify exception
    errors = exception.record.errors.as_json

    render json: {
             status: 422,
             message: 'Unprocessable entity',
             errors: errors
           },
           status: :unprocessable_entity
  end

  # Custom handler for a 400 - Bad request error
  def bad_request(exception)
    Airbrake.notify exception
    render json: {
             status: 400,
             message: 'Bad request'
           },
           status: :bad_request
  end

  # Custom handler if specified content locale is not available for hotel
  def unknown_locale(exception)
    Airbrake.notify exception
    render json: {
             status: 400,
             message: "Unknown locale. #{exception.message}"
           },
           status: :bad_request
  end

  # Custom handler for unauthorized access
  def unauthorized_request(exception)
    Airbrake.notify exception
    render json: {
               status: 403,
               message: 'Unauthorized access'
             },
             status: 403
  end
end
