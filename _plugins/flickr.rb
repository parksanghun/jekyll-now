require "json"
require "net/http"

module Jekyll
	class FlickrUrlMaker < Liquid::Tag
		def initialize(tag_name, id, tokens)
			super
			@id = id.delete(' ')
		end

		def render(context)
			key = '56517172bcde43971b25a82a2ceaee90'
			url = 'https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key='+key+'&photo_id='+@id+'&format=json&nojsoncallback=1'

			puts url

			uri = URI(url)
			response = Net::HTTP.get(uri)

			obj = JSON.parse(response)

			obj['sizes']['size'].each do |c|
				if c['label'] == 'Original'
					return c['source']
				end
			end
		end
	end
end

Liquid::Template.register_tag('flickr', Jekyll::FlickrUrlMaker)