require 'minitest_helper'
require 'cli/app'

describe Cli::App do
	it "prints the list of bookmarks" do
		output = capture_io { Cli::App.start %w(list) }.first #stdout
		output.must_include "Tuts"
	end

	it "creates a bookmark" do
		output, error = capture_io do
			Cli::App.start [
				"create",
				"--title='Net Tuts'",
				"--url='http://net.tutsplus.com'"
			]
		end # stdout, stderr

		output.must_include "Created bookmark for 'Net Tuts'."
	end

	it "updates a bookmark" do
		output, error = capture_io do
			Cli::App.start [
				"update",
				"--id=3",
				"--title='Jose Mota'",
				"--url='http://josemota.net"
			]
		end # stdout, stderr

		output.must_include "Updated bookmark, it is now 'Jose Mota'."
	end

	it "removes a bookmark" do
		create_bookmark = CreateBookmark.new title: "A", url: "a.com"
		create_bookmark.create
		id = create_bookmark.bookmark.id

		output, error = capture_io do
			Cli::App.start [ 'remove', id.to_s ]
		end

		output.must_include "Removed bookmark with id #{id.to_s}."
	end
end
