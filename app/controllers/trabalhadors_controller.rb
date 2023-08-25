class TrabalhadorsController < ApplicationController
  before_action :set_trabalhador, only: %i[ show edit update destroy ]

  # GET /trabalhadors or /trabalhadors.json

  def trabalhadorResult
    @q = Trabalhador.ransack(params[:q])
    @trabalhadors = @q.result(distinct: true).all
  end
  def index
    trabalhadorResult()
  end

  def buscar
    trabalhadorResult()
    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok, location: @servico }
    end
  end

  # GET /trabalhadors/1 or /trabalhadors/1.json
  def show
  end

  # GET /trabalhadors/new
  def new
    @trabalhador = Trabalhador.new
  end

  # GET /trabalhadors/1/edit
  def edit
  end

  # POST /trabalhadors or /trabalhadors.json
  def create
    @trabalhador = Trabalhador.new(trabalhador_params)

    respond_to_create(@trabalhador)
  end

  # PATCH/PUT /trabalhadors/1 or /trabalhadors/1.json
  def update
    respond_to do |format|
      if @trabalhador.update(trabalhador_params)
        format.html { redirect_to trabalhador_url(@trabalhador), notice: "Trabalhador was successfully updated." }
        format.json { render :show, status: :ok, location: @trabalhador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trabalhador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trabalhadors/1 or /trabalhadors/1.json
  def destroy
    @trabalhador.destroy

    respond_to do |format|
      format.html { redirect_to trabalhadors_url, notice: "Trabalhador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabalhador
      @trabalhador = Trabalhador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trabalhador_params
      params.require(:trabalhador).permit(:nome_completo, :telefone, :data_nascimento, :email, :senha, :profissao, :avatar)
    end

  def respond_to_create(trabalhador)
    respond_to do |format|
      if trabalhador.save
        format.html { redirect_to trabalhador_url(trabalhador), notice: "Trabalhador was successfully created." }
        format.json { render :show, status: :created, location: trabalhador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: trabalhador.errors, status: :unprocessable_entity }
      end
    end
  end
end
