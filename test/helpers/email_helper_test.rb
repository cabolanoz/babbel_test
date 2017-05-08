require 'test_helper'

class EmailHelperTest < ActionDispatch::IntegrationTest

  test "Should return FIRST_NAME_LAST_NAME_FORMULA for cesarbolanos@gmail.com" do
      assert_equal EmailHelper.get_type('Cesar Bolanos', 'cesarbolanos@gmail.com'), EmailHelper::FIRST_NAME_LAST_NAME_FORMULA
  end

  test "Should return LAST_NAME_FIRST_NAME_FORMULA for bolanoscesar@gmail.com" do
      assert_equal EmailHelper.get_type('Cesar Bolanos', 'bolanoscesar@gmail.com'), EmailHelper::LAST_NAME_FIRST_NAME_FORMULA
  end

  test "Should return FIRST_NAME_INITIAL_LAST_NAME_FORMULA for cbolanos@gmail.com" do
      assert_equal EmailHelper.get_type('Cesar Bolanos', 'cbolanos@gmail.com'), EmailHelper::FIRST_NAME_INITIAL_LAST_NAME_FORMULA
  end

  test "Should translate to the proper email and type" do
      assert_equal EmailHelper.translate(EmailHelper::FIRST_NAME_LAST_NAME_FORMULA, 'gmail.com', 'Cesar Bolanos'), 'cesarbolanos@gmail.com'
      assert_equal EmailHelper.translate(EmailHelper::LAST_NAME_FIRST_NAME_FORMULA, 'gmail.com', 'Cesar Bolanos'), 'bolanoscesar@gmail.com'
      assert_equal EmailHelper.translate(EmailHelper::FIRST_NAME_INITIAL_LAST_NAME_FORMULA, 'gmail.com', 'Cesar Bolanos'), 'cbolanos@gmail.com'
  end

  test "Should raise an error if a invalid type is provided" do
    ANY_INVALID_TYPE = 1000
    assert_raise do
      EmailHelper.translate(ANY_INVALID_TYPE, 'gmail.com', 'Cesar Bolanos')
    end
  end

end
