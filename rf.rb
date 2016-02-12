require_relative 'railFenceCipher.rb'
# init value


puts "*** Rails Fence ***"
puts "Enter plain text:"
plain = gets
puts "Enter key:" 
key = gets.chomp.to_i


puts "Plain text: " + plain

text = RailFence.new(key)
rfEncrypted = text.encrypt(plain)

rfDecrypted = text.decrypt(rfEncrypted)



