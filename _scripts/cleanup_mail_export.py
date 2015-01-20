#!/usr/bin/python
import csv
import sys

filename = sys.argv[1]

with open(filename, 'rb') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        last = row[0]
        first = row[1]
        mails = row[2].split(';')
        for mail in mails:
            print ','.join((last.strip(), first.strip(), mail.strip(),'2014 Season'))

