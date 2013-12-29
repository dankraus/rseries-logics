class PalettesController < ApplicationController
  skip_filter :verify_authenticity_token, :create

  def create
    #puts palette_params
    @palette = Palette.create(palette_params)
    #@palette = Palette.create(colors:[Color.create(hue:100, sat:50, val:50)])
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @palette, include: :colors  }
    end
  end

  def index
  end

  def show
  end

  private
    def palette_params
      params.require(:palette).permit(:author_id, :colors_attributes => [:hue, :sat, :val])
    end
end
