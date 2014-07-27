require 'mechanize'
require 'wiki_scraper'
require 'mappings/wiki_dog_breeds'

describe Mappings::WikiDogBreeds do
  let(:url) { 'http://en.wikipedia.org/wiki/Golden_Retriever' }
  let(:page) { WikiScraper.agent.get(url) }

  subject(:hash) { described_class.new(page).data}

  it 'retuns a hash of data' do
    expect(hash[:photo_url]).to eq('http://upload.wikimedia.org/wikipedia/commons/thumb/6/61/MaleGoldenRetriever.jpg/220px-MaleGoldenRetriever.jpg')
    expect(hash[:origin]).to eq('Scotland')
    expect(hash[:weight]).to eq(male: 'average 65-75 lbs (29-34 kg)', female: 'average 60-70 lbs (27-32 kg)')
  end

end
