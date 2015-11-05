class DeitiesController < ApplicationController
  before_action :set_deity, only: [:show, :edit, :update, :destroy]

  def index
    @deities = Deity.all
  end

  def show
  end

  def new
    @deity = Deity.new
  end

  def edit
  end

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

  def destroy
    @deity.destroy
    respond_to do |format|
      format.html { redirect_to deities_url, notice: 'Deity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_deity
      @deity = Deity.find(params[:id])
    end

    def deity_params
      params.require(:deity).permit(:name, :name_hiragana, :name_katakana, :detail, :tags)
    end
end
