#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'jekyll_post'
require 'time'

class TIMEZONE
  def utc_offset
    3600 # +1 hour in seconds
  end

  def dst?
    false
  end
end

class JekyllPostTest < Minitest::Test
  def setup
    @date = Time.new(2014, 4, 9, 12, 30, 0, TIMEZONE.new.utc_offset)
  end

  def test_format_date_for_file
    assert_equal '2014-04-09', format_date_for_file(@date)
  end

  def test_today_or_parse_input
    formatted = format_for_date_field(@date)
    assert_equal '2014-04-09T12:30:00+01:00', formatted
  end

  def test_yaml_file
    file = yaml_file("A pretty title", @date, nil)
    expected = <<~YAML
      ---
      layout: post
      title: A pretty title
      date: 2014-04-09T12:30:00+01:00
      ---


    YAML
    assert_equal expected, file
  end
end
