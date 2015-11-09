class CouchTypesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    @couch_type = CouchType.new
    authorize CouchType
  end

  def index
  	@couch_types = CouchType.all
    authorize CouchType
  end

  def show
  	@couch_type = CouchType.find(params[:id])
    authorize CouchType
  end

  def create
    permitted = params.require(:couch_type).permit(:name)
    @couch_type = CouchType.create permitted
    if @couch_type
      redirect_to couch_types_path, :notice => "Tipo creado."
    else
      redirect_to couch_types_path, :notice => "No se pudo crear el tipo!"
    end
    authorize CouchType
  end

  def update
    authorize CouchType
  end

  def destroy
    authorize CouchType
    couch_type = CouchType.find(params[:id])
    couch_type.destroy
    redirect_to couch_types_path, :notice => "Tipo eliminado."
  end

end
