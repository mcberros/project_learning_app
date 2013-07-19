class Story < ActiveRecord::Base
  attr_accessible :name, :description, :project_id
  
  belongs_to :project

  has_many :tasks, dependent: :destroy

  validates :name, presence: true 
     
end