require 'rails_helper'

RSpec.describe 'Projects' do
    describe 'user interaction with project page' do
        it 'user who arent logged in should not see the content of project page' do
            visit('/projects')
            expect(page).to have_no_content('Projects')
        end
    end
end