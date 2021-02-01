#!/usr/bin/ruby

require 'curses'
require 'rainbow'

puts ""
puts Rainbow("   ¿Hay colectivos    ").magenta.bright.blink
puts Rainbow("    De livecoding   ").green.bright.blink
puts Rainbow("    en Bogotá?   ").red.bright.blink

sleep 5
Curses.init_screen  
Curses.start_color
Curses.curs_set(0)

Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_CYAN)
Curses.init_pair(2, Curses::COLOR_WHITE, Curses::COLOR_RED)
Curses.init_pair(3, Curses::COLOR_CYAN, Curses::COLOR_MAGENTA)
Curses.init_pair(4, Curses::COLOR_BLACK, Curses::COLOR_YELLOW)
Curses.init_pair(5, Curses::COLOR_BLUE, Curses::COLOR_WHITE)
Curses.init_pair(6, Curses::COLOR_MAGENTA, Curses::COLOR_BLUE)
Curses.init_pair(7, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
Curses.init_pair(8, Curses::COLOR_CYAN, Curses::COLOR_GREEN)
Curses.init_pair(9, Curses::COLOR_MAGENTA, Curses::COLOR_GREEN)
Curses.init_pair(10, Curses::COLOR_YELLOW, Curses::COLOR_CYAN)
Curses.init_pair(11, Curses::COLOR_RED, Curses::COLOR_BLACK)


t = 0
ty = 0
tx = 0
d = 1
c = "_La _salpi_codera_"
begin               
    # Building a static window
  ventana = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)

  ventana.refresh
  loop do

    (0...ventana.maxx).each do |e|
      (0...ventana.maxy).each do |r|
        if rand(30)%1 == 0
          d = rand(10)
        end
        ventana.attrset(Curses.color_pair(d))
        ventana.setpos(r,e)
        ventana.addstr(c[rand(0...c.length)])
      end
    end
    
    if t < 1
      t += 1
    else
      rx = ventana.maxx - 11
      tx = rand(0...rx)
      ry = ventana.maxy - 6
      ty = rand(0...ry)
      t = 0
    end

    ventana.box("|", "-")
    ventana.attrset(Curses.color_pair(11))
    ventana.setpos(1 + ty,2 + tx)
    ventana.addstr("   ")
    ventana.setpos(2 + ty,1 + tx)
    ventana.addstr(" _La  ")
    ventana.setpos(3 + ty,1 + tx)
    ventana.addstr(" _salpi_ ")
    ventana.setpos(4 + ty,1 + tx)
    ventana.addstr(" _codera_ ")
    ventana.setpos(5 + ty,1 + tx)
    ventana.addstr("          ")
    ventana.refresh
    ventana.clear
    sleep 0.5
  end
  
   ventana.clear
   ventana.refresh
   ventana.close

rescue => ex

  Curses.close_screen
end

