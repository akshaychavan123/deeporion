class UsersController < ApplicationController
    before_action :set_user , except: %i[index new create]
    def index
        @users = User.all
    end
    def new 
        @user = User.new
    end
     def update_status
        if @user.update(status: params[:status])
            redirect_to @user , notice: "status changed successfully "
        end
     end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path(@user) , notice: "user created successfully"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to users_path(@user) , notice: " user updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path , notice: "#{@user} deleted successfully"
    end
    private
    def user_params
        params.require(:user).permit(:name , :task , :start_time , :end_time)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
