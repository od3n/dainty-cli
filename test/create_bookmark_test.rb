require "minitest_helper"
require "cli/services/create_bookmark"

describe CreateBookmark do
	it "creates a bookmark" do
		service = CreateBookmark.new(
			title: "Net Tuts",
			url: "http://net.tutsplus.com"
		)
		service.create.must_equal true
	end
end