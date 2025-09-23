class Risk < ApplicationRecord
  has_many :change_records

  def name
    level
  end
end
