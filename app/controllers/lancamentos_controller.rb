class LancamentosController < ApplicationController
  skip_before_action :authorize_request, raise: false if defined?(authorize_request)
  before_action :set_lancamento, only: %i[ show update destroy ]

  # GET /lancamentos
  def index
    @lancamentos = Lancamento.includes(:setor, :user, :categoria).all
    render json: @lancamentos.as_json(include: [:setor, :user, :categoria])
  end

  # GET /lancamentos/1
  def show
    render json: @lancamento.as_json(include: [:setor, :user, :categoria])
  end

  # POST /lancamentos
  def create
    @lancamento = Lancamento.new(lancamento_params)

    if @lancamento.save
      render json: @lancamento.as_json(include: [:setor, :user, :categoria]), status: :created
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lancamentos/1
  def update
    if @lancamento.update(lancamento_params)
      render json: @lancamento.as_json(include: [:setor, :user, :categoria])
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lancamentos/1
  def destroy
    @lancamento.destroy!
    render json: { message: "Lancaçemtno deletado" }
  end

  private

  def set_lancamento
    @lancamento = Lancamento.find(params[:id])
  end

  def lancamento_params
    params.require(:lancamento).permit(:setor_id, :user_id, :categoria_id, :data, :valor)
  end
end
