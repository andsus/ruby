class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  private_constant :HOURS_PER_DAY, :MINUTES_PER_HOUR, :MINUTES_PER_DAY

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * MINUTES_PER_HOUR + minute).modulo(MINUTES_PER_DAY)
  end

  def +(other)
    Clock.new(minute: minutes + other.minutes)
  end

  def -@
    Clock.new(minute: -minutes)
  end

  def -(other)
    self + -other
  end

  def ==(other)
    other.minutes == minutes
  end

  def to_s
    hour, minute = minutes.divmod(MINUTES_PER_HOUR)
    '%<hour>02i:%<minute>02i' % { hour: hour, minute: minute }
  end

  protected

  attr_reader :minutes
end
