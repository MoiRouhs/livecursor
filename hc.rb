#!/usr/bin/ruby

require 'yaml'
require 'json'

##f1 = File.open('sw.json', 'w')
##f1.write(JSON.pretty_generate(sw))
#sy = YAML.load_file('jsons/sw.yml')
#sj = JSON.parse(File.read('jsons/sw.json'))
#
#si = YAML.load_file('jsons/imagenes.yml')
#f1 = File.open('imagenes.json', 'w')
#f1.write(JSON.pretty_generate(si))
#
#puts si.class
#puts sj['e']['s'][0] +  sy['e']['t'][0]
#puts sj['e']['s'][1] +  sy['e']['t'][1]
#puts sj['e']['s'][2] +  sy['e']['t'][2]
#puts sj['e']['s'][3] +  sy['e']['t'][3]
#puts sj['e']['s'][4] +  sy['e']['t'][4]
#puts sj['e']['s'][5] +  sy['e']['t'][5]
#puts sj['e']['s'][6] +  sy['e']['t'][6]

v = 'hola'
t = ['a','d','s']
case t
when String
  puts 'es texto'
when Array
  puts 'Es arreglo'
else
  puts 'mal'
end
