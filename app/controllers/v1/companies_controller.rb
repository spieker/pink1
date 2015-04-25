class V1::CompaniesController < V1::BaseController
  before_action :set_company, only: [:show]

  # GET /v1/companies
  def index
    @companies = policy_scope(Company)
    render json: @companies, each_serializer: V1::CompanySerializer
  end

  # GET /v1/companies/1
  def show
    render json: @company, serializer: V1::CompanySerializer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
      authorize @company
    end
end
