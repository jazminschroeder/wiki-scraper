require 'mechanize'
require 'wiki_scraper'
require 'mappings/bj_dog_breeds'

describe Mappings::BjDogBreeds do
  let(:url) { 'http://www.bil-jac.com/breed.php?name=Golden+Retriever' }
  let(:page) { WikiScraper.agent.get(url) }

  subject(:hash) { described_class.new(page).data}

  it 'retuns a hash of data' do
    expect(hash[:size]).to eq('Large')
    expect(hash[:weight]).to eq('55 - 75 lbs.')
    expect(hash[:height]).to eq('21.5" - 24"')
    expect(hash[:life_span]).to eq('12 - 14 years')
    expect(hash[:group]).to eq('Sporting')
    expect(hash[:origin]).to eq('England (1800s)')
    expect(hash[:role]).to eq('Companion Dog')
    expect(hash[:history]).to eq('Lord Tweedmouth is credited for developing the Golden Retriever. His efforts are one of the most well-documented breeding efforts ever recorded. Bred to be good fetchers and retrievers, Golden Retrievers were recognized by the AKC in 1927.')
    expect(hash[:temperament]).to eq('The Golden Retriever is known to be a devoted, loyal and affectionate family dog that thrives on human companionship. This is an enthusiastic breed; lack of mental and physical exercise can lead to behavioral problems. The Golden Retriever is a sweet, playful dog that loves children and other animals. They tend to bark at strangers, although as a greeting rather than a warning.')
    expect(hash[:health]).to eq('Hip and elbow dysplasia; cataracts; hot spots; hypothyroidism; lymphoma; subaortic stenosis. Be sure to obtain your Golden Retriever from a reputable breeder in order to avoid behavioral and health problems.')
    expect(hash[:excercise]).to eq('Golden Retrievers need several walks per day and enjoy interacting with other dogs. They also enjoy swimming and playing fetch. Although a fenced yard is appreciated, the Golden Retriever can adapt to city living if provided with enough exercise.')
    expect(hash[:grooming]).to eq('Golden Retrievers tend to be heavy shedders and will need brushing several times per week.')
    expect(hash[:nickname]).to eq('')
  end
end
