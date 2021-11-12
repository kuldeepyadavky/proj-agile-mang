require 'rails_helper'

RSpec.describe 'Sign Up' do

    def fill_in_signup_fields
        fill_in "Email", with: "abc@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
    end

    describe "Sign Up" do
        it 'tries to sign up' do
        visit('/')
        within find(".buttons") do
            click_link('Sign Up')   #on two occurences try finding in the div
            expect(current_path).to eql('/users/sign_up')
        end
        expect(page).to have_content("Email")
        fill_in_signup_fields
        expect(page).to have_content("View Projects")  
        #on successfull sign user will be able to see the link to view projects
        end
    end
end