class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  # def new
  #   @list = List.new
  # end

  def create
    @lists = List.all
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :cover)
  end
end
