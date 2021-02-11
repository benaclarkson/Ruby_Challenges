# Robot Name
# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

class Robot
  attr_accessor :robot_name

  ALPHA = ('A'..'Z').to_a
  NUMERIC = ('0'..'9').to_a
  @@existing_names = []

  def initialize
    @robot_name = ''
  end

  def name
    return robot_name if robot_name != ''

    loop do
      working_name = create_name
      if valid_name?(working_name)
        self.robot_name = working_name
        @@existing_names << robot_name
        break
      end
    end

    robot_name
  end

  def reset
    @@existing_names.delete(robot_name)
    self.robot_name = ''
  end

  private

  def valid_name?(name)
    !@@existing_names.include?(name)
  end

  def create_name
    new_name = ''
    2.times { new_name << ALPHA.sample }
    3.times { new_name << NUMERIC.sample }
    new_name
  end
end