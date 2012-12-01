class Bonus < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company, :allow_destroy => true
  attr_accessible :age, :amount, :company_attributes

  validates :amount, :presence => true
  validates :age, :presence => true
  validates :company, :presence => true

end
