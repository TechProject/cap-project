class Like < ActiveRecord::Base
  belongs_to :developer 
  belongs_to :program 
  
  validates_uniqueness_of :developer, scope: :program
end