=begin

PROBLEM
Description:
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. 
The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, 
  which means that their name gets wiped. 
  The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. 
Random names means there is a risk of collisions. 
Your solution should not allow the use of the same name twice.

Input:  x
Output: x
Rules
  Robot
    created without name
    name created at bootup
    name is 
      randmom 
      matches to /^[A-Z]{2}\d{3}$/
        e.g. RX837 or BC811
      name cannot be used twice; never repeats accross instances
    can resest
      name is wiped
      next time name is asked, respond with new name


EXAMPLES / TEST CASES
Class: Robot
  Attributes;
    @@names - holds names in use
    @name
  Behaviors  
    #name 
      if @name is not assigned, genenerate name
      return @name
    #reset - clears @name

DATA STRUCTURES


ALGORITHM

Class: Robot
  Attributes;
    @@names - all robot names in use
    @name - robot name

  #name (getter, and will assign name if absent)
    if name is not assigned, 
      init new_name
      loop
         new_name =  generate name
        break unless name isin @@names        
      assign @name  to new_name
      push new_name to @@names
    return @name    
      
  #reset - clears @name
    remove @name from @@names (or not depending on requirements interpretation)
    set @name to nil

  private
=end
class Robot
  ALPHABET = ('A'..'Z').to_a.freeze

  @@names = []

  def name
    unless @name
      new_name = ''
      loop do
        new_name = generate_name
        break unless @@names.include? new_name
      end
      @@names << new_name
      @name = new_name
    end
    @name
  end

  def reset
    @@names.delete name
    self.name = nil
  end

  private

  attr_writer :name

  def generate_name
    name = ''
    2.times { name << ALPHABET.sample }
    3.times { name << rand(0..9).to_s }
    name
  end
end
