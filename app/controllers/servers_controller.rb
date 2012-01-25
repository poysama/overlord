class ServersController < ApplicationController
  def index
    @servers = Server.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servers }
    end
  end

  def show
    @server = Server.find(params[:id])
    @apps = @server.apps
    @services = @server.services
    @connections = []

    @server.connections.each do |c|
      conn = {}
      conn['updated_at'] = c.updated_at
      conn['conn_server_name'] = Server.find(c.service_server_id).name
      conn['service_name'] = Service.find(c.service_id).name
      @connections << conn
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server }
    end
  end

  def new
    @server = Server.new
    @apps = App.all
    @services = Service.all
    @connections = {}
    @locations = Location.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server }
    end
  end

  def edit
    @server = Server.find(params[:id])
    @apps = App.all
    @services = Service.all
    @locations = Location.all
  end

  def create
    @server = Server.new(params[:server])
    @locations = Location.all
    @server.location = Location.find(params['location_id']) if !@server.blank?

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render json: @server, status: :created, location: @server }
      else
        format.html { render action: "new" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @server = Server.find(params[:id])

    if params.include?('apps') and !params['apps'].blank?
      @server.apps = App.find_all_by_name(params['apps'])
    else
      @server.apps.destroy_all if params['current_form'] == 'apps'
    end

    if params.include?('services') and !params['services'].blank?
      @server.services = Service.find_all_by_name(params['services'])
    else
      @server.services.destroy_all if params['current_form'] == 'services'
    end

    if !params['conn_server_id'].blank? and !params['service_id'].blank?
      id_1 = params['conn_server_id']
      id_2 = params['service_id']
      conn = Connection.find_by_server_id_and_service_id_and_service_server_id(@server.id, id_1, id_2)

      if conn.nil?
        c = Connection.new
        c.server_id = @server.id
        c.service_server_id = id_1
        c.service_id = id_2
        c.save
      end
    end

    if !@server.blank?
      if !params['location_id'].blank?
        @server.location = Location.find(params['location_id'])
      end
    end

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to servers_url }
      format.json { head :ok }
    end
  end
end
