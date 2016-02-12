require_relative 'caesarCipher.rb'

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
		
