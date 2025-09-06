class Change < ApplicationRecord
  has_one :change_type
  has_one :risk

  validates_presence_of(:name, :description, :business_justification, :implementation_plan, :test_plan, :rollback_plan)
end
