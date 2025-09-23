class ChangeType < ApplicationRecord
  has_many :changes_records

  def name
    change_type
  end
end
