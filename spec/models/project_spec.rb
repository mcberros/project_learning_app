require 'spec_helper'

describe Project do
  subject { FactoryGirl.create(:project) }
  
  describe '.create' do
    it 'adds an appendix to the name' do
      name = 'project'
      subject = FactoryGirl.create(:project, name: name)
      
      subject.name.should == "#{name} (extra)"
    end
  end
end