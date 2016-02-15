require_relative 'caesarCipher'
require_relative 'railFenceCipher'

#init
continue_encrypt = false

puts  "==============================="
puts  "======Combination Script======="
puts  "==============================="

puts "Press 1 for text file input"
puts "Press 2 for string input"

decision = gets.chomp.to_i
if decision == 1

elsif decision == 2
	puts "Please input your plaintext"
	@plaintext = gets
end

decision2 = 'y'
while decision2=='y'
	puts "Press 1 for Caesar Cipher Encryption"
	puts "Press 2 for Rail Fence Cipher Encryption"
	decisionToEncrypt = gets.chomp.to_i
	if decisionToEncrypt == 1
		puts "Please input the key: "
		key = gets.chomp
		text = Caesar.new(key)
			if continue_encrypt == false
				@encrypted = text.encrypt(@plaintext)
				@decrypted = text.decrypt(@encrypted)
				
			else
				@encrypted = text.encrypt(@plaintext)
				@encrypted = text.decrypt(@encrypted)
				puts "test: " + @encrypted
			end


	elsif decisionToEncrypt == 2
		puts "Please input the key: "
		key = gets.chomp.to_i
		text = RailFence.new(key)
			if continue_encrypt == false
				@encrypted = text.encrypt(@plaintext)
				@decrypted = text.decrypt(@encrypted)
			else
				if @encrypted.nil?
					puts "null"
				end
				@encrypted = text.encrypt(@encrypted)
				@decrypted = text.decrypt(@encrypted)	
			end

	end

	puts "Press y to encrypt again, n to end the encryption"
	decision2 = gets.chomp


	if decision2 == 'y'
		continue_encrypt = true
		
	end

end
	
#calling rf.rb script directly
#system("ruby","rf.rb");
