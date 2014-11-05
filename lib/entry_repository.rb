require_relative 'entry'

class EntryRepository

  attr_reader :entries
  def initialize(entries)
    @entries ||= entries.map {|entry| Entry.new(entry)}
  end

  def find_by_last_name(last_name)
    entries.select{|entry| entry.last_name == last_name}
  end

end
