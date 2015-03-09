class SessionsController <ApplicationController
  def show
    @users = User.all
  end
  def create
    session[:user_id] = params[:user_id]

    redirect_to tasks_path
  end

end
