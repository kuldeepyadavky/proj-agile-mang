require 'rails_helper'

RSpec.describe 'Projects' do
    describe 'not a registered user interaction with project page' do
        it 'Should not see the content of project page' do
            visit('/projects')
            expect(page).to have_no_content('Projects')
        end
    end
   
end