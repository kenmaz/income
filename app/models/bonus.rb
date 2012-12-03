class Bonus < ActiveRecord::Base
  attr_accessible :age, :amount, :company_name

  validates :amount, :presence => true
  validates :age, :presence => true
  validates :company_name, :presence => true

end
