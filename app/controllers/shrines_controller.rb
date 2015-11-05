class ShrinesController < ApplicationController
  before_action :set_shrine, only: [:show, :edit, :update, :destroy]

  def index
    setup_index
    @shrines = Shrine.preload(:deities).latest
  end

  def search
    setup_index
    @shrines = @q.result(distinct: true)
    render :index, change: :shrines
  end

  def show
  end

  def new
    @shrine = Shrine.new
  end

  def edit
  end

  def create
    @shrine = Shrine.new(shrine_params)

    respond_to do |format|
      if @shrine.save
        format.html { redirect_to @shrine, notice: 'Shrine was successfully created.' }
        format.json { render :show, status: :created, location: @shrine }
      else
        format.html { render :new }
        format.json { render json: @shrine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shrine.update(shrine_params)
        format.html { redirect_to @shrine, notice: 'Shrine was successfully updated.' }
        format.json { render :show, status: :ok, location: @shrine }
      else
        format.html { render :edit }
        format.json { render json: @shrine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shrine.destroy
    respond_to do |format|
      format.html { redirect_to shrines_url, notice: 'Shrine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def setup_index
      @q = Shrine.ransack(params[:q])
      set_history
    end

    def set_shrine
      @shrine = Shrine.find(params[:id])
    end

    def shrine_params
      params.require(:shrine).permit(:name, :name_hiragana, :name_katakana, :detail, :longitude, :latitude, :address, :hp, :tags)
    end

    def set_history
      if cookies[:shrine_history]
        shrine_ids = cookies[:shrine_history].split(',')
        if shrine_ids.size > Shrine::HISTORY_SIZE
          shrine_ids.pop(shrine_ids.size - Shrine::HISTORY_SIZE)
        end
        @shrine_histories = Shrine.where(id: shrine_ids).order_as_specified(id: shrine_ids)
        cookies[:shrine_history] = shrine_ids.join(',')
      end
    end
end
