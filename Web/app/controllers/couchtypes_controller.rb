class CouchTypesController < ApplicationController

  def index
  	@couch_types = CouchType.all
  end

  def show
  	@couch_type = CouchType.find(@params[:id])
  end

  def update
  end

  def destroy
  end

end