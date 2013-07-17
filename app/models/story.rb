class Story < ActiveRecord::Base
  attr_accessible :name, :description, :project_id
  
  belongs_to :project

  validates :name, presence: true 
     
end