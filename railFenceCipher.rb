class RailFence
  
  # init 
  def initialize(key)
    @cipher=[]
    @decipher = []
    @cur_line=0
    @cur_line2=0
    @skip=0
    @key = key 
  end

  def encrypt(plain)
    # remove whitespace
    plain = plain.gsub(" ", "") unless plain.nil?
    plain_len = plain.length

    # start encryption
    while @cur_line < @key-1 
      # below is the formula to get the number of skip
      @skip=2*(@key-@cur_line-1)
      
      # init
      j=0
      i=@cur_line

      # start looping row by row 
      while i < plain_len
        # push the current row i array of alpabet to cipher array 
        @cipher.push(plain[i])
        # if the current number of row is even or current column is even row, skip
        if (@cur_line==0 || j%2 == 0)
          # i move to next odd row 
          i=i+@skip
        else 
        # else i is next even line of row 
          i=i+2*(@key-1)-@skip
        end
        # increase counter to check even or odd column 
        j=j+1
      end
      # increment current line
      @cur_line=@cur_line+1
    end

    #loop below is to wrap the most bottom case
    i=@cur_line
    while i < plain_len
      # push the last row to cipher array 
      @cipher.push(plain[i])
      i+=2*(@key-1)
    end
    
    # convert array to string
    @cipher = @cipher.join()
    # remove new line from string
    @cipher = @cipher.delete("\n")
    output = @cipher

    puts "Encrypted: " + output

    # puts "Encrpyted: " + output

    return output
  end

  def decrypt(cipher)
    # init (test)
    cipher_len = cipher.length
    m=0

    # start decrytion
    while @cur_line2 < @key-1 
      # formula to calculate skip required
      @skip=2*(@key-@cur_line2-1)
      n=@cur_line2
      l=0
      # start looping row by row 
      while n < cipher_len
        # current line array of decipher equal to increment m
        @decipher[n]=cipher[m]
        m=m+1
        # if the current number of row is even or current column is even row, skip
        if (@cur_line2==0 || l%2 == 0)
          # [n] move to next odd row of current_line
          n=n+@skip
        else 
          # [n] move to next even row of current_line
          n=n+2*(@key-1)-@skip
        end
        # increment column
        l=l+1
      end
      # increment of 1st layer of loop
      @cur_line2=@cur_line2+1
    end

    # loop below is to wrap the most bottom case
    i=@cur_line2
    while i < cipher_len
      # current line array of decipher equal to increment m
      @decipher[i]= cipher[m]
      # [i] move to next row of current_line
      i+=2*(@key-1)
      m=m+1
    end

    # convert array to string
    @decipher = @decipher.join()
    # remove new line from string
    @cipher = @cipher.delete("\n")
    output = @decipher
    #display output
    puts "Decrypted: " + output
    
    return output
  end
end