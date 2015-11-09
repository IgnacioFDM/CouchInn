class CouchTypesController < ApplicationController

  def new
      @couch_type = CouchType.new
  end

  def index
  	@couch_types = CouchType.all
  end

  def show
  	@couch_type = CouchType.find(params[:id])
  end

  def create
    permitted =params.require(:couch_type).permit(:name)
    @couch_type = CouchType.create permitted
    if @couch_type
      redirect_to couch_types_path, :notice => "Tipo creado"
    else
      redirect_to couch_types_path, :notice => "No se pudo crear el tipo!"
    end
  end

  def update
  end

  def destroy
  end

end
