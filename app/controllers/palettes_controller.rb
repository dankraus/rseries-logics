class PalettesController < ApplicationController
  skip_filter :verify_authenticity_token, :create

  def index
    @palettes = Palette.recent
  end

  def new
    @palettes = Palette.recent
  end

  def create
    #puts palette_params
    @palette = Palette.create(palette_params)
    #@palette = Palette.create(colors:[Color.create(hue:100, sat:50, val:50)])
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @palette, include: :colors  }
    end
  end

  def show
    @palette = Palette.find(params[:id])
  end

  private
    def palette_params
      params.require(:palette).permit(:author_id, :colors_attributes => [:hue, :sat, :val])
    end
end
