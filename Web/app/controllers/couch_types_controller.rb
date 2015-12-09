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

  def create
    authorize CouchType
    parameters = params.require(:couch_type).permit(:name,:disabled)
    @couch_type = CouchType.new(parameters)
    if @couch_type.save
      redirect_to couch_types_path , notice: "Tipo creado."
    else
      redirect_to couch_types_path , alert: "No se pudo crear tipo: " << @couch_type.errors.full_messages.to_sentence
    end
  end

  def edit
    authorize CouchType
    @couch_type = CouchType.find(params[:id])
  end

  def update
    authorize CouchType
    
    @couch_type = CouchType.find(params[:id]) 
    if @couch_type.update(params.require(:couch_type).permit(:name,:disabled))
      redirect_to couch_types_path , notice: "Tipo actualizado"
    else
      redirect_to couch_types_path , alert: "Error al actualizar: " << @couch_type.errors.full_messages.to_sentence
    end
  end

  def destroy
    authorize CouchType

    @couch_type = CouchType.find(params[:id])
    if @couch_type.destroy
      redirect_to couch_types_path , notice: "Tipo eliminado"
    else
      redirect_to couch_types_path , alert: "Error al eliminar" << @couch_type.errors.full_messages.to_sentence
    end
  end
end


