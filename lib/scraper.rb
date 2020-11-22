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
    page = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    page.css('main')
  end

  def make_courses
    self.get_courses.each do |course|
    new_course = Course.new
    new_course.title = course.css("h2").text
    new_course.schedule = course.css("date").text

  end

  def get_page
    page = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
end
