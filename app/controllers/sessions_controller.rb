class SessionsController < ApplicationController

    def new

    end
    
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Başarıyla Giriş Yaptınız"
            redirect_to root_path
        else
            flash.now[:error] ="Giriş Yaparken Bir Hata Oluştu"
            render 'new'
        end
        
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Başarıyla Çıkış Yaptınız"
        redirect_to login_path
    end
end