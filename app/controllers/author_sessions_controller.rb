class AuthorSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logged in succesfuly.')
    else
      flash[:notice] = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:articles, notice: 'You have logged out.')
  end
end
