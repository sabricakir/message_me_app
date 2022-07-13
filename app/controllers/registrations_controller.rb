class RegistrationsController < ApplicationController
    before_action :logged_in_redirect
    def new

    end
    
    def create
        user = User.new(user_params)
        if user.save
            flash[:success] = "Başarıyla Kayıt Oldunuz"
            session[:user_id] = user.id
            cookies[:user_id] = user.id
            redirect_to root_path
        else
            flash.now[:error] ="Kayıt Olurken Bir Hata Oluştu"
            render 'new'
        end
    end

    private

    def user_params
        params.require(:registration).permit(:username, :password)
    end

    def logged_in_redirect
        if logged_in?
            flash[:error] = "Zaten Giriş Yaptınız"
            redirect_to root_path
        end
    end
end