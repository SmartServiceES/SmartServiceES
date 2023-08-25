class ContratosController < ApplicationController
  before_action :set_contrato, only: %i[ show edit update destroy ]

  # GET /contratos or /contratos.json
  def index
    buscas()
    @contratos = Contrato.joins(:cliente).where(clientes: { id: @clientes.pluck(:id) })
  end

  # GET /contratos/1 or /contratos/1.json
  def show
  end

  # def newContrato
  #   @contrato = Contrato.new
  # end

  def send_email
    Rails.logger.debug "Received send_email POST request"
    email = params[:email]
    # Aqui você pode usar o Action Mailer para enviar o e-mail
    UserMailer.email_to_worker(email).deliver_now
    flash[:notice] = 'E-mail enviado com sucesso!'
    redirect_to contrato_path(params[:id]) # Redireciona de volta para a página de contrato
  end

  def buscas
    @q = Cliente.ransack(params[:q])
    @clientes = @q.result(distinct: true)
  end

  def search_clientes
    buscas()
    @contratos = Contrato.all
    @contrato = Contrato.new
    render 'search_clientes'
  end
  # GET /contratos/new
  def new
    @contrato = Contrato.new
    @servicos_contrataveis = Servico.where(contratado: false)
  end
  # GET /contratos/1/edit
  def edit
  end
  # POST /contratos or /contratos.json
  def create
    @contrato = Contrato.new(contrato_params)
    respond_to do |format|
      if @contrato.save
        @contrato.servico.update(contratado: true )
        format.html { redirect_to contrato_url(@contrato), notice: "Contrato was successfully created." }
        format.json { render :show, status: :created, location: @contrato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /contratos/1 or /contratos/1.json
  def update
    respond_to do |format|
      if @contrato.update(contrato_params)
        format.html { redirect_to contrato_url(@contrato), notice: "Contrato was successfully updated." }
        format.json { render :show, status: :ok, location: @contrato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /contratos/1 or /contratos/1.json
  def destroy
    @contrato.destroy
    respond_to do |format|
      format.html { redirect_to contratos_url, notice: "Contrato was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contrato
    @contrato = Contrato.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def contrato_params
    params.fetch(:contrato, {}).permit(:cliente_id, :servico_id, :pix, :status)
  end
end