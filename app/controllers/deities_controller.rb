class DeitiesController < ApplicationController
  before_action :set_deity, only: [:show, :edit, :update, :destroy]

  # GET /deities
  # GET /deities.json
  def index
    @deities = Deity.all
  end

  # GET /deities/1
  # GET /deities/1.json
  def show
  end

  # GET /deities/new
  def new
    @deity = Deity.new
  end

  # GET /deities/1/edit
  def edit
  end

  # POST /deities
  # POST /deities.json
  def create
    @deity = Deity.new(deity_params)

    respond_to do |format|
      if @deity.save
        format.html { redirect_to @deity, notice: 'Deity was successfully created.' }
        format.json { render :show, status: :created, location: @deity }
      else
        format.html { render :new }
        format.json { render json: @deity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deities/1
  # PATCH/PUT /deities/1.json
  def update
    respond_to do |format|
      if @deity.update(deity_params)
        format.html { redirect_to @deity, notice: 'Deity was successfully updated.' }
        format.json { render :show, status: :ok, location: @deity }
      else
        format.html { render :edit }
        format.json { render json: @deity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deities/1
  # DELETE /deities/1.json
  def destroy
    @deity.destroy
    respond_to do |format|
      format.html { redirect_to deities_url, notice: 'Deity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deity
      @deity = Deity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deity_params
      params.require(:deity).permit(:name, :name_hiragana, :name_katakana, :detail, :tags)
    end
end
