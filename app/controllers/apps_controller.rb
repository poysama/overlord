class AppsController < ApplicationController
  def index
    @apps = App.all

    if !has_server?
      @server = Server.find_by_id(params['server_id'])
    end

    @app = App.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end

  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app }
    end
  end

  def new
    @apps = []
    @app = App.new

    if !has_server?
      @apps = App.all
      @server = Server.find_by_id(params['server_id'])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app }
    end
  end

  def edit
    @apps = []

    if !has_server?
      @apps = App.all
      @server = Server.find_by_id(params['server_id'])
    else
      @app = App.find(params[:id])
    end
  end

  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created, location: @app }
      else
        format.html { render action: "new" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @server.blank?
      @app = App.find(params[:id])
    else
      apps = App.find_all_by_name(params['apps'])
      @server.apps = apps
    end

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :ok }
    end
  end

  def has_server?
    params['server_id'].blank?
  end
end
