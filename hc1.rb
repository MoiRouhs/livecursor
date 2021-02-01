#!/usr/bin/ruby

require 'yaml'
require 'json'

#f1 = File.open('sw.json', 'w')
#f1.write(JSON.pretty_generate(sw))
#sy = YAML.load_file('jsons/sw.yml')
#sj = JSON.parse(File.read('jsons/sw.json'))
#
#si = YAML.load_file('jsons/imagenes.yml')
#f1 = File.open('imagenes.json', 'w')
#f1.write(JSON.pretty_generate(si))
contenido = {}

Dir.glob('jsons/*').each do |n|
  if n.end_with?('.yml')
    d = n.sub('jsons/', '').sub '.yml',''
    contenido[d] = YAML.load_file(n)
  end
end
puts contenido.keys
dis = 0 
l = contenido['imagenes']['e']['murcielago'].length
  puts "L #{l}"
l.times do |i|
  dis2 =  contenido['imagenes']['e']['murcielago'][i]
  #puts dis2.length
  #puts dis.class
  dis = dis <= dis2.length ? dis2.length : dis
  puts dis2
end

puts "dis #{dis}"

'h'.split('').each do |w|
  puts w
end

