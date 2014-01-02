class PalettesController < ApplicationController
  skip_filter :verify_authenticity_token, :create

  def index
    @palettes = Palette.recent
  end

  def new
    @palettes = Palette.recent
    @palette = Palette.new
    @palette.colors << Color.new()
    @palette.colors << Color.new().randomize
  end

  def create
    @palette = Palette.create(palette_params)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palette, include: :colors  }
    end
  end

  def fork
    @palette = Palette.find(params[:id])
  end

  def show
    @palette = Palette.find(params[:id])
  end

  private
    def palette_params
      params.require(:palette).permit(:author_id, :colors_attributes => [:hue, :sat, :val])
    end
end
