require 'rails_helper'

RSpec.describe 'clock/trasaction views', type: :feature do
  before(:each) do
    @user1 = User.new(name: 'test', email: 'test@gmail.com', password: '123456', password_confirmation: '123456' )
    @user1.avatar = fixture_file_upload('default-user.jpg')
    @user1.save
    @group = Group.new(name: 'test group', user_id: 1)
    @group.icon = fixture_file_upload('default-group.jpg')
    @group.save
    visit new_user_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'LOG IN'
  end

  scenario 'go to clock index' do
    click_on 'My Hours'
    expect(page).to have_content('Clocks')
  end

  scenario 'create a new clock' do
    click_on 'My Hours'
    click_on 'Add new'
    fill_in 'Name', with: 'Step 1 research'
    fill_in 'Hour', with: '3'
    click_on 'New/Update'
    expect(page).to have_content('Clocks')
  end

  scenario 'go to no-categorised clocks' do
    click_on 'Non Categorised Hours'
    expect(page).to have_content('External Hours')
  end

end