require "minitest_helper"
require "cli/services/remove_bookmark"

describe RemoveBookmark do
	it "removes a bookmark" do
		service = RemoveBookmark.new id: 4
		service.remove.must_equal true
	end
end