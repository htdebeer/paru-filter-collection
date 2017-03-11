#!/usr/bin/env ruby
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
