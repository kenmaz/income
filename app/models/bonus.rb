class Bonus < ActiveRecord::Base
  attr_accessible :age, :amount, :company_name, :comment

  validates :amount, :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :age, :presence => true, :numericality => {:only_integer => true, :greater_than => 0, :less_than => 100}
  validates :company_name, :presence => true
  validates :comment, :length => {:maximum => 256}

end
