class Change < ApplicationRecord
  has_one :change_type
  has_one :risk
end
