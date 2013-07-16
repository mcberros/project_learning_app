class Project < ActiveRecord::Base
  attr_accessible :name, :description
  
  #has_many :stories, dependent: :destroy
  
  validates :name, presence: true
  
  after_create :customize_name  
   
  private
  
  def customize_name
    self.name = "#{name} (extra)"
  end
end