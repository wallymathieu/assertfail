#!/usr/bin/env python3
import unittest

import jekyll_post
import datetime
import time

class TIMEZONE(datetime.tzinfo):
    def utcoffset(self, dt):
      return datetime.timedelta(hours=+1)

    def dst(self, dt):
        return datetime.timedelta(0)

class JekyllPostTest(unittest.TestCase):
    def setUp(self):
        self.date = datetime.datetime(2014, 4, 9, 12, 30, 0, 0, TIMEZONE())

    def test_format_date_for_file(self):
        self.assertEqual('2014-04-09', jekyll_post.format_date_for_file(self.date))

    def test_today_or_parse_input(self):
        formated = jekyll_post.format_for_date_field(self.date)
        self.assertEqual('2014-04-09T12:30:00+01:00', formated)

    def test_yaml_file(self):
        file = jekyll_post.yaml_file("A pretty title", self.date, None)
        expected = """---
layout: post
title: A pretty title
date: 2014-04-09T12:30:00+01:00
---


"""
        self.assertEqual(expected, file)

    #def test_today(self):
        #today = jekyll_post.today_or_parse_input('')
        #formated = jekyll_post.format_for_date_field(today)
        #self.assertEqual('2014-04-09T12:30:00+01:00', formated)


if __name__ == '__main__':
    unittest.main()
