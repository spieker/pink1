class V1::AliasesController < V1::BaseController
  before_action :set_alias, only: [:show, :update, :destroy]

  # GET /v1/aliases
  def index
    @aliases = policy_scope(Alias).all
    render json: @aliases, each_serializer: V1::AliasSerializer
  end

  # GET /v1/aliases/1
  def show
    render json: @alias, serializer: V1::AliasSerializer
  end

  # POST /v1/aliases
  def create
    @alias = Alias.new alias_params
    authorize @alias
    @alias.save!
    render json: @alias, serializer: V1::AliasSerializer
  end

  # PATCH/PUT /v1/aliases/1
  def update
    @alias.assign_attributes alias_params
    authorize @alias
    @alias.save!
    render json: @alias.errors, serializer: V1::AliasSerializer
  end

  # DELETE /v1/aliases/1
  def destroy
    @alias.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alias
      @alias = Alias.find(params[:id])
      authorize @alias
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alias_params
      params.require(:alias).permit policy(@alias || Alias).permitted_attributes
    end
end
