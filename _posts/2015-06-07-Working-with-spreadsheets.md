---
layout: post
title: Working with spreadsheets
date: 2015-06-07T22:42:15+02:00
---

## Excel html table hack

I've used the classic web hack where you send an html file with excel mime type (and file ending) containing a table. I've had trouble with excel being more particular about allowing this hack nowadays. Another problematic aspect is if a user sends you such a file without re-saving it. Since we have open xml based formats for spreadsheets, there is no need for this hack.

## CSV
I've used diffent csv-like formats. These have the con of being dependant on the language settings (one partial fix is to detect the user language settings and render different formats). If you are using more than ascii you might also need to do a binary comparison of an excel generated csv and what you generate. Since csv looks fairly simple, many write a short regex to parse it. This has a tendency to devolve due to the different ways that you can implement csv. You can get into trouble when you are begin to support character escaping and newlines. I prefer if you can keep this kind of messy logic out of your otherwise relatively clean domain code (for instance by [using a different language](https://github.com/Lundalogik/go_import/) ). By using a different deliverable to transform data into predefined format you have an easier time to use many different libraries to parse weird formats.

## Xml based (.xlsx)
Due to the popularity of javascript we have some libraries that you can use to generate xlsx files on the clientside. I've tried [excel-builder](https://github.com/stephenliberty/excel-builder.js) and have been able to use it. From a programmer friend I've heard that he has used [exceljs](https://github.com/guyonroche/exceljs) in order to generate excel files on nodejs. The documentation of excel-builder is lacking, but it was easier to get it to work than [js-xlsx](https://github.com/SheetJS/js-xlsx). In order to work with excel-builder I read the excel-builder source and compared excel-generated .xlsx files with what the program generated. Most of my problems was due to the client specifying how the excel file should be styled.

