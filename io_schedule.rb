require 'rubygems'
require 'sinatra'
require 'sinatra/partial'
require 'active_support/core_ext/object/try'

module ApplicationHelper
  def parse_days(week)
    resp = []
    (2..5).each do |day|
      resp << week.select{|l| l["day_number"] == day.to_s }
    end
    resp
  end

  def parse_lesson(day, number)
    [parse_lesson_attrs(day, number).try(:[], "lesson_name"), parse_lesson_attrs(day, number).try(:[], "lesson_type"), parse_lesson_attrs(day, number).try(:[], "teacher_name")]
  end

  def parse_lesson_attrs(day, number)
    day.select{|lesson| lesson["lesson_number"] == number}[0]
  end
end

class IoSchedule < Sinatra::Base

  helpers ApplicationHelper
  register Sinatra::Partial

  set :partial_template_engine, :erb
  set :public_folder => "public", :static => true
  set :partial_underscores, true

  get "/" do
    @week1 = parse_days(JSON.parse(HTTParty.get('http://api.rozklad.org.ua/v1/groups/507/lessons/?week=1').body))
    @week2 = parse_days(JSON.parse(HTTParty.get('http://api.rozklad.org.ua/v1/groups/507/lessons/?week=2').body))
    erb :welcome
  end
end

