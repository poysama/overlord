class SearchController < ApplicationController
  def index
    @search_type = params['search_type']
    @search_name = params['search_name']

    case @search_type
    when 'application'
      @result = App.find_by_name(@search_name)
      @servers = @result.servers if !@result.blank?
    when 'server'
      @result = Server.find_by_name(@search_name)
      if !@result.blank?
        @apps = @result.apps
        @services = @result.services
      end
    when 'service'
      @result = Service.find_by_name(@search_name)
      @servers = @result.servers if !@result.blank?
    else
      @result = Location.find_by_name(@search_name)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end
end
