#!/usr/bin/env ruby

require 'date'
require 'time'
require 'optparse'
require 'fileutils'

DEFAULT_EXT = 'md'

class JekyllPost
  def self.format_date_for_file(date)
    date.strftime('%Y-%m-%d')
  end

  def self.today_or_parse_input(input)
    if input && !input.empty?
      Date.parse(input).to_datetime
    else
      DateTime.now
    end
  end

  def self.format_for_date_field(date)
    date.strftime('%Y-%m-%dT%H:%M:%S%:z')
  end

  def self.yaml_file(title, date, tags)
    content = []
    content << "---\n"
    content << "layout: post\n"
    content << "title: #{title}\n"
    content << "date: #{format_for_date_field(date)}\n"

    if tags && !tags.empty?
      content << "categories:\n"
      tags.each do |tag|
        content << "- #{tag}\n"
      end
    end
    
    content << "---\n\n\n"
    content.join
  end

  def self.format_title(title)
    dash_title = title.gsub(' ', '-')
    
    # clean up any special characters from the dash-title
    dash_title.gsub(/[^a-zA-Z0-9\-]/, '')
  end

  def self.main
    options = {}
    
    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: jekyll-post [options] title"

      opts.on("-D", "--Dir DIRECTORY", "Specify the directory for the post file") do |dir|
        options[:dir] = dir
      end

      opts.on("-d", "--date DATE", "Specify the post date (YYYY-MM-DD)") do |date|
        options[:date] = date
      end

      opts.on("-n", "--name NAME", "Specify the name of the post file") do |name|
        options[:name] = name
      end

      opts.on("-t", "--tags TAGS", "Specify tags for the post") do |tags|
        options[:tags] = tags
      end

      opts.on("-w", "--write", "Open the file for writing after creation") do
        options[:write] = true
      end
    end

    opt_parser.parse!
    
    if ARGV.empty?
      puts "Error: Title is required"
      puts opt_parser
      exit(1)
    end

    title = ARGV[0]
    
    dash_title = if options[:name]
                  format_title(options[:name])
                else
                  format_title(title)
                end

    date = today_or_parse_input(options[:date])
    
    filename = "#{format_date_for_file(date)}-#{dash_title}.#{DEFAULT_EXT}"
    
    if options[:dir]
      filename = File.join(options[:dir], filename)
    else
      filename = File.join(File.dirname(File.expand_path(__FILE__)), '..', '_posts', filename)
    end
    
    if File.exist?(filename)
      puts "#{filename} already exists."
      puts "Jekyll post NOT created."
      exit(1)
    end
    
    tags = options[:tags] ? options[:tags].split(' ') : []
    
    begin
      File.open(filename, 'w') do |f|
        f.write(yaml_file(title, date, tags))
      end
    rescue IOError
      puts "Issue writing to Jekyll post file."
      exit(1)
    end
    
    if options[:write]
      system('vim', filename)
    end
    
    puts "New Jekyll post \"#{title}\" has been created -- #{filename}"
  end
end

if __FILE__ == $0
  JekyllPost.main
end