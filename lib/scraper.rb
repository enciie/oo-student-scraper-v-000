require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    students = []

    doc.css("div.roster-cards-container").each do |card|
      card.css("div.student-card a").each do |student|

        student_name = student.css("h4.student-name").text
        student_location = student.css("p.student-location").text
        student_url = student.attr('href')
        students << {name: student_name, location: student_location, profile_url: student_url}
      end
    end
    students
  end

#twitter url, linkedin url, github url, blog url, profile quote, and bio.
  def self.scrape_profile_page(profile_url)

    html = open(profile_url)
    profile_page = Nokogiri::HTML(html)

    student = {}

    links = profile_page.css(".social-icon-container").children.css("a")
    student[:twitter] = profile_page.css(".social-icon-container").children.css("a")[0].attribute("href").value
    if profile_page.css(".social-icon-container").children.css("a")[0]
    student[:linkedin] = profile_page.css(".social-icon-container").children.css("a")[1].attribute("href").value
    if profile_page.css(".social-icon-container").children.css("a")[1]
    student[:github] = profile_page.css(".social-icon-container").children.css("a")[2].attribute("href").value
    profile_page.css(".social-icon-container").children.css("a")[2]
    student[:blog] = profile_page.css(".social-icon-container").children.css("a")[3].attribute("href").value
    profile_page.css(".social-icon-container").children.css("a")[3]

    
  end

end
