class LancamentosController < ApplicationController
  before_action :set_lacamento, only: %i[ show update destroy ]

  # GET /lancamentos
  def index
    @lancamentos = Lancamento.all

    render json: @lancamentos
  end

  # GET /lancamentos/1
  def show
    render json: @lancamento
  end

  # POST /lancamentos
  def create
    @lancamento = Lancamento.new(lacamento_params)

    if @lancamento.save
      render json: @lancamento, status: :created, location: @lancamento
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lancamentos/1
  def update
    if @lancamento.update(lacamento_params)
      render json: @lancamento
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lancamentos/1
  def destroy
    @lancamento.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lacamento
      @lancamento = Lancamento.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lacamento_params
      params.expect(lancamento: [ :setor_id, :user_id, :data, :valor ])
    end
end
