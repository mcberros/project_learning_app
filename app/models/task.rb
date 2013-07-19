class Task < ActiveRecord::Base
  attr_accessible :name, :description, :story_id
  
  belongs_to :story

  validates :name, presence: true 
     
end