class Responder < ActiveRecord::Base
  # disable STI
  self.inheritance_column = :_type_disabled

  validates :capacity, presence: true, :inclusion => {:in => 1..5}
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :type, presence: true
end
