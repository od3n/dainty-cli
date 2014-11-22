require 'minitest_helper'
require 'cli/app'

describe Cli::App do
	it "prints the list of bookmarks" do
		output = capture_io { Cli::App.start %w(list) }.first #stdout
		output.must_include "Tuts+"
	end

	it "creates a bookmark" do
		output, error = capture_io do
			Cli::App.start [
				"create",
				"--title='Net Tuts'",
				"--url='http://net.tutsplus.com'"
			]
		end # stdout, stderr

		puts error
		output.must_include "Created bookmark for 'Net Tuts'."
	end
end
