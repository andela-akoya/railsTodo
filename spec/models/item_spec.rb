require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'when validating fields' do
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_inclusion_of(:done).in_array([true, false]) }
  end

  context 'when validating association' do
    it { is_expected.to belong_to(:todo) }
  end
end
