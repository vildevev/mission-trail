class GooglemapsController < ApplicationController
  include ApplicationHelper

  def index
    @game = Game.find(session[:id])
    @game.update_attributes(checked_googlemaps: true)
    @event_array = Event.google_maps.where(seen?: false)
    if @event_array.empty?
      Event.reset_google_maps
      @event_array = Event.google_maps
    end
    @event = @event_array.sample
    @event.update_attributes(seen?: true)
    redirect_to googlemap_path(@event)
  end

  def show
    @game = Game.find(session[:id])
    @event = Event.find(params[:id])
  end

  def update

  end

end
