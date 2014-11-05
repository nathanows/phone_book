gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/entry_repository'

class EntryRepositoryTest < Minitest::Test
  def test_retrieve_by_last_name
    entries = [
      { first_name: 'Alice', last_name: 'Smith', phone_number: '111.111.1111'},
      { first_name: 'Bob', last_name: 'Smith', phone_number: '222.222.2222'},
      { first_name: 'Cindy', last_name: 'Johnson', phone_number: '333.333.3333'}
    ]

    repository = EntryRepository.new(entries)
    entries = repository.find_by_last_name("Smith").sort_by { |e| e.first_name }
    assert_equal 2, entries.length

    alice, bob = entries

    assert_equal "Alice Smith", alice.name
    assert_equal "111.111.1111", alice.phone_number
    assert_equal "Bob Smith", bob.name
    assert_equal "222.222.2222", bob.phone_number
  end

  def test_find_by_first_and_last_name
    entries = [
      { first_name: 'Alice', last_name: 'Smith', phone_number: '111.111.1111'},
      { first_name: 'Bob', last_name: 'Smith', phone_number: '222.222.2222'},
      { first_name: 'Cindy', last_name: 'Johnson', phone_number: '333.333.3333'}
    ]

    repository = EntryRepository.new(entries)
    entries = repository.find_by_first_and_last_name("Bob", "Smith")
    assert_equal 1, entries.length
    bob = entries.first
    assert_equal "Bob Smith", bob.name
    assert_equal "222.222.2222", bob.phone_number
  end


    def test_find_by_number
      entries = [
        { first_name: 'Alice', last_name: 'Smith', phone_number: '111.111.1111'},
        { first_name: 'Bob', last_name: 'Smith', phone_number: '222.222.2222'},
        { first_name: 'Cindy', last_name: 'Johnson', phone_number: '333.333.3333'}
      ]

      repository = EntryRepository.new(entries)
      results = repository.find_by_number("222.222.2222")
      assert_equal 1, results.length
      bob = results.first
      assert_equal "Bob Smith", bob.name
      assert_equal "222.222.2222", bob.phone_number
    end

end
