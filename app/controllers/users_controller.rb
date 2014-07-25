class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(:per_page => 100, page: params[:page])
  end

  def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) # 健壮参数 原来是(paroms[:user]) 
  	if @user.save
      sign_in @user
  	  flash[:success] = "欢迎来到“标我吧”议价平台！"
      redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "用户资料已被更新"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "该账户已被删除."
    redirect_to users_url
  end

  private 

    def user_params # 健壮参数
      params.require(:user).permit(:name, :email, :password, 
      					:password_confirmation)
    end
   
    #Before filters

    #def signed_in_user
     # unless signed_in?
      #  store_location
       # redirect_to signin_url, notice: "请登录."
      #end
    #end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
