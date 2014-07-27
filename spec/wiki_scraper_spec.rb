require 'spec_helper'
require 'wiki_scraper'

describe WikiScraper do
  let(:url) { 'http://en.wikipedia.org/wiki/Golden_Retriever' }
  let(:mapping) { :dog }
  let(:data_mapper) { double(:data_mapper, data: {the: :data}) }
  let(:agent) { double(:agent) }

  subject(:scraper) { described_class }

  before do
    allow(scraper).to receive(:agent).and_return(agent)
  end

  it 'calls data mapper with page' do
    expect(agent).to receive(:get).with(url).and_return(the: :page)
    expect(data_mapper).to receive(:new).with(the: :page).and_return(data_mapper)
    expect(scraper.scrape(url, data_mapper)).to eq(the: :data)
  end

  it 'raise exception when page cannot be found' do
    expect(agent).to receive(:get).with(url).and_raise(StandardError, 'not found')
    expect { (scraper.scrape(url, data_mapper)) }.to raise_error(WikiScraper::NotFound, 'not found')
  end
end
