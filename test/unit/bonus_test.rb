require 'test_helper'

class BonusTest < ActiveSupport::TestCase
  test "new model from params" do
    params = {:age => 32, :amount => 90, :company_attributes => {:name => "hello"}}
    bonus = Bonus.new(params)
    assert bonus.save
  end
end
