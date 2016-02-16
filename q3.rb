# include both cipher library
require_relative 'keyCipher'
require_relative 'railFenceCipher'

require 'micro-optparse'


puts  "==============================="
puts  "======Combination Script======="
puts  "==============================="
if options[:interactive]
	puts "Press 1 for text file input"
	puts "Press 2 for string input"

	# get decision from users 
	decision = gets.chomp.to_i

	# 
	if decision == 1
		puts "Please enter the path of your file"
		filename = gets.chomp
		@plaintext = IO.read(filename)

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
	end
else
	if options[:input_filename] != ""
		@plaintext = IO.read(options[:input_filename])
	else
		@plaintext = options[:text]
	end

	# puts @plaintext
	keyCipher = KeyCipher.new(options[:ky_key])
	

	@encrypted = @plaintext
	for character in options[:encryption_method].split("")
		puts character
		if character == 'k'
			@encrypted = keyCipher.encrypt(@encrypted)
			@decrypted = keyCipher.decrypt(@encrypted)
			puts "Encrypted: " + @encrypted
			puts "Decrypted: " + @decrypted
		elsif character == 'r'
			rfCipher = RailFence.new(options[:rf_key])
			@encrypted = rfCipher.encrypt(@encrypted)
			@decrypted = rfCipher.decrypt(@encrypted)
			puts "Encrypted WTF:  " + @encrypted
			puts "Decrypted WTF: " + @decrypted
		end
	end

	if options[:output_filename] != ""
		File.write(options[:output_filename], @encrypted)
	end
end

	
#calling rf.rb script directly
#system("ruby","rf.rb");
