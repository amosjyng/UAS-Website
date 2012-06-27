class SessionsController < ApplicationController

  def create
    @officer = Officer.where("email = ?", params[:session][:email]).first
    respond_to do |format|
      if @officer.nil?
        flash.now[:error] = "You're using the wrong e-mail to log in!"
        format.html { render :action => 'new' }
      elsif !@officer.authenticate params[:session][:password] 
        flash.now[:error] = "You've entered the wrong password!"
        format.html { render :action => 'new' }
      else
        format.html { redirect_to @officer, :notice => "You've signed in!" }
      end
    end
  end

  def destroy
  end
end
