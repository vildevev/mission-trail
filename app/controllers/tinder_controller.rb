class TinderController < ApplicationController
  include ApplicationHelper

  def index

    @game = Game.find(session[:id])
    @game.update_attributes(checked_tinder: true)
    @event_array = Event.tinder.where(seen?: false)
      if @event_array.empty?
        Event.reset_tinder
        @event_array = Event.tinder
      end
    @event = @event_array.sample
    @event.update_attributes(seen?: true)
    redirect_to tinder_path(@event)
  end

  def show
    @game = Game.find(session[:id])
    @event = Event.find(params[:id])
  end

end
