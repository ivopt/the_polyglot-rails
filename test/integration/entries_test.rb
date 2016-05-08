require 'test_helper'

describe "Entries", :capybara do
  describe '/entries' do
    it 'responds HTTP 200 OK' do
      visit '/entries'
      page.status_code.must_equal 200
    end

    it 'lists existing entries' do
      # Given a set of entries
      entry1 = create(:entry, title: 'entry one')
      entry2 = create(:entry, title: 'entry two')
      entry3 = create(:entry, title: 'entry three')

       # When I visit the /entries page
      visit '/entries'

       # Then I see the existing entries
      page.must_have_text('entry one')
      page.must_have_text('entry two')
      page.must_have_text('entry three')
    end
  end
end
