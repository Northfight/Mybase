class Account
  
  attr_reader :name, :balance
  attr_accessor :amunt
  
  def initialize(name,balance = 100)
    @name = name 
    @balance = balance
  end  
  
  def display_balance(pin_number)
   puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end
  
  def withdraw(pin_number,amount)
    @balance -= amount if pin_number == pin
    puts pin_number == pin ? "Withdrew #{amount}. New balance: $#{@balance}." : pin_error
  end
  
  def deposit(pin_number)
    if  pin_number == pin
      puts "How much money do you want to deposite?"
      @amunt = gets.chomp
      @balance += @amunt.to_i
      puts "You deposit #{@amunt} dollars.Your balance #{@balance}" 
    else 
      puts pin_error  
    end
  end
 
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    return "Access denied: incorrect PIN."
  end
end  
checking_account = Account.new("Nick",1000)
checking_account.deposit(1234)
