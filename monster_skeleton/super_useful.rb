# PHASE 2
def convert_to_int(str)
    Integer(str)
  rescue ArgumentError
    nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
      return true
    else
        raise ArgumentError
    end
  rescue ArgumentError
    false
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    if reaction(maybe_fruit) == false
      if maybe_fruit.downcase == "coffee"
        raise ArgumentError
      else
        raise StandardError
      end
    end
  rescue ArgumentError
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise "eh..... I wouldn't say we're BEST friends..."
    elsif name.length <= 0
      raise "uh, you've gotta tell me your name if we're best friends..."

    elsif fav_pastime.length <= 0
      raise "uh, you've gotta at least tell me your favorite past time..."
    else
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


