require 'test_helper'

describe "Entries", :capybara do
  describe '/entries' do
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

  describe '/entries/:id' do
    it 'shows existing entry' do
      # Given an existing entry
      title = 'Just a title'
      body = 'A random Body'
      published_date = 1.day.ago.to_date

      entry = create(:entry, title: title, body: body, published_on: published_date)

       # When I visit the /entries page
      visit "/entries/#{entry.id}"

       # Then I see the existing entries
      page.must_have_text(title)
      page.must_have_text(body)
      page.must_have_text(published_date.to_s(:long))
    end
  end
end
