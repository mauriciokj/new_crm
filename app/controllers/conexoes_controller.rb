class ConexoesController < ApplicationController
  before_action :set_conexao, only: [:show, :edit, :update, :destroy]

  # GET /conexoes
  # GET /conexoes.json
  def index
    @conexoes = Conexao.all
  end

  # GET /conexoes/1
  # GET /conexoes/1.json
  def show
  end

  # GET /conexoes/new
  def new
    @conexao = Conexao.new
  end

  # GET /conexoes/1/edit
  def edit
  end

  # POST /conexoes
  # POST /conexoes.json
  def create
    @conexao = Conexao.new(conexao_params)

    respond_to do |format|
      if @conexao.save
        format.html { redirect_to @conexao, notice: 'Conexao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @conexao }
      else
        format.html { render action: 'new' }
        format.json { render json: @conexao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conexoes/1
  # PATCH/PUT /conexoes/1.json
  def update
    respond_to do |format|
      if @conexao.update(conexao_params)
        format.html { redirect_to @conexao, notice: 'Conexao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @conexao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conexoes/1
  # DELETE /conexoes/1.json
  def destroy
    @conexao.destroy
    respond_to do |format|
      format.html { redirect_to conexoes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conexao
      @conexao = Conexao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conexao_params
      params.require(:conexao).permit(:descricao, :adapter, :host, :username, :password, :database)
    end
end
