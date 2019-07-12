class Account
  attr_reader :name, :balance 
  attr_accessor :amunt, :pin, :correct_pin_flag
  
  def initialize(name, pin, balance = 1000)
    @name = name 
    @balance = balance
    @pin = pin
    @correct_pin_flag = false
  end  
  
  def display_balance
    unless @correct_pin_flag
      get_pin
      puts "\nWelcome #{@name}!"
    end
    puts "\nBalance: $#{@balance}." 
    @correct_pin_flag = true
  end
  
  def withdraw
    unless @correct_pin_flag 
      get_pin
      puts "\nWelcome #{@name}!"
    end  
    begin
      puts "\nHow much money do you want to withdraw?"
      @amount = gets.chomp.to_i
      @balance -= @amount 
      puts "\nWithdrew #{@amount}. New balance: $#{@balance}." 
      puts "\nDo you want to continue withdraw ? yes(y), no(n)"
      @answer = gets.chomp
    end while @answer == "y"
    puts "\nThank you #{@name}!"
    @correct_pin_flag = true
  end  
 
  def deposit
    unless @correct_pin_flag
      get_pin
      puts "\nWelcome #{@name}!"
    end
    begin
      puts "\nHow much money do you want to deposit?"
      @amunt = gets.chomp
      @balance += @amunt.to_i
      puts "\nYou deposit #{amunt} dollars.Your balance #{balance}" 
      puts "\nDo you want to continue deposit ? yes(y), no(n)"
      @answer = gets.chomp
    end while @answer == "y"
    puts
    puts "\nThank you #{@name}!"
    @correct_pin_flag = true
  end

  private
  
  def get_pin
    puts "Please enter pincode: " 
    entered_pin = gets.chomp.to_i
    until pin_is_correct?(entered_pin)
      puts "Pin error, try again"
      entered_pin = gets.chomp.to_i
    end
  end
  
  def pin_is_correct?(pin_number)
    pin_number == @pin
  end
end 

checking_account = Account.new("Nick", 1234, 1000)

begin
puts "\nPlease select what do you want to do?"
puts "\ndeposit - if you want deposite money"
puts "withdraw - if you want withdraw money"
puts "display - if you want display balance"
puts "exit - if you want exit"

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
