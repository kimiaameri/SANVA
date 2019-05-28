#!/usr/bin/env python

################################################################
## For a given list of proteins single out only the interactions
## which have experimental evidences and print out their score
################################################################

import sys
import urllib2


string_api_url = "https://string-db.org/api"
output_format = "tsv-no-header"
method = "network"

my_genes = ["CDC42","CDK1","KIF23","PLK1",
            "RAC2","RACGAP1","RHOA","RHOB"]
species = "1280"
my_app  = "www.awesome_app.org"

## Construct the request

request_url = string_api_url + "/" + output_format + "/" + method + "?"
request_url += "identifiers=%s" % "%0d".join(my_genes)
request_url += "&" + "species=" + species
request_url += "&" + "caller_identity=" + my_app

try:
    response = urllib2.urlopen(request_url)
except urllib2.HTTPError as err:
    error_message = err.read()
    print error_message
    sys.exit()

## Read and parse the results

line = response.readline()

while line:
    l = line.strip().split("\t")
    p1, p2 = l[2], l[3]
    experimental_score = float(l[10])
    if experimental_score != 0:
        print "\t".join([p1,p2, "experimentally confirmed (prob. %.3f)" % experimental_score])

    line = response.readline()
