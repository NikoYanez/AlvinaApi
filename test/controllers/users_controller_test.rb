require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assumes a fixture named 'one' exists in users.yml
    @valid_attributes = { name: "John Doe", email: "john@example.com", password: "password", role: "owner" }
    @invalid_attributes = { name: "", email: "invalid", password: "", role: "invalid_role" }
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should create user with valid attributes" do
    assert_difference("User.count") do
      post users_url, params: { user: @valid_attributes }, as: :json
    end

    assert_response :created
  end

  test "should not create user with invalid attributes" do
    assert_no_difference("User.count") do
      post users_url, params: { user: @invalid_attributes }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "should update user with valid attributes" do
    patch user_url(@user), params: { user: { name: "Updated Name" } }, as: :json
    assert_response :success
    @user.reload
    assert_equal "Updated Name", @user.name
  end

  test "should not update user with invalid attributes" do
    patch user_url(@user), params: { user: { email: "invalid" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
