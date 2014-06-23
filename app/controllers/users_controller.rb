class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) # 健壮参数 原来是(paroms[:user]) 
  	if @user.save
  	  flash[:success] = "欢迎来到“标我吧”网！"
      redirect_to @user
  	else
  	  render 'new'
  	end
  end

  private 

    def user_params # 健壮参数
      params.require(:user).permit(:name, :email, :password, 
      					:password_confirmation)
    end
end
