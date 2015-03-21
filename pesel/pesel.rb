class PeselValidate

  def initialize(str1)
    @pesel = str1
  end
    
  def validate  #default is public
    return false if @pesel.length != 11 
    arr = []
    for i in 0..10 do 
      begin
        arr << Integer(@pesel[i]) 
      rescue 
        return false 
      end 
    end

    day = @pesel[4,2].to_i  
    return false if day < 1 || day > 31
    	  	
    month = @pesel[2,2].to_i
    return false if month < 1 || month.between?(13,20) || month.between?(33,80) || month > 92
    # sprawdza miesiąc do aktualnego stulecia, lata 1800-2099
    	
    x = 1*arr[0] + 3*arr[1] + 7*arr[2] + 9*arr[3] + 1*arr[4] + 3*arr[5] + 7*arr[6] + 9*arr[7] + 1*arr[8] + 3*arr[9]
    
    if x%10 == 0
      control = 0
    else
      control = 10 - (x%10)
    end
    return false if arr[10] != control

    return true
  end
  
end




