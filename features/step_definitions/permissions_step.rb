Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
	Permission.create!(	:user => User.find_by_email!(user),
						          :thing => Project.find_by_name!(project),
						          :action => "view")
end

Given /^"([^"]*)" can create tickets in the "([^"]*)" project$/ do |user, project|
  Permission.create!(:user => User.find_by_email!(user),
                     :thing => Project.find_by_name!(project),
                     :action => "create tickets")
end

Given /^"([^"]*)" can edit tickets in the "([^"]*)" project$/ do |user, project|
  Permission.create!(:user => User.find_by_email!(user),
                     :thing => Project.find_by_name!(project),
                     :action => "edit tickets")
end

Given /^"([^"]*)" can delete tickets in the "([^"]*)" project$/ do |user, project|
  Permission.create!(:user => User.find_by_email!(user),
                     :thing => Project.find_by_name!(project),
                     :action => "delete tickets")
end


When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check "#{field_id}"})
end