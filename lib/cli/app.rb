require 'thor'
require 'cli'

module Cli
	##
	# This Thor application is responsible for providing the interface to the
	# command-line user.
	#
	# @example Listing bookmarks
	#
	#  dainty list
	#
	# @example Creating a bookmark
	#
	#  dainty create --title "My Bookmark" --url "http://example.com"
	class App < Thor
		desc :list, "List bookmarks"
		def list
			list = ListBookmarks.new.list
			list.each do |bookmark|
				puts bookmark.title, bookmark.url
			end
		end

		desc :create, "Creates a bookmark"
		option :title, required: true
		option :url, required: true
		def create
			service = CreateBookmark.new title: options[:title], url: options[:url]
			if service.create
				puts "Created bookmark for #{options[:title]}."
			end
		end

		desc :update, "Updates a bookmark"
		option :id, required: true
		option :title
		option :url
		def update
			service = UpdateBookmark.new(
				id: options[:id],
				title: options[:title],
				url: options[:url]
			)
			if service.update
				puts "Updated bookmark, it is now #{options[:title]}."
			end
		end

		desc :remove, "Removes a bookmark"
		def remove id
			service = RemoveBookmark.new id
			if service.remove
				puts "Removed bookmark with id #{id}."
			end
		end
	end
end