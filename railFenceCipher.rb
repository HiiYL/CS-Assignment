class RailFence
  
  def initialize(key)
    @cipher=[]
    @decipher = []
    @cur_line=0
    @cur_line2=0
    @skip=0
    @key = key 
  end

  #loop below is to loop from top to 2nd bottom case
  def encrypt(plain)
    plain = plain.gsub(" ", "") unless plain.nil?
    plain_len = plain.length
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
    i=@cur_line
    while i < plain_len
      @cipher.push(plain[i])
      i+=2*(@key-1)
    end
    
    # convert array to string
    @cipher = @cipher.join()
    # remove new line from string
    @cipher = @cipher.delete("\n")
    output = @cipher
    puts "Encrpyted: " + output
    return output
  end

  def decrypt(cipher)
    # init (test)
    cipher_len = @cipher.length
    m=0

    # start looping
    while @cur_line2 < @key-1 
      @skip=2*(@key-@cur_line2-1)
      n=@cur_line2
      l=0
      # start 2nd layer looping
      while n < cipher_len
        # skipped array equal to cipher array 0,1,2,3,m+1...
        @decipher[n]=@cipher[m]
        m=m+1
        # if first n is equal to n+skip or if even number time of loop n+skip
        if (@cur_line2==0 || l%2 == 0)
          n=n+@skip
        else 
        # else if current line is odd
          n=n+2*(@key-1)-@skip
        end
        # increment of loop time
        l=l+1
      end
      # increment of 1st layer of loop
      @cur_line2=@cur_line2+1
    end

    # loop below is to wrap the most bottom case
    i=@cur_line2
    while i < cipher_len
      @decipher[i]= @cipher[m]
      i+=2*(@key-1)
      m=m+1
    end
    @decipher = @decipher.join()
    output = @decipher
    puts "Decrpyted: " + output
    return output
  end
end