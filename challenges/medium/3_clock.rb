# rubocop:disable all
=begin
PEDA: 53m: C: 37m

PROBLEM
Create a clock that is independent of date.

You should be able to 
add minutes to and 
subtract minutes from the time represented by a given Clock object. 

Do not mutate Clock objects when adding and subtracting minutes
 -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; 
just use arithmetic operations.

EXAMPLES / TEST CASES
assert_equal '08:00', Clock.at(8).to_s
assert_equal '11:09', Clock.at(11, 9).to_s

clock = Clock.at(10) + 3
assert_equal '10:03', clock.to_s

clock = Clock.at(0) - 50
assert_equal '23:10', clock.to_s

DATA STRUCTURES
Integers
Strings
class: Clock
  ::at(hour, [min]) -> clock_obj
  #to_s -> hh:mm
  #+(min) -> na; -> new_clock_obj
    new clock with time = time of invoked clock + minutes
  #-(min) -> na; -> new_clock_obj
    new clock with time = time of invoked clock - minutes

ALGORITHM
  ::at(hour, [min]) -> clock_obj
    Input: Integer, hour, min
      hour: 0..23
      min: 0..59
    invokes Clock.new(hour, [min])

  #initialize (hour, min=0)
    input: Integer
    output: object
    rules
      init @min_of_day
      raise no errors

  #+(mins) -> new_clock_obj
    input: Integer, @hours, @mins
    output:
    rules:
      create new Clock
      time = existing time + mins

  #min_of_day(hour, [min]) -> minuteof day
    input: Integer, @hours, @mins
      hours: 0 or greater
      mins: 0 or greater
      no validation
    output: Integer: 0..1339 or 1..1440
    rules
      init total_minutes
        hours * MINUTES_PER_HOUR + mins
      total_minutes % MINUTES_PER_DAY

  #to_s
    input: Integer (@min_of_day)
      0..1339
    output: String
    rules
      return a string: hh:mm
      how to ensure leading zero??  <- Open Issue
    approach
      init hour, min @mins_of_day.divmod MINUTES_PER_HOUR
      convert to string

      "%02d" % hour
      "%02d" % minute

  #+(mins) -> new_clock_obj
    Input: Integer mins, Iteger @min_of_day
    Output: new Clock object
    Rules
      set time to current + mins
    Algo
      init: min_of_day_new = (@min_of_day + mins ) % MINUTES_PER_DAY   
      init hours, mins = min_of_day_new / HOURS_PER_DAY
      Clock.at_hour(hours, mins)
  

  OTHER
  wrap midnight
  srap hour
  handle more than a day
  keep military time    

=end
# rubocop:enable all
class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  
  def self.at(hours, mins=0)
    Clock.new(hours, mins)
  end

  def initialize(hours, mins)
    @min_of_day = get_min_of_day(hours, mins)
  end

  def to_s
    hours, mins = @min_of_day.divmod MINUTES_PER_HOUR
    "%02d" % hours + ':' + "%02d" % mins
  end

  def +(mins)
    min_of_day_new = (@min_of_day + mins) % MINUTES_PER_DAY
    hours, mins = min_of_day_new.divmod MINUTES_PER_HOUR
    Clock.at(hours, mins)
  end

  def -(mins)
    self.+(-mins)
  end

  def ==(other)
    @min_of_day == other.min_of_day
  end

  protected

  attr_reader :min_of_day

  private

  def get_min_of_day(hours, mins)
    hours * MINUTES_PER_HOUR + mins
  end
end
