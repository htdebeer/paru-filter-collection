#!/usr/bin/env ruby
# Copyright 2017 Huub de Beer <Huub@heerdebeer.org>
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

require 'paru/filter'

Paru::Filter.run do
    with "Image" do |image|
        title_string = image.inner_markdown.strip
        command, *title = title_string.split(/\s+/)

        if command == "::paru::dot"
            to_dot = image.target.url.gsub(/\\_/, '_')
            base = File.basename(to_dot, ".dot")
            dotted = "#{base}.svg"

            `dot -Tsvg -o #{dotted} #{to_dot}`

            image.target.url = dotted
            image.inner_markdown = title.join(" ")
        end
    end
end
