require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase

  test "new employees can register" do
    assert_difference "Employee.count" do
      post :new, { name: organizations(:one).name, username: "NEWUSER", password: "PASS", email: "email@email.com" }
    end

    assert_response :created

    assert_not_nil assigns(@employee)
  end

  test "new employees can register with blank email" do
    assert_difference "Employee.count" do
      post :new, { name: organizations(:one).name, username: "NEWUSER", password: "PASS"}
    end

    assert_response :created

    assert_not_nil assigns(@employee)
  end

  test "new employees cannot register without username" do
    assert_no_difference "Employee.count" do
      post :new, { name: organizations(:one).name, password: "PASS", email: "email@email.com"}
    end

    assert_response :unprocessable_entity
  end

end