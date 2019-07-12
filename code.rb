class Account
  attr_reader :name, :balance
  attr_accessor :amunt, :pin
  
  def initialize(name, balance, pin)
    @name = name 
    @balance = balance
    @pin = pin.to_i
  end  
  
  def get_pin
    puts "Please enter pincode: " 
    @entered_pin = gets.chomp.to_i 
  until pin_is_correct?(@entered_pin)
    puts "Try again"
    @entered_pin = gets.chomp.to_i 
  end
    @entered_pin
  end

  def display_balance
   puts pin_is_correct?(get_pin) ? "Balance: $#{@balance}." : pin_error
  end
  
  def withdraw
    if  pin_is_correct?(get_pin)
      puts "Welcome #{@name}!"
    begin
      puts "How much money do you want to withdraw?"
      @amount = gets.chomp.to_i
      puts
      @balance -= @amount 
      puts "Withdrew #{@amount}. New balance: $#{@balance}." 
      puts
      puts "Do you want to continue withdraw ? yes(y), no(n)"
      @answer = gets.chomp
    end while @answer == "y"
      puts
      puts "Thank you #{@name}!"
    else
      puts pin_error
    end  
  end  
 
  def deposit
    if  pin_is_correct?(get_pin)
      puts "Welcome #{@name}!"
    begin
      puts "How much money do you want to deposit?"
      @amunt = gets.chomp
      @balance += @amunt.to_i
      puts
      puts "You deposit #{amunt} dollars.Your balance #{balance}" 
      puts
      puts "Do you want to continue deposit ? yes(y), no(n)"
      @answer = gets.chomp
      end while @answer == "y"
      puts
      puts "Thank you #{@name}!"
    else 
      puts pin_error  
    end
  end

  private
  
  def pin_is_correct?(pin_number)
    pin_number == correct_pin
  end
  
  def correct_pin
    @pin
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end
end 

checking_account = Account.new("Nick", 1000, 1234)

begin
puts " Please select what do you want to do?"
puts " deposit - if you want deposite money"
puts " withdraw - if you want withdraw money"
puts " display - if you want display balance"
puts " exit - if you want exit"

choice = gets.chomp.downcase

case choice
when "deposit"
  checking_account.deposit
  condition = true
when "withdraw"
  checking_account.withdraw
  condition = true
when "display"
  checking_account.display_balance
  condition = true
when "exit"
  condition = false
else
   puts
   puts "Input error"
   condition = true  
end 
end while condition
