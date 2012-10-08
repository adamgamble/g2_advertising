Given /^a user exists$/ do
  @user = FactoryGirl.create(:user)
end

Given /^that user is related to the following stores:$/ do |table|
  table.hashes.each do |hash|
    @user.stores << FactoryGirl.create(:store, :name => hash["Store Name"])
  end
  @user.stores.count.should == table.hashes.count
end

When /^I login as that user$/ do
  visit("/users/sign_in")
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => "password"
  click_button "Sign in"
  page.should have_content "Signed in successfully."
end

When /^I am on the user dashboard$/ do
  visit("/")
end

Then /^I should see my stores listed by name$/ do
  @user.stores.each do |store|
    page.should have_content store.name
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^that user has (\d+) stores with proofs$/ do |number_of_stores|
  number_of_stores.to_i.times do |i|
    @user.stores << FactoryGirl.create(:store_with_proofs)
  end
end

Then /^I should see the proofs listed under their respective stores$/ do
  @user.stores.map(&:proofs).flatten.uniq.each do |proof|
    page.should have_css("#proof_#{proof.id}")
    within ("#proof_#{proof.id}") do
      page.should have_link "View Proof", :href => proof_path(proof)
    end
  end
end

Then /^I should see the proofs in home and print date listed as mm\-dd\-yy$/ do
  @user.stores.map(&:proofs).flatten.uniq.each do |proof|
    page.should have_content proof.in_home_date.strftime("%m-%d-%y")
    page.should have_content proof.print_date.strftime("%m-%d-%y")
  end
end
