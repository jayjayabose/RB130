# rubocop: disable all
=begin
PEDA: 27m total
60M algo for all methods
1:21 tests passed

PROBLEM
Define your own set type.
Assume that all elements of a set must be numbers.
Ruby docs: a collection of unordered values with no duplicates

EXAMPLES / TEST CASES
see test cases

   set = CustomSet.new([1, 2, 3])
   set.subset?(CustomSet.new([4, 1, 2, 3])) # => true
     #each element of set is found in argument

DATA STRUCTURES
class CustomSet
  #initialize([array]) -> set_obj
    saves elements of array
    ? what data structure
    ? if no argument supplied, then what
  #empty? -> boolean
    true if no elements in set
  #contains(number) -> boolean
  #subset?(other_set) -> boolean
    true if each element of set is found in argument
    ? empty set cases
  #disjoint(other_set) -> boolean
    true if no elements in common
    empty, empty => true
  #eql?(other_set) -> boolean
    true if same unique elements in set and given other_set
  #add(number) -> number
    adds given number to the set
  #intersection(other_set) -> set_common_elements
    Returns a new set containing elements common to the set and the given enumerable object.
  #difference(other_set)
    Returns a new set built by duplicating the set, removing every element that appears in the given enumerable object.
  #union(other_set)
    Returns a new set built by merging the set and the elements of the given enumerable object.
  #==(other_set) -> boolean
    true if both sets have same elements
    

ALGORITHM
  #subset?(other_set) -> boolean
  Input: Set
  Output: Boolean
  Rules
    Returns true if the set is a subset of the given set.
      every element in set is in other_set
      or set is empty
      empty (empty)
      empty (not empty)
    
    false
      not empty (empty)
  ALGO
    return true if empty?
    else false if other_set.empty?
    set.count {found in other_set} == @set.se

  #disjoint(other_set) -> boolean
    true if no elements in common
      set & other_set.set = []

  #eql?(other_set) -> boolean
    true if same unique elements in set and given other_set
      set.sort  == other_set.sort    

  #add(number) -> self
    adds given number to the set
      return updated set (self)
      @set << number unless @set.include? number      

  #intersection(other_set) -> set_common_elements
    Returns a new set containing elements common to the set and the given enumerable object.
      set & other_set

  #difference(other_set)
    Returns a new set built by duplicating the set, removing every element that appears in the given enumerable object.
      set - other_set

  #union(other_set)
    Returns a new set built by merging the set and the elements of the given enumerable object.
      set | other_set  

  #==(other_set) -> boolean
    true if both sets have same elements    
    @set == other_set.set

  protected
    #set
    #include?(number)
=end
# rubocop: enable all
class CustomSet
  def initialize(numbers=[])
    @set = numbers.uniq
  end

  def empty?
    @set.size.zero?
  end

  def contains?(number)
    @set.include? number
  end

  def subset?(other_set)
    return true if @set.empty?
    return false if other_set.empty?
    @set.count { |num| other_set.include? num } == @set.size
  end

  def disjoint?(other_set)
    @set & other_set.set == []
  end

  def eql?(other_set)
    return false unless @set.size == other_set.set.size
    @set.sort == other_set.set.sort
  end

  def add(number)
    @set << number unless @set.include? number
    self
  end

  def intersection(other_set)
    CustomSet.new(@set & other_set.set)
  end

  def difference(other_set)
    CustomSet.new(@set - other_set.set)
  end

  def union(other_set)
    CustomSet.new(@set | other_set.set)
  end

  def ==(other_set)
    eql? other_set
  end

  protected

  attr_reader :set

  def include?(number)
    @set.include? number
  end
end
