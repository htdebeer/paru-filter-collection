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
require 'watir'

FIG = 'fig:' # if an image is a block, its title starts with 'fig:'

def take_screenshot(url, path)
  url = "file://#{File.absolute_path url}" unless url.start_with?("http://", "https://", "file://")

  browser = Watir::Browser.new :firefox
  browser.goto url
  Watir::Wait.until { browser.body.visible? }
  browser.screenshot.save path
  browser.quit
end

Paru::Filter.run do
  with "Image" do |image|
    title_string = image.target.title.strip

    command, url, *title = title_string.gsub(FIG, '').split(/\s+/)
    
    if command == "::paru::screenshot"
      take_screenshot url, image.target.url.gsub(/\\_/, '_')
      image.target.title = title.join(' ')
      image.target.title.prepend FIG if title_string.start_with? FIG
    end
  end
end
