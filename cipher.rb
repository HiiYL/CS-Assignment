class Caesar
  def initialize(key,alphabet = ('a'..'z').to_a)
  	# To do encryption, type in ruby cipher.rb <key> <plaintext>
    key_array = key.split("").uniq
    @decrypt = alphabet.join
    @encrypt = (key_array + ( alphabet - key_array )).join
  end

  def encrypt(string)
    string.downcase.tr(@decrypt,@encrypt)
  end

  def decrypt(string)
    string.downcase.tr(@encrypt, @decrypt)
  end
end
c = Caesar.new(ARGV[0])
puts c.encrypt(ARGV[1])
puts c.decrypt(c.encrypt(ARGV[1]))