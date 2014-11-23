require "minitest_helper"
require "httparty"
require "cli/services/remove_bookmark"
require "cli/services/create_bookmark"

describe RemoveBookmark do
  it "removes a bookmark" do
    create_bookmark = CreateBookmark.new(
    	title: "Net Tuts",
        url: "http://net.tutsplus.com"
    )
    create_bookmark.create
    id = create_bookmark.bookmark.id

    service = RemoveBookmark.new id
    service.remove.must_equal true
  end
end
