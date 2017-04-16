class EventsController < ApplicationController
  include ApplicationHelper
  def index
    if randomize_event.length == 0
      regenerate_events
    end
    @event = randomize_event.sample
    @event.update_attributes(seen?: true)
    redirect_to event_path(@event)
  end

  def show
    @game = Game.find(session[:id])
    @event = Event.find(params[:id])
  end
end
