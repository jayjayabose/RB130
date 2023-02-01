# rubocop:disable all
=begin
12 total: PEDA
34 total
PROBLEM

Write a program that manages robot factory settings.

When robots come off the factory floor,they have no name. 
The first time you boot them up, a random name is generated, such as RX837 or BC811.

Reset: means that their name gets wiped. 
  The next time you ask, it will respond with a new random name.

The names must be random; 
they should not follow a predictable sequence. 
Random names means there is a risk of collisions. 
Your solution should not allow the use of the same name twice.

EXAMPLES / TEST CASES

RX 837
ll ddd

BC 811
ll ddd

DATA STRUCTURES
String: robot name

class: Robot
  @@names
  @name
  #initialize -> robot_obj
    creates robot 
    without name ? 
  #name -> name
    generate name and save if needed
    return name
  #reset -> ?
    sets name to nil
  #generate name -> name

ALGORITHM
  #initialize -> robot_obj
    @name = nil
  #name -> name
    genrate name if name is nil
    assign @name
    return @name

  #reset -> nil
    delete name from @@names
    @name = nil

  #assign name -> name
    init new_name = digits(2) + letters(3)
    loop
      break if new name is not in names
      reassing: new_name = digits(2) + letters(3)      
    push new_nameto @@names
    @name = new_name    
=end
# rubocop:enable all
class Robot
  @@names = []

  def initialize
    @name = nil
  end

  def name
    assign_name if @name.nil?
    @name
  end

  def reset
    @@names.delete @name
    @name = nil
  end

  private

  def assign_name
    loop do
      new_name = letters(2) + digits(3)
      unless @@names.include? new_name
        @@names << new_name
        @name = new_name
        break
      end
    end
  end

  def digits(n)
    (1..n).map { rand(0..9).to_s }.join
  end

  def letters(n)
    (1..n).map { rand(65..90).chr }.join
  end
end
