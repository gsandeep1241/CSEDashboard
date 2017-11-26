module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the new article page$/
      '/admin/content/new'
      
    when /^the new categories page$/
      '/admin/categories/new'  

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^the post is set up$/ do
  Micropost.create!({:content => 'New content',
                      :user_id => 3334,
                      :tag => 3334
                      });
end

Given /^the app is set up$/ do
  
  User.create!({:name => 'admin',
                :email => 'admin@admin.com',
                :password => 'foobar',
                :admin => true,
                :id => 3334,
                :activated => true});
  User.create!({:name => 'user1',
                :email => 'user1@user.com',
                :password => 'user1111',
                :activated => true});
  User.create!({:name => 'user2',
                :email => 'user2@user.com',
                :password => 'user2222',
                :activated => true});
  User.create!({:name => 'user3',
                :email => 'user3@user.com',
                :password => 'user3333',
                :activated => true});           
end

And /^I am logged in$/ do
  visit '/login'
  fill_in 'session_email', :with => 'admin@admin.com'
  fill_in 'session_password', :with => 'foobar'
  click_button 'Log in'
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
find("input[type='checkbox'][id='#{field.downcase}']").set(true)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
