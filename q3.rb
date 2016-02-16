# include both cipher library
require_relative 'keyCipher'
require_relative 'railFenceCipher'

# init
continue_encrypt = false

# display user interface
puts  "==============================="
puts  "======Combination Script======="
puts  "==============================="

puts "Press 1 for text file input"
puts "Press 2 for string input"

# get decision from users 
decision = gets.chomp.to_i

# read file 
if decision == 1
	puts "Please enter the path of your file"
	filename = gets.chomp
	@plaintext = IO.read(filename)

# read plain text
elsif decision == 2
	puts "Please input your plaintext"
	@plaintext = gets
end

decision2 = 'y'
while decision2=='y'
	puts "Press 1 for Key Cipher Encryption"
	puts "Press 2 for Rail Fence Cipher Encryption"
	decisionToEncrypt = gets.chomp.to_i
	if decisionToEncrypt == 1
		puts "Please input the key: "
		key = gets.chomp
		text = KeyCipher.new(key)
			if continue_encrypt == false
				@encrypted = text.encrypt(@plaintext)
				@decrypted = text.decrypt(@encrypted)
				puts "Encrypted: " + @encrypted
				puts "Decrypted: " + @decrypted
			else
				@encrypted = text.encrypt(@encrypted)
				@decrypted = text.decrypt(@encrypted)
				puts "Encrpted: " + @encrypted
				puts "Decrypted: " + @decrypted
			end

		# ask user whether they want to export the cipher text
		puts "Do you want to export encrypted text? (y/n)"
		export = gets.chomp

		# export cipher text 
			if export == 'y'
				File.write('Encrypted(keyCipher).txt', @encrypted)
				puts "Exported to Encrypted(railFenceCipher).txt"
			end

	# railFence cipher 
	elsif decisionToEncrypt == 2
		puts "Please input the key: "
		key = gets.chomp.to_i
		text = RailFence.new(key)
			if continue_encrypt == false
				@encrypted = text.encrypt(@plaintext)
				@decrypted = text.decrypt(@encrypted)				
			else
				@encrypted = text.encrypt(@encrypted)
				@decrypted = text.decrypt(@encrypted)	
			end
		puts "Do you want to export encrypted text? (y/n)"
		export = gets.chomp

			if export == 'y'
				File.write('Encrypted(railFenceCipher).txt', @encrypted)
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
