require 'net/smtp'

class OfficersController < ApplicationController
  # GET /officers
  # GET /officers.json
  def index
    @officers = Officer.all
    @card_height = 235

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @officers }
    end
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
    @officer = Officer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @officer }
    end
  end

  # GET /officers/new
  # GET /officers/new.json
  def new
    @officer = Officer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @officer }
    end
  end

  # GET /officers/1/edit
  def edit
    @officer = Officer.find(params[:id])
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = Officer.new(params[:officer])

    respond_to do |format|
      if @officer.save
        temp_password = SecureRandom.hex
        @officer.change_password temp_password
        UserMailer.creation_notice(@officer, temp_password).deliver
        format.html { redirect_to @officer, \
          :notice => "Officer was successfully created. An e-mail has been sent to #{@officer.email}." }
        format.json { render :json => @officer, :status => :created, :location => @officer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @officer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /officers/1
  # PUT /officers/1.json
  def update
    @officer = Officer.find(params[:id])

    respond_to do |format|
      if @officer.update_attributes(params[:officer])
        format.html { redirect_to @officer, :notice => 'Officer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @officer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer = Officer.find(params[:id])
    @officer.destroy

    respond_to do |format|
      format.html { redirect_to officers_url }
      format.json { head :no_content }
    end
  end
end
