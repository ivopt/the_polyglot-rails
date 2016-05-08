require "test_helper"

describe Entry, :model do
  it 'is not valid without title' do
    entry = build(:entry, title: nil)
    entry.wont_be :valid?
  end

  it 'is valid with some title' do
    entry = build(:entry, title: 'Random Title')
    entry.must_be :valid?
  end
end
