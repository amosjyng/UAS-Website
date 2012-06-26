class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html # new.html.erb
      # what to do with json? I'm not really sure
    end
  end

  def create
    @officer = Officer.where("email = ?", params[:session][:email]).first
    respond_to do |format|
      if !@officer.nil? && @officer.authenticate(params[:session][:password])
          format.html { redirect_to @officer, :notice => 'You\'ve signed in!' }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def destroy
  end
end
