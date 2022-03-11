require 'date'

class Cat < ApplicationRecord
  COLORS = ['black', 'orange', 'grey', 'brown']

  validates :birth_date, :color, :name, :sex, :description, presence:true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: {in: %w(M F) }


  def age
    now = Time.now.utc.to_date
    year = now.year - birth_date.year
    year -= 1 if now.month < birth_date.month
    year
  end
end