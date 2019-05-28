#!/usr/bin/env python

##############################################################
## The script prints out the p-value of STRING protein-protein
## interaction enrichment method for the given set of proteins 
##############################################################

import sys
import urllib2

string_api_url = "https://string-db.org/api"
output_format = "tsv-no-header"
method = "ppi_enrichment"

my_genes = ['7227.FBpp0074373', '7227.FBpp0077451', '7227.FBpp0077788',
            '7227.FBpp0078993', '7227.FBpp0079060', '7227.FBpp0079448']

species = "7227"
my_app  = "www.awesome_app.org"

## Construct the request

request_url = string_api_url + "/" + output_format + "/" + method + "?"
request_url += "identifiers=" + "%0d".join(my_genes)
request_url += "&" + "species=" + species
request_url += "&" + "caller_identity=" + my_app

## Call STRING

try:
    response = urllib2.urlopen(request_url)
except urllib2.HTTPError as err:
    error_message = err.read()
    print error_message
    sys.exit()

## Read and parse the results

result = response.readline()

if result:
    pvalue = result.strip().split("\t")[5]
    print pvalue
