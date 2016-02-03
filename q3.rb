
puts  "==============================="
puts  "======Combination Script======="
puts  "==============================="

puts "Press 1 for text file input"
puts "Press 2 for string input"

decision = gets.chomp.to_i
if decision == 1

elsif decision == 2
	puts "Please input your plaintext"
	plaintext = gets.chomp
end

puts "Press 1 for Caesar Cipher Encryption"
puts "Press 2 for Rail Fence Cipher Encryption"
decisionToEncrypt = gets.chomp.to_i
if decisionToEncrypt == 1
	puts "Please input the key: "
	key = gets.chomp
	text = Caesar.new(key)
	puts text.encrypt(plaintext)
elsif decisionToEncrypt == 2

end 
	
#calling rf.rb script directly
#system("ruby","rf.rb");
