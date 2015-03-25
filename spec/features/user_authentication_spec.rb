require 'rails_helper'

#tests written in pseudo code

feature 'user authentication' do

  scenario 'user can sign up' do
    visit sign_up_path
      click on sign up
    expect(current path).to eq sign_up_path

    #fill in the form

    click submit

    expect user to be created
    redirect_to_index

    end
end
