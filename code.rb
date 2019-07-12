class Account
  attr_reader :name, :balance 
  attr_accessor :amunt, :pin, :control
  
  def initialize(name, pin, balance = 1000)
    @name = name 
    @balance = balance
    @pin = pin
    @control = 0
  end  
  
  def display_balance
    if @control < 1
    get_pin
    puts "Welcome #{@name}!"
    end
    puts
    puts "Balance: $#{@balance}." 
    @control += 1
  end
  
  def withdraw
    if @control < 1
    get_pin
    puts "Welcome #{@name}!"
    end  
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
    @control += 1
  end  
 
  def deposit
    if @control < 1
    get_pin
    puts "Welcome #{@name}!"
    end
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
    @control += 1
  end

  private
  
  def get_pin
    puts "Please enter pincode: " 
    @entered_pin = gets.chomp.to_i
    until pin_is_correct?(@entered_pin)
      puts "Pin error, try again"
      @entered_pin = gets.chomp.to_i
    end
  end
  
  def pin_is_correct?(pin_number)
    pin_number == correct_pin.to_i
  end
  
  def correct_pin
    @pin
  end
  
end 

checking_account = Account.new("Nick", 1234, 1000)

begin
puts
puts "Please select what do you want to do?"
puts
puts "deposit - if you want deposite money"
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
