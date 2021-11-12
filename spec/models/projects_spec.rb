require 'rails_helper'

RSpec.describe Project do
 

  subject { described_class.new(id: 100, title: 'Project', description: 'Description of project', status: "In Progress", due_date: "2021-11-12", user_id: 1) }
  describe 'Project' do
      it 'changing values to check validations' do
        expect(subject).to be_valid
        subject.title = 'ddd'
        expect(subject).to_not be_valid
        subject.title = nil
        expect(subject).to_not be_valid
      end
    end
end

 
  