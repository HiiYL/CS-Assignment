# init value
puts "*** Rails Fence ***"
puts "Enter plain text:"
plain = gets
puts "Enter key:" 
key = gets.chomp.to_i

plain_len = plain.length-1
puts "Plain text: " + plain

cipher=[]
cur_line=0
skip=0

while cur_line < key-1 
  skip=2*(key-cur_line-1)
  j=0
  i=cur_line
  while i < plain_len
    cipher.push(plain[i])
    if (cur_line==0 || j%2 == 0)
      i=i+skip
    else 
      i=i+2*(key-1)-skip
    end
    j=j+1
  end
  cur_line=cur_line+1
end

i=3
while i < plain_len
  cipher.push(plain[i])
  i+=2*(key-1)
end

output = cipher.join()
puts "Encrpyted: " + output