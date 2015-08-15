class ShrinesController < ApplicationController
  before_action :set_shrine, only: [:show, :edit, :update, :destroy]

  # GET /shrines
  # GET /shrines.json
  def index
    setup_index
    @shrines = Shrine.all # TODO: 最新登録されたデータ順にする?
  end

  def search
    setup_index
    @shrines = @q.result(distinct: true)
    render :index, change: :shrines
  end

  # GET /shrines/1
  # GET /shrines/1.json
  def show
  end

  # GET /shrines/new
  def new
    @shrine = Shrine.new
  end

  # GET /shrines/1/edit
  def edit
  end

  # POST /shrines
  # POST /shrines.json
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

  # PATCH/PUT /shrines/1
  # PATCH/PUT /shrines/1.json
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

  # DELETE /shrines/1
  # DELETE /shrines/1.json
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
        shrine_ids = cookies[:shrine_history].split(',').uniq
        if shrine_ids.size > Shrine::HISTORY_SIZE
          shrine_ids.pop(shrine_ids.size - Shrine::HISTORY_SIZE)
        end
        @shrine_histories = Shrine.order_as_specified(id: shrine_ids)
        cookies[:shrine_history] = shrine_ids.join(',')
      end
    end
end
