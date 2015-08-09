class IndexController < ApplicationController
  def index
    @q = Shrine.ransack
    @shrines = Shrine.all
  end

  def search
    @q = Shrine.ransack(params[:q])
    @shrines = @q.result(distinct: true)
    render :index
  end
end
