require_relative "../test_helper"

class RobotDirectoryTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_manager.all.first.id
  end

  def test_it_can_create_a_robot
    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    assert_equal current_robot_id, robot_manager.all.first.id

    robot = robot_manager.find(robot_manager.all.first.id)

    assert_equal "Hank", robot.name
    assert_equal "Fargo", robot.city
    assert_equal "North Dakota", robot.state
    assert_equal "2/1/87", robot.birthdate
    assert_equal "11/11/15", robot.date_hired
    assert_equal "Loader", robot.department
    assert_instance_of Robot, robot
  end

  def test_the_all_method
    assert_equal 0, robot_manager.all.count

    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    robot_manager.create(name: 'Lloyd',
                         city: 'Los Angeles',
                         state: 'California',
                         birthdate: '9/5/90',
                         date_hired: '3/10/16',
                         department: 'Loader')

    assert_equal 2, robot_manager.all.count
    assert_equal current_robot_id, robot_manager.all.first.id
    assert_instance_of Robot, robot_manager.all[1]
  end

  def test_it_finds_robots
    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    robot_manager.create(name: 'Lloyd',
                         city: 'Los Angeles',
                         state: 'California',
                         birthdate: '9/5/90',
                         date_hired: '3/10/16',
                         department: 'Loader')

    robot = robot_manager.find(current_robot_id)
    assert_equal "Hank", robot.name

    robot = robot_manager.find(current_robot_id + 1)
    assert_equal "Lloyd", robot.name
  end

  def test_it_updates
    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    updated_robot = {name: 'Hank',
                     city: 'Fago',
                     state: 'North Dakota',
                     birthdate: '2/1/87',
                     date_hired: '11/11/15',
                     department: 'CEO'}

    robot = robot_manager.find(current_robot_id)
    assert_equal "Loader", robot.department

    robot_manager.update(robot.id, updated_robot)

    robot = robot_manager.find(current_robot_id)
    assert_equal "CEO", robot.department
  end

  def test_it_destroys
    assert_equal 0, robot_manager.all.count

    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    robot_manager.create(name: 'Lloyd',
                         city: 'Los Angeles',
                         state: 'California',
                         birthdate: '9/5/90',
                         date_hired: '3/10/16',
                         department: 'Loader')

    assert_equal 2, robot_manager.all.count
    robot = robot_manager.find(current_robot_id)

    robot_manager.destroy(robot.id)

    assert_equal 1, robot_manager.all.count
  end

  def test_the_delete_all_method
    assert_equal 0, robot_manager.all.count

    robot_manager.create(name: 'Hank',
                         city: 'Fargo',
                         state: 'North Dakota',
                         birthdate: '2/1/87',
                         date_hired: '11/11/15',
                         department: 'Loader')

    robot_manager.create(name: 'Lloyd',
                         city: 'Los Angeles',
                         state: 'California',
                         birthdate: '9/5/90',
                         date_hired: '3/10/16',
                         department: 'Loader')

    assert_equal 2, robot_manager.all.count

    robot_manager.delete_all

    assert_equal 0, robot_manager.all.count
  end
end
