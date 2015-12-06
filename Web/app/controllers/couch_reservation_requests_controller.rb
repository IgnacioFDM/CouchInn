class CouchReservationRequestsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    authorize CouchReservationRequest
    couch_post_id = params.require(:couch_post_id).to_i
    if CouchPost.find(couch_post_id).user_id.equal? current_user.id
      redirect_to :back, alert: "No se puede reservar un Couch propio!"
      return
    end

    @couch_reservation_request = CouchReservationRequest.new
    @couch_reservation_request.couch_post_id = couch_post_id
  end

  def create
    authorize CouchReservationRequest
    r = CouchReservationRequest.new 
    r.user_id = current_user.id
    r.attributes = params.require(:couch_reservation_request).permit(:start_date,:end_date,:amount,:couch_post_id)

    success = r.save
    if success
      redirect_to couch_reservation_requests_path, notice: "Pedido hecho." 
    else
      redirect_to :back , :alert =>"No se pudo hacer pedido: " << r.errors.full_messages.to_sentence
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
        redirect_to "/foreign_requests_index", notice: msg
      else
        redirect_to "/foreign_requests_index", alert: "Error: "<< request.errors.full_messages.to_sentence
      end
    else
        redirect_to "/foreign_requests_index", alert: "El usuario logueado no es dueño de este Couch!"
    end
  end

  def destroy
    authorize CouchReservationRequest
  end

  def index
    authorize CouchReservationRequest
    @my_requests = CouchReservationRequest.requests_made_by_user(current_user.id)
    @start_date = Date.current
    @end_date = Date.current
    @accept = false
  end

  def date_filter_results
    authorize CouchReservationRequest
    @start_date = Date.parse(params[:dates][:from_date])
    @end_date = Date.parse(params[:dates][:to_date])
       @accept = (params[:accept])
       @my_requests = CouchReservationRequest.requests_made_by_user_during_timespan(current_user.id, @start_date, @end_date, @accept)
  end

  def foreign_requests_index
    authorize CouchReservationRequest
    @foreign_requests = CouchReservationRequest.requests_made_to_user(current_user.id)
  end

  def show
    authorize CouchReservationRequest
  end

end

