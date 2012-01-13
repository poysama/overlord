class ServerappinfosController < ApplicationController
  # GET /serverappinfos
  # GET /serverappinfos.json
  def index
    @serverappinfos = Serverappinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @serverappinfos }
    end
  end

  # GET /serverappinfos/1
  # GET /serverappinfos/1.json
  def show
    @serverappinfo = Serverappinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @serverappinfo }
    end
  end

  # GET /serverappinfos/new
  # GET /serverappinfos/new.json
  def new
    @serverappinfo = Serverappinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @serverappinfo }
    end
  end

  # GET /serverappinfos/1/edit
  def edit
    @serverappinfo = Serverappinfo.find(params[:id])
  end

  # POST /serverappinfos
  # POST /serverappinfos.json
  def create
    @serverappinfo = Serverappinfo.new(params[:serverappinfo])

    respond_to do |format|
      if @serverappinfo.save
        format.html { redirect_to @serverappinfo, notice: 'Serverappinfo was successfully created.' }
        format.json { render json: @serverappinfo, status: :created, location: @serverappinfo }
      else
        format.html { render action: "new" }
        format.json { render json: @serverappinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /serverappinfos/1
  # PUT /serverappinfos/1.json
  def update
    @serverappinfo = Serverappinfo.find(params[:id])

    respond_to do |format|
      if @serverappinfo.update_attributes(params[:serverappinfo])
        format.html { redirect_to @serverappinfo, notice: 'Serverappinfo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @serverappinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serverappinfos/1
  # DELETE /serverappinfos/1.json
  def destroy
    @serverappinfo = Serverappinfo.find(params[:id])
    @serverappinfo.destroy

    respond_to do |format|
      format.html { redirect_to serverappinfos_url }
      format.json { head :ok }
    end
  end
end
