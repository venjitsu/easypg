module ListingsHelper
  def hours_in_thirty_mins start_time = nil
    range = [] << start_time ||= Time.new(2000,1,1,6,0,0)
    47.times do |i|
      range << range.last + (60 * 30)
    end
    range
  end

  def number_of_listings_slides
    hours_in_thirty_mins.count / 4
  end

  def clock_time time_object
    time_object.strftime("%H:%M:%S")
  end
end
