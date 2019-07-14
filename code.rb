class Account
  attr_reader :name, :balance, :pin
  attr_accessor :amunt, :correct_pin_flag
  
  def initialize(name:, pin:, balance: 1000)
    @name = name 
    @balance = balance
    @correct_pin = pin
  end  
  
  def display_balance
    input_pin
    puts "\nBalance: $#{@balance}." 
  end
  
  def withdraw
    input_pin
    puts "\nHow much money do you want to withdraw?"
    @amount = gets.chomp.to_i
    @balance -= @amount 
    puts "\nWithdrew #{@amount}. New balance: $#{@balance}." 
  end  
 
  def deposit
    input_pin
    puts "\nHow much money do you want to deposit?"
    @amunt = gets.chomp.to_i
    @balance += @amunt
    puts "\nYou deposit #{amunt} dollars.Your balance #{balance}" 
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
    pin_number == @correct_pin
  end

  def input_pin
    unless @correct_pin_flag 
      get_pin
      puts "\nWelcome #{@name}!"
      @correct_pin_flag = true
    end  
  end  
end 

checking_account = Account.new(pin: 1234, name: "Nick")

loop do
puts "\nPlease select what do you want to do?\n\n"
puts "deposit - if you want deposite money"
puts "withdraw - if you want withdraw money"
puts "display - if you want display balance"
puts "exit - if you want exit"

choice = gets.chomp.downcase

  case choice
  when "deposit"
    checking_account.deposit
  when "withdraw"
    checking_account.withdraw
  when "display"
    checking_account.display_balance
  when "exit"
    break
  else
    puts "\nInput error"
  end 
end
