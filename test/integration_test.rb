gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/phone_book'

class IntegrationTest < MiniTest::Test
  def test_lookup_by_last_name
    phone_book = PhoneBook.new
    entries = phone_book.lookup('Parker').sort_by { |e| e.first_name }

    assert 3, entries.length
    e1, e2, e3 = entries

    assert_equal "Agnes Parker", e1.name
    assert_equal "758.942.6890", e1.phone_number

    assert_equal "Craig Parker", e2.name
    assert_equal "716-133-3210", e2.phone_number

    assert_equal "Mohamed Parker", e3.name
    assert_equal "701-655-6889", e3.phone_number
  end
end
