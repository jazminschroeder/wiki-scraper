module Mappings
  class BjDogBreeds
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def data
      {
        excercise: excercise(page),
        grooming: grooming(page),
        group: group(page),
        health: health(page),
        height: height(page),
        history: history(page),
        life_span: life_span(page),
        nickname: nickname(page),
        origin: origin(page),
        role: role(page),
        size: size(page),
        temperament: temperament(page),
        weight: weight(page),
      }
    end

    private

    def excercise(page)
      page.search('span[id=excercise]').text
    end

    def grooming(page)
      page.search('span[id=grooming]').text
    end
    def size(page)
      page.search('p[id=size]').text[/(?<=: ).+/]
    end

    def weight(page)
      page.search('p[id=weight]').text[/(?<=: ).+/]
    end

    def height(page)
      page.search('p[id=height]').text[/(?<=: ).+/]
    end

    def life_span(page)
      page.search('p[id=life]').text[/(?<=: ).+/]
    end

    def nickname(page)
      nickname = page.search('p[id=aka]').text[/(?<=: ).+/]
      return "" if nickname == "No Nicknames."
      nickname
    end

    def group(page)
      page.search('p[id=group]').text[/(?<=: ).+/]
    end

    def origin(page)
      page.search('p[id=origin]').text[/(?<=: ).+/]
    end

    def role(page)
      page.search('p[id=role]').text[/(?<=: ).+/]
    end

    def history(page)
      page.search('p[id=history]').text[/(?<=: ).+/]
    end

    def temperament(page)
      page.search('p[id=temperament]').children[2].text
    end

    def health(page)
      page.search('p[id=health]').children[2].text
    end

  end
end
