class Account
  attr_reader :name, :balance, :pin
  attr_accessor :correct_pin_flag, :input
  
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
    user_input
    @balance -= @input 
    puts "\nWithdrew #{@amount}. New balance: $#{@balance}." 
  end  
 
  def deposit
    input_pin
    puts "\nHow much money do you want to deposit?"
    user_input
    @balance += @input
    puts "\nYou deposit #{@input} dollars.Your balance #{@balance}" 
  end

  private
  
  def input_pin
    unless @correct_pin_flag 
      puts "Please enter pincode: " 
      user_input
    until pin_is_correct?(@input)
      puts "Pin error, try again"
      user_input
    end
      puts "\nWelcome #{@name}!"
      @correct_pin_flag = true
    end
  end

  def user_input
    @input = gets.chomp.to_i
  end  
  
  def pin_is_correct?(pin_number)
    pin_number == @correct_pin
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
