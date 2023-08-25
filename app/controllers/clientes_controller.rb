class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def clienteResult
    @q = Cliente.ransack(params[:q])
    @clientes = @q.result(distinct: true).all
  end

  def clienteFind
    Cliente.find(params[:id])
  end
  def index
    clienteResult()
  end
  # BUSCAR
  def buscar
    clienteResult()
    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok, location: @servico }
    end
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_endereco
  end

  # GET /clientes/1/edit
  def edit
    @cliente = clienteFind()
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    @cliente.endereco = Endereco.new(cliente_params[:endereco_attributes])

    respond_to_create(@cliente)
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    @cliente = clienteFind()
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente = clienteFind()
    @cliente.destroy
    @cliente.endereco.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = clienteFind()
  end

  # Only allow a list of trusted parameters through.
  def cliente_params
    params.require(:cliente).permit(:nome_completo, :data_nascimento, :cpf, :email, :senha, :telefone, {:endereco_attributes => [:nome_da_rua, :numero_da_casa, :cep, :bairro, :cidade, :complemento]})
  end
  def respond_to_create(cliente)
    respond_to do |format|
      if cliente.save
        format.html { redirect_to cliente_url(cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: cliente.errors, status: :unprocessable_entity }
      end
    end
  end
end