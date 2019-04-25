class Admin::UsersController < ApplicationController
  before_action :require_admin
  def index
    @users = User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @usr=User.new
  end
  
  def edit
    @user=User.find(params[:id])
  end


  def create
    @user=User.new(user_params)

    if @user.save
      redirect_to admin_user_path, notict: "ユーザ「#{@user.naem}を登録しました」"
    else
      render :new
    end
  end
  
  def update
    @user=User.find(params[:id])
      
    if @user.update(user_params)
      redirect_to admin_user_path(@user),notice: "ユーザ「#{@user.name}」を更新しました"
    else 
      render :new
    end
  end
  
  def destory
    @user=User.find(params[:id])
    @user.destory
    redirect_to admin_user_path, notice: "ユーザ「#{@user.name}」を削除しました"
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end
