# init value
class RailFence
  
  def initialize()
    @cipher=[]
    @cur_line=0
    @skip=0
  end

  #loop below is to loop from top to 2nd bottom case
  def encrypt(plain,key)
    plain_len = plain.length-1
    while @cur_line < key-1 
      #loop through each level in rail fence
      @skip=2*(key-@cur_line-1)
      #how many numbers to skip in rail fence
      j=0
      i=@cur_line
      while i < plain_len
        @cipher.push(plain[i])
        if (@cur_line==0 || j%2 == 0)
          i=i+@skip
        else 
          i=i+2*(key-1)-@skip
        end
        j=j+1
      end
      @cur_line=@cur_line+1
    end

    #loop below is to wrap the most bottom case
    i=3
    while i < plain_len
      @cipher.push(plain[i])
      i+=2*(key-1)
    end
    output = @cipher.join()
    puts "Encrpyted: " + output
  end

end

puts "*** Rails Fence ***"
puts "Enter plain text:"
plain = gets
puts "Enter key:" 
key = gets.chomp.to_i


puts "Plain text: " + plain

text = RailFence.new
puts text.encrypt(plain,key)


