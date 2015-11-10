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
    authorize CouchType
    permitted = params.require(:couch_type).permit(:name)
    @couch_type = CouchType.create(permitted)
    if @couch_type.valid?
      redirect_to couch_types_path, :notice => "Tipo creado."
    else
      redirect_to couch_types_path, :notice => "No se pudo crear el tipo. Razón: " << @couch_type.errors.full_messages.to_sentence
    end
  end

  def edit
    authorize CouchType
    @couch_type = CouchType.find(params[:id])
  end

  def update
    @couch_type = CouchType.find(params[:id])
    authorize CouchType
    if @couch_type.update_attributes(params.require(:couch_type).permit(:name))
      redirect_to couch_types_path, :notice => "Tipo actualizado."
    else
      redirect_to couch_types_path, :notice => "Error al actualizar."
    end
  end

  def destroy
    authorize CouchType
    couch_type = CouchType.find(params[:id])
    couch_type.destroy
    if couch_type.destroy
      redirect_to couch_types_path, :notice => "Tipo eliminado."
    end
  end

end
