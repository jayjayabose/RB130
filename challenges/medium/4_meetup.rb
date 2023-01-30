# rubocop:disable all
=begin
PEDA: 55m, C: 45: 
PROBLEM
Construct objects that represent a meetup date. 
Each object takes 
  a month number (1-12) and 
  a year (e.g., 2021). 
  
Object should  determine the exact date of the meeting in the specified month and year. 
2nd Wednesday of May 2021
=> 12th of May, 2021.

days_of_week: 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'
descriptors:  'first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth'
  first: 1
  second: 2
  third: 3
  fourth: 4
  fifith: 5
  last: ?
  teenth: day is in (13..19)

EXAMPLES / TEST CASES
    meetup = Meetup.new(2013, 3)
    assert_equal Date.civil(2013, 3, 4), meetup.day('Monday', 'first')

DATA STRUCTURES
Integers
String
Date
Collection to lookup days and day numbers e.g. Monday; 1

class: Meetup
  #initialize(year, month) -> meetup_obj
  #day(day_of_week, descriptor) -> date_obj

ALGORITHMN
  #initialize(year, month) -> meetup_obj
  Input: Integers
  Output: object
  Rules
    raise no errors
    input
      year: > 0
      month: 1..12
    save year and month to state

  #day(day_of_week, descriptor) -> date_obj
  Input: String, String
  Output: Date object
  Rules
    find the day of the month that has
      day of week = day_of_week
      and is the nth occurance, per descriptor
    create ane return a corresponding date object

  Approach A:
    get day of week for first day of month
    find date for first occurance of day_of_week
      add 7 n number of times
    create date object and return

  Approach B:
    DAY_OF_WEEK_NUMBERS = {
      'monday'=>1, 
      ...
    }

    init: date: date (@year, @month)
    init: Array: days
    init: day_of_week_number  = DAY_OF_WEEK_NUMBERS[day_of_week.downcase]

    1. create array of dates where day is day_of_month
      # while date.month == @month
        if date.wday == day_of_week_number
          days << date.day
            #Returns the day of the month (1-31).
        date = date.next_day

    2. Select the date based on descriptor
        init meetup_date = 
        case @descriptor
            first: 0
            second: 1
            third: 2
            fourth: 3
            fifith: 4
            last: .last
            teenth: (13..19)
    3. create ane return date
        return nil if meetup_date.nil?
        date (@year, meetup_date)

  Questions: 
    do we need to handle "invlaid inputs"


Reference      
#next_day([n=1]) → date
#cwday → fixnumclick to toggle source
  Returns the day of calendar week (1-7, Monday is 1).

Date::DAYNAMES.rotate(1)

=end
# rubocop:enable all
require 'date'

class Meetup
  DAY_OF_WEEK_NUMBERS = {
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6,
    'sunday' => 0
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, descriptor)
    day_of_week_number = DAY_OF_WEEK_NUMBERS[day_of_week.downcase]
    potential_days = get_potential_days(day_of_week_number)
    meetup_date = get_actual_day(potential_days, descriptor)
    meetup_date.nil? ? nil : Date.civil(@year, @month, meetup_date)
  end

  private

  def get_potential_days(day_of_week_number)
    date = Date.new(@year, @month)
    output = []
    while date.month == @month
      output << date.day if date.wday == day_of_week_number
      date = date.next_day
    end
    output
  end

  def get_actual_day(potential_days, descriptor)
    case descriptor.downcase
    when 'first' then potential_days[0]
    when 'second' then potential_days[1]
    when 'third' then potential_days[2]
    when 'fourth' then potential_days[3]
    when 'fifth' then potential_days[4]
    when 'last' then potential_days.last
    when 'teenth'
      potential_days.find { |n| (13..19).cover? n }
    end
  end
end
