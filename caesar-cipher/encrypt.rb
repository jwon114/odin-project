module Encrypt
  ALPHABET = ('a'..'z').to_a
  UPPER_ALPHABET = ('A'..'Z').to_a
  
  def Encrypt.caesar_cipher(string, shift)
    string.split('').map do |c|
      if c.match(/\w/)
        alpha = c == c.upcase ? UPPER_ALPHABET : ALPHABET
        new_index = alpha.index(c) + shift
        new_index > 25 ? alpha[new_index % 26] : alpha[new_index]        
      else
        c
      end
    end.join('')
  end
end