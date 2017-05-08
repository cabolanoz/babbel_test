require 'test_helper'

class EmailControllerTest < ActionDispatch::IntegrationTest

  test "Send empty company should return 400 bad request" do
      get "/email/?fullname=#{Faker::Name.name}"

      assert_response :bad_request
      assert_equal JSON.parse(@response.body), ["No company was provided"]
  end

  test "Send empty fullName should return 400 bad request" do
      get "/email/?company=#{Faker::Internet.domain_name}"

      assert_response :bad_request
      assert_equal JSON.parse(@response.body), ["No fullName was provided"]
  end

  test "Empty request should return 400 bad request and 2 error messages" do
      get "/email/"

      assert_response :bad_request
      assert_equal JSON.parse(@response.body).size, 2
  end

  test "Should return 404 - not found if company formula is not available" do
      get "/email/?fullname=#{Faker::Name.name}&company=#{Faker::Internet.domain_name}"

      assert_response :not_found
      assert_equal JSON.parse(@response.body), ["Email cannot be derive from company and fullName combination"]
  end

  ####SUCCESS CASES

  test "Should return 200 - OK for proper company fullname" do
      get "/email/?fullname=Cesar Bolanos&company=google.com"
      assert_response :success
      assert_equal JSON.parse(@response.body)["email"], "cesarbolanos@google.com"
  end

end
