require 'rails_helper'

RSpec.describe 'Phases' do
    describe 'user interaction with phase page' do
        it 'user who arent logged in should not have access to phase page' do
            visit('/phases')
            expect(page).to have_no_content('Phases')
        end
    end
end