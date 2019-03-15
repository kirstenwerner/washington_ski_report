require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "washington_ski_report/version"

module WashingtonSkiReport
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './washington_ski_report/scraper'
require_relative './washington_ski_report/cli'
require_relative './washington_ski_report/resorts'
