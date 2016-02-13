class RailFence
  
  def initialize(key)
    @cipher=[]
    @decipher = []
    @cur_line=0
    @skip=0
    @key = key 
  end

  #loop below is to loop from top to 2nd bottom case
  def encrypt(plain)
    plain = plain.gsub(" ", "")
    plain_len = plain.length-1
    while @cur_line < @key-1 
      #loop through each level in rail fence
      @skip=2*(@key-@cur_line-1)
      #how many numbers to skip in rail fence
      j=0
      i=@cur_line
      while i < plain_len
        @cipher.push(plain[i])
        if (@cur_line==0 || j%2 == 0)
          i=i+@skip
        else 
          i=i+2*(@key-1)-@skip
        end
        j=j+1
      end
      @cur_line=@cur_line+1
    end

    #loop below is to wrap the most bottom case
    i=3
    while i < plain_len
      @cipher.push(plain[i])
      i+=2*(@key-1)
    end
    output = @cipher.join()

  
  end

  def decrypt(plain)
    @decipher[0] = @cipher[0]
    counter = 1

    while counter != @cipher.size()
      if counter%2 == 1
         @decipher.push(@cipher[counter])   
      end
      counter += 1
    end
    while counter != 1
      if counter%2 == 0
        @decipher.push(@cipher[counter])
      end
      counter -= 1
    end 
    output = @decipher.join()

  end
end