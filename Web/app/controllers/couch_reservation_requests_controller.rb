class CouchReservationRequestsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    authorize CouchReservationRequest
    @couch_reservation_request = CouchReservationRequest.new
    @couch_reservation_request.couch_post_id = params.require(:couch_post_id).to_i
  end

  def create
    authorize CouchReservationRequest
    parameters = params.require(:couch_reservation_request).permit(:start_date,:end_date,:amount,:couch_post_id)
    @couch_reservation_request = CouchReservationRequest.new 
    @couch_reservation_request.user_id = current_user.id
    @couch_reservation_request.couch_post_id = parameters[:couch_post_id]
    @couch_reservation_request.start_date = parameters[:start_date]
    @couch_reservation_request.end_date = parameters[:end_date]
    @couch_reservation_request.amount = parameters[:amount]
    success = @couch_reservation_request.save
    if success
      redirect_to couch_reservation_requests_path, notice: "Pedido hecho." 
    else
      redirect_to "/couch_reservation_requests/new?couch_post_id="<< parameters[:couch_post_id] , :alert =>"No se pudo hacer pedido: " << @couch_reservation_request.errors.full_messages.to_sentence
      return
    end

  end
    
  def update
    authorize CouchReservationRequest
  end

  def respond
    authorize CouchReservationRequest
    #quienes pueden y no pueden llamar a este metodo?
    parameters = params.require(:couch_reservation_request).permit(:accepted,:id)
    request = CouchReservationRequest.find(parameters[:id])
    request.accepted = parameters[:accepted]
    request.responded_at = DateTime.now
    if request.couch_post.user_id == current_user.id 
      if request.save
        msg = request.accepted ? "Pedido aceptado. El usuario solicitante te podrá contactar." : "Pedido rechazado."
        redirect_to couch_reservation_requests_path, notice: msg
      else
        redirect_to couch_reservation_requests_path, alert: "Error: "<< request.errors.full_messages.to_sentence
      end
    else
        redirect_to couch_reservation_requests_path, alert: "El usuario logueado no es dueño de este Couch!"
    end
  end

  def destroy
    authorize CouchReservationRequest
  end

  def index
    authorize CouchReservationRequest
    @my_requests = CouchReservationRequest.requests_made_by_user(current_user.id)
  end

  def foreign_requests_index
    authorize CouchReservationRequest
    @foreign_requests = CouchReservationRequest.requests_made_to_user(current_user.id)
  end

  def show
    authorize CouchReservationRequest
  end

end

