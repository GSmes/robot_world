require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({"id" => 12,
                       "name" => 'Hank',
                       "city" => 'Fargo',
                       "state" => 'North Dakota',
                       "birthdate" => '2/1/87',
                       "date_hired" => '11/11/15',
                       "department" => 'Loader'})

    assert_equal 12, robot.id
    assert_equal "Hank", robot.name
    assert_equal "Fargo", robot.city
    assert_equal "North Dakota", robot.state
    assert_equal "2/1/87", robot.birthdate
    assert_equal "11/11/15", robot.date_hired
    assert_equal "Loader", robot.department
    assert_instance_of Robot, robot

    refute_equal 10, robot.id
    refute_equal "Lloyd", robot.name
    refute_equal "Denver", robot.department
  end
end
