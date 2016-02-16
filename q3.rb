# include both cipher 
require_relative 'keyCipher'
require_relative 'railFenceCipher'

# include non interactive mode library
require 'micro-optparse'

# non interactive mode -help 
options = Parser.new do |p|
  p.version = "fancy script version 1.0"
  p.option :interactive, "turn on interactive mode"
  p.option :encryption_method, "defines what encryption and in what order [ k - key cipher ] [ r - railfence ]", default: "", value_matches: /[k|r]*/i
  p.option :input_filename, "input file to process", :default => ""
  p.option :output_filename, "output file for encrpyted", :default => ""
  p.option :rf_key, "key for railfence", default: 123
  p.option :ky_key, "key for key cipher", default: "kappa"
  p.option :text, "text to encrypt", default: ""
end.process!

# init
continue_encrypt = false

puts  "==============================="
puts  "======== Cipher System ========"
puts  "==============================="

puts "Press 1 for Encryption"
puts "Press 2 for Decryption"

# get user selection
decision_cipher = gets.chomp.to_i

# encryption 
if decision_cipher == 1
	if options[:interactive]
	puts  "==============================="
	puts  "======Combination Script======="
	puts  "==============================="

	# non interactive option -i. 
	
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
elsif decision_cipher == 2
	while decision_cipher == 2
		puts "Please enter the path of your file"
		filename = gets.chomp
		@encryptedText = IO.read(filename)
		
		puts "1- Key Decryption"
		puts "2- RailFence Decryption"
		decision2 = gets.chomp.to_i
		if decision2==1
			puts "Please input the key: "
			key = gets.chomp
			text = KeyCipher.new(key)
			@decryptedText = text.decrypt(@encryptedText)
			puts @decryptedText
		else 
			puts "Please input the key: "
			key = gets.chomp.to_i
			text = RailFence.new(key)
			@decryptedText = text.decrypt(@encryptedText)
		end

		puts "Press 2 for further decryption"
		decision_cipher = gets.chomp.to_i
	end
end
	
#calling rf.rb script directly
#system("ruby","rf.rb");