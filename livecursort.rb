#!/usr/bin/ruby

require 'curses'
require 'json'
require 'yaml'
include Curses

# Librerias personalizadas
load 'libs/livecurses.rb'

# variables a usar
$t = 0

$contenido = {}

Dir.glob('jsons/*').each do |n|
  if n.end_with?('.yml')
    d = n.sub('jsons/', '').sub '.yml',''
    $contenido[d] = YAML.load_file(n)
  end
end


init_screen  
start_color
curs_set(0)

Curses.init_pair(0, Curses::COLOR_BLACK, Curses::COLOR_BLACK)
Curses.init_pair(1, Curses::COLOR_BLACK, Curses::COLOR_RED)
Curses.init_pair(2, Curses::COLOR_BLACK, Curses::COLOR_GREEN)
Curses.init_pair(3, Curses::COLOR_BLACK, Curses::COLOR_YELLOW)
Curses.init_pair(4, Curses::COLOR_BLACK, Curses::COLOR_BLUE)
Curses.init_pair(5, Curses::COLOR_BLACK, Curses::COLOR_MAGENTA)
Curses.init_pair(6, Curses::COLOR_BLACK, Curses::COLOR_CYAN)
Curses.init_pair(7, Curses::COLOR_BLACK, Curses::COLOR_WHITE)

Curses.init_pair(8, Curses::COLOR_RED, Curses::COLOR_BLACK)
Curses.init_pair(9, Curses::COLOR_RED, Curses::COLOR_RED)
Curses.init_pair(10, Curses::COLOR_RED, Curses::COLOR_GREEN)
Curses.init_pair(11, Curses::COLOR_RED, Curses::COLOR_YELLOW)
Curses.init_pair(12, Curses::COLOR_RED, Curses::COLOR_BLUE)
Curses.init_pair(13, Curses::COLOR_RED, Curses::COLOR_MAGENTA)
Curses.init_pair(14, Curses::COLOR_RED, Curses::COLOR_CYAN)
Curses.init_pair(15, Curses::COLOR_RED, Curses::COLOR_WHITE)

Curses.init_pair(16, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
Curses.init_pair(17, Curses::COLOR_GREEN, Curses::COLOR_RED)
Curses.init_pair(18, Curses::COLOR_GREEN, Curses::COLOR_GREEN)
Curses.init_pair(19, Curses::COLOR_GREEN, Curses::COLOR_YELLOW)
Curses.init_pair(20, Curses::COLOR_GREEN, Curses::COLOR_BLUE)
Curses.init_pair(21, Curses::COLOR_GREEN, Curses::COLOR_MAGENTA)
Curses.init_pair(22, Curses::COLOR_GREEN, Curses::COLOR_CYAN)
Curses.init_pair(23, Curses::COLOR_GREEN, Curses::COLOR_WHITE)

Curses.init_pair(24, Curses::COLOR_YELLOW, Curses::COLOR_BLACK)
Curses.init_pair(25, Curses::COLOR_YELLOW, Curses::COLOR_RED)
Curses.init_pair(26, Curses::COLOR_YELLOW, Curses::COLOR_GREEN)
Curses.init_pair(27, Curses::COLOR_YELLOW, Curses::COLOR_YELLOW)
Curses.init_pair(28, Curses::COLOR_YELLOW, Curses::COLOR_BLUE)
Curses.init_pair(29, Curses::COLOR_YELLOW, Curses::COLOR_MAGENTA)
Curses.init_pair(30, Curses::COLOR_YELLOW, Curses::COLOR_CYAN)
Curses.init_pair(31, Curses::COLOR_YELLOW, Curses::COLOR_WHITE)

Curses.init_pair(32, Curses::COLOR_BLUE, Curses::COLOR_BLACK)
Curses.init_pair(33, Curses::COLOR_BLUE, Curses::COLOR_RED)
Curses.init_pair(34, Curses::COLOR_BLUE, Curses::COLOR_GREEN)
Curses.init_pair(35, Curses::COLOR_BLUE, Curses::COLOR_YELLOW)
Curses.init_pair(36, Curses::COLOR_BLUE, Curses::COLOR_BLUE)
Curses.init_pair(37, Curses::COLOR_BLUE, Curses::COLOR_MAGENTA)
Curses.init_pair(38, Curses::COLOR_BLUE, Curses::COLOR_CYAN)
Curses.init_pair(39, Curses::COLOR_BLUE, Curses::COLOR_WHITE)

Curses.init_pair(40, Curses::COLOR_MAGENTA, Curses::COLOR_BLACK)
Curses.init_pair(41, Curses::COLOR_MAGENTA, Curses::COLOR_RED)
Curses.init_pair(42, Curses::COLOR_MAGENTA, Curses::COLOR_GREEN)
Curses.init_pair(43, Curses::COLOR_MAGENTA, Curses::COLOR_YELLOW)
Curses.init_pair(44, Curses::COLOR_MAGENTA, Curses::COLOR_BLUE)
Curses.init_pair(45, Curses::COLOR_MAGENTA, Curses::COLOR_MAGENTA)
Curses.init_pair(46, Curses::COLOR_MAGENTA, Curses::COLOR_CYAN)
Curses.init_pair(47, Curses::COLOR_MAGENTA, Curses::COLOR_WHITE)

Curses.init_pair(48, Curses::COLOR_CYAN, Curses::COLOR_BLACK)
Curses.init_pair(49, Curses::COLOR_CYAN, Curses::COLOR_RED)
Curses.init_pair(50, Curses::COLOR_CYAN, Curses::COLOR_GREEN)
Curses.init_pair(51, Curses::COLOR_CYAN, Curses::COLOR_YELLOW)
Curses.init_pair(52, Curses::COLOR_CYAN, Curses::COLOR_BLUE)
Curses.init_pair(53, Curses::COLOR_CYAN, Curses::COLOR_MAGENTA)
Curses.init_pair(54, Curses::COLOR_CYAN, Curses::COLOR_CYAN)
Curses.init_pair(55, Curses::COLOR_CYAN, Curses::COLOR_WHITE)

Curses.init_pair(56, Curses::COLOR_WHITE, Curses::COLOR_BLACK)
Curses.init_pair(57, Curses::COLOR_WHITE, Curses::COLOR_RED)
Curses.init_pair(58, Curses::COLOR_WHITE, Curses::COLOR_GREEN)
Curses.init_pair(59, Curses::COLOR_WHITE, Curses::COLOR_YELLOW)
Curses.init_pair(60, Curses::COLOR_WHITE, Curses::COLOR_BLUE)
Curses.init_pair(61, Curses::COLOR_WHITE, Curses::COLOR_MAGENTA)
Curses.init_pair(62, Curses::COLOR_WHITE, Curses::COLOR_CYAN)
Curses.init_pair(63, Curses::COLOR_WHITE, Curses::COLOR_WHITE)
Curses.crmode
hilos = Array.new
begin               

  loop do
    v1 = Ventana.new(1,1, 0,0)
    v2 = Ventana.new(1,1,0,0)
    v3 = Ventana.new(1,1,0,0)
    v4 = Ventana.new(1,1,0,0)

    [v1,v2,v3,v4].each do |v|
      hilos<<Thread.new(v){|v| v.refresh }
    end
    hilos.each{|e| e.join}
   
    contenido = File.read("ccodigo1.rbd")
    eval(contenido)
   $t += 1
  end
rescue 
  [v1,v2,v3,v4].each do |v|
    hilos<< Thread.new(v){ v.close }
  end
  hilos.each{|e| e.join}
  close_screen
end

