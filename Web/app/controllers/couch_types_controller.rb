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
    @couch_type = CouchType.find_or_initialize_by(parameters.permit(:name))
    @couch_type.disabled = parameters[:disabled]
    if @couch_type.save
      redirect_to couch_types_path , notice: "Tipo creado o ya existente."
    else
      redirect_to couch_types_path , alert: "No se pudo crear tipo."
    end
  end

  def edit
    authorize CouchType
    @couch_type = CouchType.find(params[:id])
  end

  def update
    authorize CouchType
    @couch_type = CouchType.find(params[:id])

    if CouchType.where(:name => params[:couch_type][:name].downcase).count > 0 && CouchType.where(:name =>params[:couch_type][:name].downcase).first.id != params[:id].to_i
      redirect_to @couch_types, notice: "Nombre tomado."
    else
     
      @couch_type.update_attributes(params.require(:couch_type).permit(:name,:disabled))
      if @couch_type.valid?
        redirect_to couch_types_path , notice: "Tipo actualizado"
      else
        redirect_to couch_types_path , notice: "Error al actualizar" 
      end
    end

  end

  def destroy
    authorize CouchType

    couch_type = CouchType.find(params[:id])
    couch_type.destroy!
    redirect_to couch_types_path , notice: "Tipo eliminado"
  end


end


