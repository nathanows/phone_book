class PhoneBook
  attr_reader :repository

  def initialize(repository)
    @repository = repository
  end

  def lookup(name)
    repository.find_by_last_name(name)
  end

end
