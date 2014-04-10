#!/usr/bin/python

"""
jekyll-post - this is a simple script that will create and initialize a new
Jekyll post file. The default is a markdown file (.md) and the yaml options
listed below will be part of the initialization.

jekyll-post [-w] [-d date] [title]

title   the title of the post wrapped in quotes, e.g. "post title here"
-D      the directory (relative or absolute) that the file should be written to.
-d      the default date is today's date or this option can be used to specify
        a date. The date must be specified in the format YYYY-MM-DD.
-n      the name for the post file instead of using the automatically generated one.
-t      the tags that should be added to the yaml portion of the file separated
        by spaces and the whole thing wrapped in quotes.
-w      this optional flag will signal the file to be opened for writing in vi.


yaml options
---
layout: post
title: [title]
summary:
status: draft
hn-discussion:
tags:
- tag1
- tag2
- tag3
---
"""

# Import Statements
import argparse
import datetime
import subprocess
import os.path
import sys
import time

from dateutil.tz import tzlocal

DEFAULT_EXT = 'md'

def format_date_for_file(today):
    #today = datetime.datetime.now()
    year = str(today.year)
    month = str(today.month)
    if len(month) == 1:
        month = '0' + month
    #month = today.month > 9 ? str(today.month) : '0' + str(today.month)
    day = str(today.day)
    if len(day) == 1:
        day = '0' + day
    #day = today.day > 9 ? str(today.day) : '0' + str(today.day)
    date = "-".join([year,month,day])
    return date

def today_or_parse_input(input):
    date = None
    if input:
        date = datetime.datetime.strptime(input, '%Y-%m-%d')
    else: # use today's date
        date = datetime.datetime.now(tzlocal())
    return date

def get_z_delta(input):
    delta = None
    if input.utcoffset()==0:
        delta = '+00:00'
    else:
        f = input.strftime("%z")
        delta = f[:3]+':'+f[3:]
    return delta

def format_for_date_field(input):
    delta = get_z_delta(input)
    return input.strftime('%Y-%m-%dT%H:%M:%S') + delta

def yaml_file(title, date, tags):
    f = []
    f.append('---\n')
    f.append('layout: post\n')
    f.append('title: ' + title + '\n')
    f.append('date: ' + format_for_date_field(date) + '\n')

    f.append('categories:\n')
    if tags:
        f.append('tags:\n')
        for tag in tags:
            f.append('- ' + tag + '\n')
    f.append('---\n\n\n')
    return ''.join(f)

def main():
    # parse the arguments
    parser = argparse.ArgumentParser(description='Create a new Jekyll post.')
    parser.add_argument('title', help='the title of the post wrapped in quotes.')
    parser.add_argument('-D', '--Dir', help='specify the directory (relative or absolute) that the file should be written to.')
    parser.add_argument('-d', '--date', help='specify the post date in the format YYYY-MM-DD, otherwise today is the default date.')
    parser.add_argument('-n', '--name', help='specify the name of the post file instead of the automatically generated one. It is a best practice for the words to be separated by hyphens. Also note that the given name will be prepended with the date so as to conform to Jekyll naming requirements.')
    parser.add_argument('-t', '--tags', help='specify a set of tags for the post separated by spaces with the entire set wrapped in quotes (e.g. "tag1 tag2 tag3").')
    parser.add_argument('-w', '--write', action="store_true",
        help='signals if this file should be opened for writing after creation')
    args = parser.parse_args()

    title = args.title
    # exchange spaces for dashes
    dash_title = ''
    if args.name:
        dash_title = args.name.replace(' ','-')
    else:
        dash_title = title.replace(' ','-')

    # clean up any special characters from the dash-title
    temp_title = '';
    for char in dash_title:
        if char.isalnum() or char == '-':
            temp_title += char
    dash_title = temp_title

    date = today_or_parse_input(args.date)

    #filename = '%s-%s.%s', date, title, DEFAULT_EXT
    filename = format_date_for_file(date) + '-' + dash_title + '.' + DEFAULT_EXT

    # if Dir is specified, append to front of filename
    if args.Dir:
        filename = os.path.join(args.Dir, filename)
    else:
        filename = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '_posts', filename)

    # check if the desired file already exists
    if os.path.exists(filename):
        # file already exists, abort the program
        print filename + ' already exists.'
        print 'Jekyll post NOT created.'
        sys.exit(1)

    # collect any tags included in the args
    tags = []
    if args.tags:
        tags = args.tags.split(' ')

    # try writing yaml to the post file
    try:
        f = open(filename, 'w')

        # write yaml to file
        try:
            f.write(yaml_file(title, date, tags))
        finally:
            f.close()
    except IOError:
        print 'Issue writing to Jekyll post file.'

    # if write flag is on, then try to open file with vi
    if args.write:
        subprocess.call(['vim', filename])

    # print confirmation statement
    print 'New Jekyll post "' + title + '" has been created -- ' + filename

if __name__ == '__main__':
    main()

