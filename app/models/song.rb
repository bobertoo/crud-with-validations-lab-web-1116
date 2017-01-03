require 'pry'

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title , :scope => [:artist_name, :release_year]
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.new.year }

end
