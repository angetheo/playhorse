class StaffController < ApplicationController

	include AdminHelper

  def index
  	@staff = Staff.all
  	@staff_srl = @staff.where(division: 'srl').sort_by(&:order)
  	@staff_asd = @staff.where(division: 'asd').sort_by(&:order)
  end

  def show
    @person = Staff.find(params[:id])

    respond_to do |format|
      format.json { render json: @person }
    end
  end

  def create
    picture = params[:staff_picture].nil? ? "/assets/staff/profile-placeholder.png" : upload(params[:staff_picture].original_filename, params[:staff_picture].tempfile, 'playhorse-staff')

    Staff.create({
      name: params[:staff_name],
      division: params[:staff_division],
      role: params[:staff_role],
      order: params[:staff_order].to_i,
      picture: picture,
      facebook: params[:staff_facebook],
      mail: params[:staff_mail],
      phone: params[:staff_phone],
      linkedin: params[:staff_linkedin]
    })

    redirect_to(:back)
  end

  def update
    @staff = Staff.find(params[:id])
    
    @staff.name = params[:edit_staff_name]
    @staff.division = params[:edit_staff_division]
    @staff.role = params[:edit_staff_role]
    @staff.order = params[:edit_staff_order]
    @staff.facebook = params[:edit_staff_facebook]
    @staff.linkedin = params[:edit_staff_linkedin]
    @staff.mail = params[:edit_staff_mail]
    @staff.phone = params[:edit_staff_phone]
    @staff.picture = upload(params[:edit_staff_picture].original_filename, params[:edit_staff_picture].tempfile, 'playhorse-staff') unless params[:edit_staff_picture].nil? 

    @staff.save!
    redirect_to(:back)
  end

  def destroy
    Staff.delete(params[:id])
    redirect_to(:back)
  end
end
