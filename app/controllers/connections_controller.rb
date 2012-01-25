class ConnectionsController < ApplicationController
  def index
    @server = Server.find_by_id(params['server_id'])
    @services = Service.all
    @servers = Server.all
    @connections = []

    @server.connections.each do |c|
      conn = {}
      conn['id'] = c.id
      conn['updated_at'] = Time.now.since(c.updated_at)
      conn['conn_server_name'] = Server.find(c.service_server_id).name
      conn['service_name'] = Service.find(c.service_id).name
      @connections << conn
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @connection }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @connection }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'App was successfully created.' }
        format.json { render json: @connection, status: :created, location: @connection }
      else
        format.html { render action: "new" }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @connection.update_attributes(params[:app])
        format.html { redirect_to @connection, notice: 'App was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy

    respond_to do |format|
      format.html { redirect_to server_connections_url }
      format.json { head :ok }
    end
  end
end
