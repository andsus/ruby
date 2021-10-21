require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, filter)
    find_weeks(filter)
      .find{ |d| d.wday == day_name(day_of_week) }
  end

  private

  WEEK_RANGE = {
    first: 1..7,
    second: 8..14,
    third: 15..21,
    fourth: 22..28,
    teenth: 13..19,
    last: -7..-1    # last week of month
  }

  def day_name(weekday)
    week_days = %I[sunday monday tuesday wednesday thursday friday saturday]
    week_days.index(weekday)
  end

  def find_weeks(filter)
    start_date = Date.new(@year, @month, WEEK_RANGE[filter].first)
    end_date = Date.new(@year, @month, WEEK_RANGE[filter].last)

    start_date.upto(end_date)
  end  
end
