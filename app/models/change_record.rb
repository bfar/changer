class ChangeRecord < ApplicationRecord
  belongs_to :change_type
  belongs_to :risk

  validates_presence_of(:name, :description, :business_justification, :implementation_plan, :test_plan, :rollback_plan)
end
