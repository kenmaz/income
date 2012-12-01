class Company < ActiveRecord::Base
  #belongs_to :company_type
  attr_accessible :company_type_id, :name

  validates :name, :presence => true
end
