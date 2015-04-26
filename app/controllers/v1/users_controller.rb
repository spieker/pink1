class V1::UsersController < V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /v1/users
  def index
    authorize :user
    @users = policy_scope(User).all
    render json: @users, each_serializer: V1::UserSerializer
  end

  # GET /v1/users/1
  def show
    render json: @user, serializer: V1::UserSerializer
  end

  # POST /v1/users
  def create
    @user = User.new user_params
    authorize @user
    @user.save!
    render json: @user, serializer: V1::UserSerializer
  end

  # PATCH/PUT /v1/users/1
  def update
    @user.assign_attributes user_params
    authorize @user
    @user.save!
    render json: @user, serializer: V1::UserSerializer
  end

  # DELETE /v1/users/1
  def destroy
    @user.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      r = params.require(:user).permit policy(@user || User).permitted_attributes
      r.delete(:password) if r[:password].blank?
      r
    end
end
