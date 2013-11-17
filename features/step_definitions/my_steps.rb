
And /^a non-admin user exists$/ do
  User.create!({:login => 'non-admin',
                :password => 'bbbbbbbb',
                :email => 'doe@snow.com',
                :profile_id => 2,
                :name => 'Non admin',
                :state => 'active'})
end

And /^two articles with comments are created$/ do
  a1 = Article.create!({ :user_id => 1,
                    :body => "Article 1 Text",
                    :title => "Article 1 Title",
                    :published => true})

  Comment.create!({:author => 'Commenter1',
                :article => a1,
                :body => 'Comment Article 1',
                :ip => '1.2.3.4'})

  a2 = Article.create!({ :user_id => 2,
                    :body => "Article 2 Text",
                    :title => "Article 2 Title",
                    :published => true})

  Comment.create!({:author => 'Commenter2',
                :article => a2,
                :body => 'Comment Article 2',
                :ip => '1.2.3.4'})
end

Given /^I am logged as a non-admin user$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'non-admin'
  fill_in 'user_password', :with => 'bbbbbbbb'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I am logged as a admin user$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

