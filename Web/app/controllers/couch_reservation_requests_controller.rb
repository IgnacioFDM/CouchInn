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

  def destroy
    authorize CouchReservationRequest
  end

  def index
    authorize CouchReservationRequest
  end

  def show
    authorize CouchReservationRequest
  end

end
