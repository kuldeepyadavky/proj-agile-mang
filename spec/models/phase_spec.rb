require 'rails_helper'

RSpec.describe Phase do
  subject { described_class.new(id: 100, title: 'Phase 1') }
  describe 'Phase Creation' do
      it 'changing values to check validations' do
        expect(subject).to be_valid
        subject.title = 'ddd'
        expect(subject).to_not be_valid
        subject.title = nil
        expect(subject).to_not be_valid
      end
    end
end

 