require 'io/console'
class KeyCipher
  def initialize(key,alphabet = ('a'..'z').to_a)
  	# split keys and find unique alphabets
    key_array = key.split("").uniq
    # combine unique alphabets with the remaining alphabets 
    @decrypt = alphabet.join
    puts @decrypt
    # replace alphabets with key in equivalent position 
    @encrypt = (key_array + ( alphabet - key_array )).join
  end

  def encrypt(string)
    # returns string with the characters in first param replaced by the corresponding characters in second param
    return string.downcase.tr(@decrypt,@encrypt)
  end

  def decrypt(string)
     # returns string with the characters in first param replaced by the corresponding characters in second param 
    return string.downcase.tr(@encrypt, @decrypt)
  end
end