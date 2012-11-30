class Bonus < ActiveRecord::Base
  belongs_to :company
  attr_accessible :age, :amount, :company_id
end
