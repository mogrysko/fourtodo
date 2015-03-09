class ListsController < ApplicationController
  def index
    user = User.find(session[:user_id])
    @lists = user.lists
  end
  def show
    @list = List.find(params[:id])
  end
  def new
    @list = List.new
  end
  def create
    List.create(list_params)
    redirect_to lists_path
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update!(list_params)
    redirect_to lists_path
  end
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:listname).merge(user_id: session[:user_id])
  end
end
