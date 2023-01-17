=begin
Problem
  replace each name with rot13 transfored versin

Input: String (multi-line text)
Output String (multi-line text)
Rules
  each letter is replaced with letter at n+13 position
  maintina case
    need to loop around
  space characters are maintained
  line breaks are maintained

Data
 String (multi line)   
 Array 
  names 
    one line each
    with spaces
 String (multi line)   

A:
  given String that is multi line
  create Array of names
  iterate through each name
    transform each name via rot13
  join array with new lines and return

  LETTER_INDEX = ('a'..'z').to_a.freeze
  UPCASE_START_INDEX = 65
  DOWNCASE_START_INDEX = 97


  rot13(word)


    init output string
    iterate over each char
        if space return space
        set isCapitalLetter
        downcase letter
        set offset to letter index + 13 % 25 
        set new index
          capital
          lower case



end
=end
input = <<-INPUT
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
INPUT

names = input.split("\n")
# p names

LETTER_INDEX = ('a'..'z').to_a.freeze
UPCASE_ORD_START = 65
DOWNCASE_ORD_START = 97

def decipher(input)
  words = input.split("\n")
  words.map! { |word| rot13(word)}
  words.join("\n")
end

def rot13(word)
  output = ''
  word.each_char do |char|
    # if char == ' '
    if char =~ /[^a-zA-Z]/
      output << char
    else
      is_uppercase = char.upcase == char
      ord_offset = (LETTER_INDEX.index(char.downcase) + 13) % 26
      rot_13_ord = is_uppercase ? UPCASE_ORD_START + ord_offset : DOWNCASE_ORD_START + ord_offset
      output << rot_13_ord.chr
    end
  end
  output
end

# word = 'Nqn Ybirynpr'
# p rot13(word)

puts decipher(input)




