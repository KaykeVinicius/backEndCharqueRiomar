class LancamentosController < ApplicationController
  skip_before_action :authorize_request, only: [:index]
  before_action :set_lancamento, only: %i[ show update destroy ]

  # GET /lancamentos
  def index
    @q = Lancamento.includes(:setor, :categoria).ransack(params[:q])
    @pagy, @lancamentos = pagy(@q.result, page: params[:page], items: params[:per_page] || 20)
    
    render json: {
      lancamentos: @lancamentos.as_json(include: [:setor, :categoria]),
      pagination: {
        count: @pagy.count,
        page: @pagy.page,
        items: @pagy.vars[:items],  # 🔹 items está em @pagy.vars
        pages: @pagy.pages,
        last: @pagy.last,
        from: @pagy.from,
        to: @pagy.to,
        prev: @pagy.prev,
        next: @pagy.next
      }
    }
  end

  # GET /lancamentos/1
  def show
    render json: @lancamento.as_json(include: [:setor, :categoria])
  end

  # POST /lancamentos
  def create
    @lancamento = Lancamento.new(lancamento_params)

    if @lancamento.save
      render json: @lancamento.as_json(include: [:setor, :categoria]), status: :created
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lancamentos/1
  def update
    if @lancamento.update(lancamento_params)
      render json: @lancamento.as_json(include: [:setor, :categoria])
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lancamentos/1
  def destroy
    @lancamento.destroy!
    render json: { message: "Lançamento deletado" }
  end

  private

  def set_lancamento
    @lancamento = Lancamento.find(params[:id])
  end

  def lancamento_params
    params.require(:lancamento).permit(:setor_id, :categoria_id, :data, :valor)
  end
end