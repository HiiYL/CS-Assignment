require 'io/console'
class KeyCipher
  def initialize(key,alphabet = ('a'..'z').to_a)
  	# To do encryption, type in ruby cipher.rb <key> <plaintext>
    key_array = key.split("").uniq
    @decrypt = alphabet.join
    @encrypt = (key_array + ( alphabet - key_array )).join
  end

  def encrypt(string)
    return string.downcase.tr(@decrypt,@encrypt)
  end

  def decrypt(string)
    return string.downcase.tr(@encrypt, @decrypt)
  end
  
end