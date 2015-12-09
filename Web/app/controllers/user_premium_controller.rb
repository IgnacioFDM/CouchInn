class UserPremiumController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  
  def index
    authorize UserPremium
  end
  
  def getpaid
    authorize UserPremium
    if params.has_key?(:dates) then
      begin
        @sdate = Date.parse(params[:dates][:start_date])
        @edate = Date.parse(params[:dates][:end_date])
      rescue
        redirect_to getpaidform_path, alert: "Debes ingresar dos fechas validas"
      else
        if @sdate > @edate then
          redirect_to getpaidform_path, alert: "La fecha fi no puede ser anterior a la fecha inicio"
        else
          income = UserPremium.where('paidtime >= ? AND paidtime <= ?', @sdate, @edate).count * 100        
          redirect_to getpaidform_path, notice: "Los ingresos entre #{@sdate} y #{@edate} fueron de $#{income}" 
        end
      end
    else
      redirect_to getpaidform_path, alert: "Debes ingresar dos fechas"
    end

  end
  
  def getpaidform
    authorize UserPremium
  end
  
  def setpaid
    authorize UserPremium
    cid = params[:id].to_i
    if cid == 0 then
      redirect_to setpaidform_path, alert: "ID inválido" 
    else
      coupon = UserPremium.where(coupon_id: cid).first
      if coupon.nil? then
        redirect_to setpaidform_path, alert: "ID inexistente" 
      else
        if coupon.paid == true then
          redirect_to setpaidform_path, alert: "Boleta ya paga"
        else
          coupon.paid = true
          coupon.paidtime = DateTime.current
          coupon_user = User.find(coupon.user_id)
          coupon.save
          
          if coupon_user.is_premium? then
            coupon_user.premium_expiration = coupon_user.premium_expiration + 1.months
          else
            coupon_user.premium_expiration = DateTime.current + 1.months
          end
          coupon_user.save
          
          redirect_to setpaidform_path, notice: "Se marcó exitosamente como paga la boleta de #{coupon_user.name}"
        end
      end
    end
  end
  
  def setpaidform
      authorize UserPremium
  end
  
  def create
    authorize UserPremium
    user_premium = UserPremium.new
    user_premium.user_id = current_user.id
    maxcoupon = UserPremium.maximum("coupon_id")
    if maxcoupon.nil? then
      maxcoupon = 0
    end
    maxcoupon += 1
    user_premium.coupon_id = maxcoupon
    user_premium.paid = false
    success = user_premium.save
    if success then
      redirect_to "https://www.CuentaDigital.com/api.php?id=573194&precio=100,00&venc=10&codigo=#{maxcoupon}&desde=premium@couchinn.com&hacia=#{current_user.email}&concepto=Un mes de premium en CouchInn (ID#{maxcoupon})&site=couchinn.com"
    else
      redirect_to user_premium_path , alert: "Error"
    end
  end
end
