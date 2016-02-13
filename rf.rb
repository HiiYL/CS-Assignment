require_relative 'railFenceCipher.rb'
# init value


puts "*** Rails Fence ***"
puts "Enter plain text:"
plain = gets
puts "Enter key:" 
key = gets.chomp.to_i

#code below is to concatenate strings, removing space characters


puts "Plain text: " + plain

text = RailFence.new(key)

rfEncrypted = text.encrypt(plain)

rfDecrypted = text.decrypt(rfEncrypted)

puts rfEncrypted
puts rfDecrypted
