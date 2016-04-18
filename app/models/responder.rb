class Responder < ActiveRecord::Base
  validates :capacity, presence: true, :inclusion => {:in => 1..5}
  validates :name, uniqueness: { case_sensitive: false }
  validates :type, presence: true
end
