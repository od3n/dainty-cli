Class RemoveBookmark < Service
	def initialize id
		@id = id
	end

	def remove
		response = request "/bookmarks/#{@id}", :delete
		response.code == 204 # No Content
	end
end