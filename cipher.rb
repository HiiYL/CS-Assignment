require 'io/console'
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

puts "*** Caesar Cipher ***"
puts "Please Input a key: "
key = gets.chomp
puts "Type 1 for text file input"
puts "Type 2 for string input"

decision = gets.chomp.to_i
if decision==1
	puts "Please input a text file: "
	filename = gets.chomp
	plaintext = IO.read(filename)
	puts plaintext
	text = Caesar.new(key)
	puts text.encrypt(plaintext)
elsif decision==2 
	puts "Please input plaintext: "
	plaintext = gets.chomp
	text = Caesar.new(key)
	puts text.encrypt(plaintext)

end
		
