require 'curses'
include Curses

Curses.init_screen  
Curses.start_color
Curses.curs_set(0)

Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_CYAN)
Curses.init_pair(2, Curses::COLOR_WHITE, Curses::COLOR_BLACK)
Curses.init_pair(3, Curses::COLOR_RED, Curses::COLOR_BLACK)
Curses.init_pair(4, Curses::COLOR_RED, Curses::COLOR_YELLOW)
Curses.init_pair(5, Curses::COLOR_BLUE, Curses::COLOR_BLACK)
Curses.init_pair(6, Curses::COLOR_MAGENTA, Curses::COLOR_BLUE)
Curses.init_pair(7, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
Curses.init_pair(8, Curses::COLOR_RED, Curses::COLOR_GREEN)
Curses.init_pair(9, Curses::COLOR_MAGENTA, Curses::COLOR_GREEN)
Curses.init_pair(10, Curses::COLOR_YELLOW, Curses::COLOR_CYAN)


t = 1

begin               
    # Building a static window
   ventana = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
   ventana.setpos(2, 2)
   ventana.addstr("Hello")
   ventana.refresh

  loop do
    ventana.attrset(Curses.color_pair(3))
    ventana.box("|", "-")
    ventana.setpos(rand(1..(ventana.maxy - 1)), rand(1..(ventana.maxx - 1)))
    if rand(30)%3 == 0
      t = rand(10)
    end
    ventana.attrset(Curses.color_pair(t))
    ventana.addstr("HHH")
    ventana.refresh
    if rand(50)%9 == 0
     ventana.clear
    end
    sleep 0.2
  end

   ventana.clear
   ventana.refresh
   ventana.close

rescue => ex
  Curses.close_screen
end

