=begin
The sample text's contents will be saved as a String to an instance variable in the starter class.

 And for this exercise we will swap all occurrences of 'a' with 'e'.
=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text.rb'

class TextTest < Minitest::Test

  def setup
    @file = File.open('sample_text.txt', 'r')
    @sample_text = @file.read
    @text = Text.new(@sample_text)

  end

  def test_swap
    expected_text = @sample_text.gsub(/a/, 'e')
    # expected_text = <<~TEXT.chomp
    # Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    # Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    # quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    # nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    # dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    # et verius meuris, et pheretre mi.
    # TEXT

    assert_equal(expected_text, @text.swap('a', 'e'))
  end

  def test_word_count
    expected_count = @sample_text.split.count
    assert_equal(expected_count, @text.word_count)
  end

  def tear_down
    @file.close
  end
end