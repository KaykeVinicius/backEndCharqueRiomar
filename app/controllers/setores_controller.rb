class SetoresController < ApplicationController
  before_action :set_setor, only: %i[ show update destroy ]

  # GET /setores
  def index
    @setores = Setor.all

    render json: @setores
  end

  # GET /setores/1
  def show
    render json: @setor
  end

  # POST /setores
  def create
    @setor = Setor.new(setor_params)

    if @setor.save
      render json: @setor, status: :created, location: @setor
    else
      render json: @setor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /setores/1
  def update
    if @setor.update(setor_params)
      render json: @setor
    else
      render json: @setor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /setores/1
  def destroy
    @setor.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setor
      @setor = Setor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def setor_params
      params.expect(setor: [ :nome ])
    end
end
