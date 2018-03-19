module ListingsHelper
  def grid_increment #In minutes
    30
  end

  def listings_times start_time = nil
    range = [] << start_time ||= Time.new(2000,1,1,6,0,0)
    47.times do |i|
      range << range.last + (60 * grid_increment)
    end
    range
  end

  def number_of_listings_slides
    listings_times.count / 4
  end

  def clock_time time_object
    time_object.strftime("%H:%M:%S")
  end

  # TODO Implement everything from here
  
  def adjust_duration duration
    grid_increment / duration
  end

  def grid_size duration
    grid_html = adjust_duration duration
  end
end
