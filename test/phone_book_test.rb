gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/phone_book'

class PhoneBookTest < Minitest::Test
  def test_lookup_by_last_name
    repository = Minitest::Mock.new
    phone_book = PhoneBook.new(repository)
    repository.expect(:find_by_last_name, [], ["Smith"])
    phone_book.lookup('Smith')
    repository.verify
  end

  def test_lookup_by_last_name_first_name
    repository = Minitest::Mock.new
    phone_book = PhoneBook.new(repository)
    repository.expect(:find_by_first_and_last_name, [], ["Alice", "Smith"])
    phone_book.lookup('Smith, Alice')
    repository.verify
  end
end
