#!/usr/bin/env python

###############################################################################
## For each pairs of proteins  in a given list save the PNG image of
## STRING network of their 15 most confident interaction partners.
## - make my input protein pairs in color and the niegborhood proteins in white
## - set the network flavour to "confidence"
###############################################################################

import urllib
from time import sleep

string_api_url = "https://string-db.org/api"
output_format = "image"
method = "network"

my_genes = [["YMR055C", "YFR028C"],
             ["YNL161W", "YOR373W"],
             ["YFL009W", "YBR202W"]]

species = "4932"
my_app  = "www.awesome_app.org"

## Construct the request

request_url = string_api_url + "/" + output_format + "/" + method + "?"
request_url += "identifiers=%s"
request_url += "&" + "species=" + species
request_url += "&" + "add_white_nodes=15" 
request_url += "&" + "caller_identity=" + my_app

## For each gene call STRING

for gene_pair in my_genes:
    gene1, gene2 = gene_pair
    urllib.urlretrieve(request_url % "%0d".join(gene_pair), "%s.png" % "_".join(gene_pair))
    sleep(1)
