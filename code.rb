class Account
  attr_reader :name, :balance, :pincode
  attr_accessor :amunt
  
  def initialize(name, balance = 100)
    @name = name 
    @balance = balance
  end  
  
  def get_pin
    puts "Please enter pincode: " 
    @pincode = gets.chomp.to_i   
  end  

  def display_balance(pin_number)
   puts pin_is_correct?(pin_number) ? "Balance: $#{balance}." : pin_error
  end
  
  def withdraw(pin_number)
    if  pin_is_correct?(pin_number)
      puts "How much money do you want to deposit?"
      amount = gets.chomp.to_i
      @balance -= amount 
      puts "Withdrew #{amount}. New balance: $#{balance}." 
    else
      puts pin_error
    end  
  end  
  
  def deposit(pin_number)
    if  pin_is_correct?(pin_number)
      puts "How much money do you want to deposit?"
      @amunt = gets.chomp
      @balance += @amunt.to_i
      puts "You deposit #{amunt} dollars.Your balance #{balance}" 
    else 
      puts pin_error  
    end
  end

  private
  
  def pin_is_correct?(pin_number)
    pin_number == pin
  end
  
  def pin
    @pin ||= 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end 

checking_account = Account.new("Nick", 1000)

puts "Please select what do you want to do?"
puts " deposit - if you want deposite money"
puts " withdraw - if you want withdraw money"
puts " display - if you want display balance"

choice = gets.chomp.downcase

case choice
when "deposit"
  checking_account.deposit(checking_account.get_pin)
when "withdraw"
  checking_account.withdraw(checking_account.get_pin)
when "display"
  checking_account.display_balance(checking_account.get_pin)  
end 
