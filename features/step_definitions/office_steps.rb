Then /^I should have an associated office$/ do
  @user.office.should_not be_nil
end
