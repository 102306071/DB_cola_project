class ColasController < ApplicationController
  before_action :set_cola, only: [:show, :edit, :update, :destroy]

  # GET /colas
  # GET /colas.json
  def index
    @colas = Cola.all
  end

  # GET /colas/1
  # GET /colas/1.json
  def show
  end

  # GET /colas/new
  def new
    @cola = Cola.new
  end

  # GET /colas/1/edit
  def edit
  end

  # POST /colas
  # POST /colas.json
  def create
    @cola = Cola.new(cola_params)

    respond_to do |format|
      if @cola.save
        format.html { redirect_to @cola, notice: 'Cola was successfully created.' }
        format.json { render :show, status: :created, location: @cola }
      else
        format.html { render :new }
        format.json { render json: @cola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colas/1
  # PATCH/PUT /colas/1.json
  def update
    respond_to do |format|
      if @cola.update(cola_params)
        format.html { redirect_to @cola, notice: 'Cola was successfully updated.' }
        format.json { render :show, status: :ok, location: @cola }
      else
        format.html { render :edit }
        format.json { render json: @cola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colas/1
  # DELETE /colas/1.json
  def destroy
    @cola.destroy
    respond_to do |format|
      format.html { redirect_to colas_url, notice: 'Cola was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cola
      @cola = Cola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cola_params
      params[:cola]
    end
end
