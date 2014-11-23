class Bookmark
	attr_reader :title, :url, :id
	def initialize options
		@id = options["id"]
		@title = options["title"]
		@url = options["url"]
	end	
end