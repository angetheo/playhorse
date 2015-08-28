class HorsesController < ApplicationController

	include AdminHelper

  def index
  	@horses = Horse.all.sort_by(&:created_at).reverse
  end

  def show
  	@horse = Horse.find(params[:id])

  	respond_to do |format|
      format.json { render json: @horse }
    end
  end

  def create
    picture = params[:horse_picture].nil? ? "" : upload(params[:horse_picture].original_filename, params[:horse_picture].tempfile)

    Horse.create({
      name: params[:horse_name],
      father: params[:horse_father],
      mother: params[:horse_mother],
      year_of_birth: params[:horse_year_of_birth],
      nation: params[:edit_horse_nation],
      category: params[:horse_category],
      description: params[:horse_description],
      cv_url: params[:horse_cv_url],
      video: "https://www.youtube.com/embed/#{youtube_id(params[:horse_video])}",
      picture: picture
    })

    redirect_to(:back)
  end

  def update
  	@horse = Horse.find(params[:id])

  	@horse.name = params[:edit_horse_name]
  	@horse.father = params[:edit_horse_father]
  	@horse.mother = params[:edit_horse_mother]
  	@horse.year_of_birth = params[:edit_horse_year_of_birth]
  	@horse.nation = params[:edit_horse_nation]
  	@horse.category = params[:edit_horse_category]
  	@horse.description = params[:edit_horse_description]
  	@horse.cv_url = params[:edit_horse_cv_url]
  	@horse.video = "https://www.youtube.com/embed/#{youtube_id(params[:edit_horse_video])}"
  	@horse.picture = upload(params[:edit_horse_picture].original_filename, params[:edit_horse_picture].tempfile) unless params[:edit_horse_picture].nil?

  	@horse.save!
	redirect_to(:back)
  end

  def destroy
    Horse.delete(params[:id])
    redirect_to(:back)
  end
end
