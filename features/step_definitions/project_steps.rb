Given /a project/ do
  @project = FactoryGirl.create(:project)
end

Given /I should see the project/ do
  step %Q{I should see "#{@project.name}"}
end