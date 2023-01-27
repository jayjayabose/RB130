# rubocop:disable all
=begin
37 minutes: PEDA: 17M, Coding: 20M

PROBLEM
Description

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

equilateral - three sides the same length.
isosceles -  exactly two sides of the same length.
scalene - all sides of different lengths.

to be a triangle at all
  all sides must be of length > 0, 
  the sum of the lengths of any two sides must be greater than the length of the third side.

Input
Output
Rules:


EXAMPLES/TEST CASES
triangle = Triangle.new(2, 2, 2)
assert_equal 'equilateral', triangle.kind

triangle = Triangle.new(3, 4, 4)
assert_equal 'isosceles', triangle.kind

triangle = Triangle.new(3, 4, 5)
assert_equal 'scalene', triangle.kind

triangle = Triangle.new(3, 4, -5)
ArgumentError

triangle = Triangle.new(1, 1, 3)
ArgumentError

DATA STRUCTURES
class: Triangle
  attributes
    @sides: Array
      holds valid size arguments
  methods
    #initialize (side_1, side_2, side_3) -> new_triangle       
      returns new Triangle object
      raise ArgumentError
        1. any argument is less than zerio
          msg = "All sides of a triangle must be greater than zero."
        2. the longest side is greater than sum of other two
          msg = "The sum of the lengths of any two sides must be greater than the length of the third side."
    #kind() -> triangle_kind
      returns String:, one of; 'equilateral', 'isosceles', 'scalene'

ALGORITM
    #initialize (side_1, side_2, side_3) -> new_triangle
      validate(*args)
      init @sides to *args
            
    #validate(args)
      if arts.any? less than zero, raise error
      if args.sort[2] <= args[0..1].sum, raise error

    #kind() -> triangle_kind
      returns String:, one of; 'equilateral', 'isosceles', 'scalene'
      init unique_sides @sides.uniq
      case
        1
        2
        3      

=end
# rubocop:enable all
class Triangle
  def initialize(side1, side2, side3)
    args = [side1, side2, side3]
    validate_arguments(args)
    @sides = args
  end

  def kind
    case @sides.uniq.count
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end

  private

  def validate_arguments(args)
    if args.any? { |side| side < 0 }
      msg = "All sides of a triangle must be greater than zero."
      raise ArgumentError, msg
    elsif args.sort![0..1].sum <= args[2]
      msg = "The sum of the lengths of any two sides \n
      must be greater than the length of the third side."
      raise ArgumentError, msg
    end
  end
end
