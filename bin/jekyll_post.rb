#!/usr/bin/env ruby

require 'optparse'
require 'date'
require 'fileutils'
require 'time'

DEFAULT_EXT = 'md'

def format_date_for_file(today)
  today.strftime('%Y-%m-%d')
end

def today_or_parse_input(input)
  if input
    DateTime.strptime(input, '%Y-%m-%d')
  else
    DateTime.now
  end
end

def get_z_delta(input)
  input.strftime('%:z')
end

def format_for_date_field(input)
  delta = get_z_delta(input)
  input.strftime('%Y-%m-%dT%H:%M:%S') + delta
end

def yaml_file(title, date, tags)
  f = []
  f << "---\n"
  f << "layout: post\n"
  f << "title: #{title}\n"
  f << "date: #{format_for_date_field(date)}\n"

  if tags && !tags.empty?
    f << "categories:\n"
    tags.each { |tag| f << "- #{tag}\n" }
  end

  f << "---\n\n\n"
  f.join
end

def format_title(title)
  dash_title = title.gsub(' ', '-')
  dash_title.gsub(/[^a-zA-Z0-9-]/, '')
end

if __FILE__ == $PROGRAM_NAME

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: jekyll_post.rb [options] title"
  
    opts.on('-D', '--dir DIR', 'Specify the directory (relative or absolute) to write the file to.') do |dir|
      options[:dir] = dir
    end
  
    opts.on('-d', '--date DATE', 'Specify the post date in the format YYYY-MM-DD.') do |date|
      options[:date] = date
    end
  
    opts.on('-n', '--name NAME', 'Specify the name of the post file.') do |name|
      options[:name] = name
    end
  
    opts.on('-t', '--tags TAGS', 'Specify tags for the post, separated by spaces and wrapped in quotes.') do |tags|
      options[:tags] = tags.split(' ')
    end
  
    opts.on('-w', '--write', 'Open the file for editing after creation.') do
      options[:write] = true
    end
  end.parse!

  title = ARGV[0]
  unless title
    puts 'Title is required.'
    exit 1
  end

  dash_title = options[:name] ? format_title(options[:name]) : format_title(title)

  date = today_or_parse_input(options[:date])
  filename = "#{format_date_for_file(date)}-#{dash_title}.#{DEFAULT_EXT}"

  if options[:dir]
    filename = File.join(options[:dir], filename)
  else
    filename = File.join(File.dirname(__FILE__), '..', '_posts', filename)
  end

  if File.exist?(filename)
    puts "#{filename} already exists."
    puts 'Jekyll post NOT created.'
    exit 1
  end

  tags = options[:tags] || []

  begin
    File.open(filename, 'w') do |f|
      f.write(yaml_file(title, date, tags))
    end
  rescue IOError => e
    puts "Issue writing to Jekyll post file: #{e.message}"
    exit 1
  end

  if options[:write]
    system("vim #{filename}")
  end

  puts "New Jekyll post \"#{title}\" has been created -- #{filename}"
end