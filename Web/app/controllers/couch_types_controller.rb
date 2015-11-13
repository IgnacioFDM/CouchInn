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

    unless already_exists?(params["couch_type"]["name"]) 
      @couch_type = CouchType.create(params.require(:couch_type).permit(:name))
      if @couch_type.valid?
        redirect_to couch_types_path, :notice => "Tipo creado."
      else
        redirect_to couch_types_path, :alert => "No se pudo crear el tipo. " << @couch_type.errors.full_messages.to_sentence
      end
    else
        redirect_to couch_types_path, :alert => "Nombre ya esta tomado."
    end
  end

  def edit
    authorize CouchType
    @couch_type = CouchType.find(params[:id])
  end

  def update
    authorize CouchType

    unless already_exists?(params["couch_type"]["name"]) 
      @couch_type = CouchType.find(params[:id])
      if @couch_type.update_attributes(params.require(:couch_type).permit(:name))
        redirect_to couch_types_path, :notice => "Tipo actualizado."
      else
        redirect_to couch_types_path, :alert => "Error al actualizar."
      end
    else
        redirect_to couch_types_path, :alert => "Nombre ya esta tomado."
    end
  end

  def destroy
    authorize CouchType
    couch_type = CouchType.find(params[:id])
    if couch_type.couch_posts.empty?
      if couch_type.destroy
        redirect_to couch_types_path, :notice => "Tipo eliminado."
      end
    else
      redirect_to couch_types_path, :alert => "No se puede eliminar, existen Couches de ese tipo."
    end
  end

  private
  def already_exists?(name)
    CouchType.where("lower(name) = ?", name.downcase).count > 0
  end

end
