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
