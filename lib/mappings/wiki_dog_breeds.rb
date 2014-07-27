module Mappings
  class WikiDogBreeds
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def data
      {
        photo_url: photo_url(page),
        origin: origin(page),
        weight: weight(page),
      }
    end

    private

    def photo_url(page)
      "http:" <<
      page.search("table.infobox a.image img").attribute("src").text.strip
    end

    def origin(page)
      page.search("//*[text()='Country of origin']/following-sibling::*[1]").search('td a').text.strip
    end

    def weight(page)
      hash =  {}
      weight = page.search("//*[text()='Weight']/following-sibling::*[1]").search('td')
      if weight.text == "Male"
        hash[:male] = male_weight(page)
        hash[:female] = female_weight(page)
      end
      hash
    end

    def male_weight(page)
      page.search("//*[text()='Weight']/following-sibling::*[2]").search('td').text
    end

    def female_weight(page)
      female_weight =  page.search("//*[text()='Weight']/ancestor::tr/following-sibling::*[1]").search('td')[1].text
    end

  end
end
