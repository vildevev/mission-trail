module ApplicationHelper
  def randomize_event
    @events = Event.all
    @events.select { |event| event.options.length != 0 && !event.seen? }
  end

  def instagram_check
    @game = Game.find(session[:id])
    @game.checked_instagram = true
    @num = rand(50)
    if @num >= 40
      @event = Event.find_by(name: "good-insta")
      @attr_change = @event.attr_change
    elsif @num < 40
      @event = Event.find_by(name: "bad-insta")
      @attr_change = @event.attr_change
    end
  end

  def regenerate_events
    @events = Event.all
    @events.each do |event|
      if event.options.length != 0 && event.seen? == true
        event.update_attributes(seen?: false)
      end
    end
  end

  def point_calculate
    @points = 40 + @game.battery + @game.money - @game.fomo
    @points = 0 if @points <= 0
    @points *= 97
    @points = 9999 if @points >= 9999
  end
end
