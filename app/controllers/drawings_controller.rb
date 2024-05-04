
class DrawingsController < ApplicationController
    def create
      @drawing = Drawing.new(drawing_params)
      if @drawing.save
        ActionCable.server.broadcast "draw_channel", @drawing
      end
    end
  
    private
  
    def drawing_params
      params.require(:drawing).permit(:x, :y, :state)
    end
  end
  