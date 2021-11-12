require 'rails_helper'

RSpec.describe 'Home' do
    describe 'user interaction with home page' do
        it 'greets the user and has link of login' do
            visit('/')
            expect(page).to have_content('Hi, Hope you are having a good day!')
            click_link('Login')
            expect(current_path).to eql('/users/sign_in')
        end
        it 'greets the user and has link of sign up' do
            visit('/')
            expect(page).to have_content('Hi, Hope you are having a good day!')
            within find(".buttons") do
                click_link('Sign Up')   #on two occurences try finding in the div
                expect(current_path).to eql('/users/sign_up')
            end
        end
    end
end