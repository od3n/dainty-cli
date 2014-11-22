require "minitest_helper"
require "cli/services/update_bookmark"

module Cli
	describe UpdateBookmark do
		it "updates an existing bookmark" do
			service = UpdateBookmark.new id: 2, title: "AE Tuts", url: "http://ae.tutsplus.com"
			service.update.must_equal true
		end
	end
end