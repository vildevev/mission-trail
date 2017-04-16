class InstagramController < ApplicationController
  include ApplicationHelper

  def index
    @game = Game.find(session[:id])
    @game.update_attributes(checked_instagram: true)
    @event_array = Event.instagram.where(seen?: false)
    if @event_array.length == 0
      Event.instagram.each do |insta|
        insta.update_attributes(seen?: false)
      end
      @event_array = Event.instagram
    end
    @event = @event_array.shuffle.pop
    @event.update_attributes(seen?: true)
    redirect_to instagram_path(@event)
  end

  def show
    @game = Game.find(session[:id])
    @event = Event.find(params[:id])
  end

end
