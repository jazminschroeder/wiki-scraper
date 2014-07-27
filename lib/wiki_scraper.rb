require 'mechanize'
require 'multi_json'
require_relative 'mappings/wiki_dog_breeds'

class WikiScraper
  class NotFound < StandardError; end

  def self.scrape(url, data_mapper)
    new(agent).scrape(url, data_mapper)
  end

  def self.agent
    Mechanize.new
  end

  def initialize(agent)
    @agent = agent
  end

  def scrape(url, data_mapper)
    data_mapper.new(page(url)).data
  end

  private
  def page(url)
    @agent.get(url)
  rescue =>  e
    raise NotFound.new(e.message)
  end

end
