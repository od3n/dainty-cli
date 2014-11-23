require "minitest_helper"
require "httparty"
require "cli/service"
require "cli/services/create_bookmark"

describe CreateBookmark do
	it "creates a bookmark" do
		service = CreateBookmark.new(
			title: "Net Tuts",
			url: "http://net.tutsplus.com"
		)
		
		service.create.must_equal true
	end

	it "retrieves the new bookmark" do
		service = CreateBookmark.new(
			title: "Net Tuts",
			url: "http://net.tutsplus.com"
		)

		service.create
		service.bookmark.id.must_be_kind_of Numeric
	end
end