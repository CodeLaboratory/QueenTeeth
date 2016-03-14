#!/usr/bin/env ruby

# This file is part of QueenTeeth.
# (c) Jesus Leon <git@jes.mx>
# For the full copyright and license information, please view 
# the LICENSE file that was distributed with this source code.

require 'rubygems'
require 'active_resource'
require 'date'
require 'time'

load 'config.rb'
load 'queenteeth/issuecollection.rb'
load 'queenteeth/issue.rb'
load 'queenteeth/timeentry.rb'
load 'queenteeth/queenteeth.rb'

q = QueenTeeth. new
q.run(ARGV)
