require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_courses
  end

  def make_courses
  end

  def get_page
    page = Nokogiri::HTML(open(http://learn-co-curriculum.github.io/site-for-scraping/courses))
    page
  end
end
