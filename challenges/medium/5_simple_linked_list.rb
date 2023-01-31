# rubocop:disable all
=begin
total: 25m processed test cases
total 45 impemented Element (lost time on #next bug)
total 1:20 pop and push
total: 2:00 to_a (stumped with a bug )
total 2:25 from_a (15 minutes on looping problems)


PROBLEM
Write a simple linked list implementation. 
Each element in the list contains 
  data and a 
  "next" field pointing to the next element in the list of elements. 

This variant of linked lists is often used to represent sequences 
or push-down stacks (also called a LIFO stack; Last In, First Out).

elements may contain a range of data such as the numbers 1-10. 
Provide methods to 
  reverse the linked list and 
  convert a linked list to array
  convert from an array.

EXAMPLES / TEST CASES

element = Element.new(1)
assert_equal 1, element.datum


DATA STRUCTURES
class: Element
  attributes: @datum, @next
  #initialize(datum, [element]) -> element_obj
    saves datum
    init next to nil or element
  #datum -> datum
  #next -> next
  #tail? -> boolean
    true if next is nil

class: SimpleLinkedList
  attributes: @head, @size
  #initialize() -> list_obj
    init size to 0
  #empty? -> booean
    true if size is 0
  #peek() -> head.datum ?
      1 after push(1), nil if nothing added to list
  #head -> head_element
    @head
  #push(datum) -> list.size
    create Element, assign to head, update size
  #pop -> popped_element_datum
    remove element from head, reassign head, udpate size
  #from_a(array) -> list_obj
    array may be: empty, nil
    [1, 2] => head is 1 (i.e process by popping array)
  #to_a() -> array
    return [] if empty?
    return [head_datam, datum, ...]
  #reverse -> new_list_obj
    tail set to head, links changed (?)

ALGORITHM
  #push
    Input: any object representing datum
    Output: list.size
    Rules:
      create element        
      if head is not nil
        assign element.next to head, 
      assign element to head
      increase size by one
  #peek
    Input: none
    Output: nil or object.datum.datum
    Rules
    if head is not nil
      return head.datum.datum
    else nil
  #pop
    Input: none
    Output: Element or nil
    Rules
      if head is nil
        return nil
      retrun head
      reset head to what was head.next
    Algo:
      return nil if head is nil
      init return_datum to head.datum
      if head.next is not nil
        #reset head
        head = head.next
      size -= 1
      return_datum
  #from_a(array) -> list_obj
    Input: Array
      nil
      []
    Output: List
    Rules
      Create a new liset
      One Element for each Array Element
      Proceed fom last to first in array (e.g. #pop)
        array.first will be head
    ALGO
      create new list()
      return if input is [] or nil
        nil, [] => size == 0; head == nil
      
      duplicate array
      pop each element from array
        create Element with datum == element
        push Element
      retrn list

  #to_a() -> array
    Input: 
    Output:
    Rules:
      return [] if empty?
      return array
        element.datum as elements
        element.first is head.datum
    Algo
      return [] if empty
      init current_element = head

      iterate through head element
        push head.datum
        current_element = current_element.next
        break current element is tail
      return array

  #reverse -> new_list_obj
    Input: na
    Output: new List object
    Rules;
        retun [] if empty
        list object containes all element        
        order of elements is reversed
        tail is set to head
    ALGO
      init array self#to_a
      List::from-array array.reverse
=end
# rubocop:enable all
class Element
  attr_reader :datum

  def initialize(datum, next_element=nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    @next_element.nil? ? true : false
  end

  def next
    @next_element
  end

  def next=(next_element)
    @next_element = next_element
  end
end

class SimpleLinkedList
  attr_reader :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def empty?
    @size.zero?
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def push(datum)
    new_element = Element.new(datum)
    new_element.next = @head unless empty?
    self.head = new_element
    self.size += 1
  end

  def pop
    return nil if head.nil?
    return_datum = head.datum
    self.head = head.next unless head.next.nil?
    self.size -= 1
    return_datum
  end

  def self.from_a(array)
    list = SimpleLinkedList.new()
    return list if array.nil? || array.empty?
    array = array.dup
    until array.empty?
      list.push(array.pop)
    end
    list
  end

  def to_a
    return [] if empty?
    current_element = head
    output = []
    loop do
      output << current_element.datum
      break if current_element.tail?
      current_element = current_element.next
    end
    output
  end

  def reverse
    array = to_a
    SimpleLinkedList.from_a(array.reverse)
  end

  private

  attr_writer :head, :size
end
