class V1::DomainsController < V1::BaseController
  before_action :set_domain, only: [:show, :update, :destroy]

  # GET /v1/domains
  def index
    @domains = policy_scope(Domain)
    render json: @domains, each_serializer: V1::DomainSerializer
  end

  # GET /v1/domains/1
  def show
    render json: @domain, serializer: V1::DomainSerializer
  end

  # POST /v1/domains
  def create
    @domain = Domain.new domain_params
    authorize @domain
    @domain.save!
    render json: @domain, serializer: V1::DomainSerializer
  end

  # PATCH/PUT /v1/domains/1
  def update
    @domain.assign_attributes domain_params
    authorize @domain
    @domain.save!
    render json: @domain, serializer: V1::DomainSerializer
  end

  # DELETE /v1/domains/1
  def destroy
    @domain.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
      authorize @domain
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(
        policy(@domain || Domain).permitted_attributes
      )
    end
end
