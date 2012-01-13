class ServerserviceinfosController < ApplicationController
  # GET /serverserviceinfos
  # GET /serverserviceinfos.json
  def index
    @serverserviceinfos = Serverserviceinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @serverserviceinfos }
    end
  end

  # GET /serverserviceinfos/1
  # GET /serverserviceinfos/1.json
  def show
    @serverserviceinfo = Serverserviceinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @serverserviceinfo }
    end
  end

  # GET /serverserviceinfos/new
  # GET /serverserviceinfos/new.json
  def new
    @serverserviceinfo = Serverserviceinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @serverserviceinfo }
    end
  end

  # GET /serverserviceinfos/1/edit
  def edit
    @serverserviceinfo = Serverserviceinfo.find(params[:id])
  end

  # POST /serverserviceinfos
  # POST /serverserviceinfos.json
  def create
    @serverserviceinfo = Serverserviceinfo.new(params[:serverserviceinfo])

    respond_to do |format|
      if @serverserviceinfo.save
        format.html { redirect_to @serverserviceinfo, notice: 'Serverserviceinfo was successfully created.' }
        format.json { render json: @serverserviceinfo, status: :created, location: @serverserviceinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @serverserviceinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /serverserviceinfos/1
  # PUT /serverserviceinfos/1.json
  def update
    @serverserviceinfo = Serverserviceinfo.find(params[:id])

    respond_to do |format|
      if @serverserviceinfo.update_attributes(params[:serverserviceinfo])
        format.html { redirect_to @serverserviceinfo, notice: 'Serverserviceinfo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @serverserviceinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serverserviceinfos/1
  # DELETE /serverserviceinfos/1.json
  def destroy
    @serverserviceinfo = Serverserviceinfo.find(params[:id])
    @serverserviceinfo.destroy

    respond_to do |format|
      format.html { redirect_to serverserviceinfos_url }
      format.json { head :ok }
    end
  end
end
