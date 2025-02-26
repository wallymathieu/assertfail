#!/usr/bin/env ruby

require 'rspec'
require 'date'
require 'time'
require_relative 'jekyll_post'

RSpec.describe JekyllPost do
  before do
    # Create a datetime object with +01:00 timezone
    @date = DateTime.new(2014, 4, 9, 12, 30, 0, '+01:00')
  end

  describe '#format_date_for_file' do
    it 'formats the date correctly for file names' do
      expect(JekyllPost.format_date_for_file(@date)).to eq('2014-04-09')
    end
  end

  describe '#format_for_date_field' do
    it 'formats the date correctly for YAML front matter' do
      expect(JekyllPost.format_for_date_field(@date)).to eq('2014-04-09T12:30:00+01:00')
    end
  end

  describe '#yaml_file' do
    it 'generates the correct YAML front matter' do
      expected = <<~YAML
        ---
        layout: post
        title: A pretty title
        date: 2014-04-09T12:30:00+01:00
        ---


      YAML
      
      actual = JekyllPost.yaml_file("A pretty title", @date, nil)
      expect(actual).to eq(expected)
    end
    it 'generates the correct YAML front matter with tags' do
      expected = <<~YAML
        ---
        layout: post
        title: A pretty title
        date: 2014-04-09T12:30:00+01:00
        categories:
        - tag1
        - tag2
        ---


      YAML
      
      actual = JekyllPost.yaml_file("A pretty title", @date, ['tag1', 'tag2'])
      expect(actual).to eq(expected)
    end
  end
  
  # Commented out as in the original Python code
  # describe '#today_or_parse_input' do
  #   it 'returns today\'s date when empty string is provided' do
  #     today = JekyllPost.today_or_parse_input('')
  #     formatted = JekyllPost.format_for_date_field(today)
  #     expect(formatted).to eq('2014-04-09T12:30:00+01:00')
  #   end
  # end
end