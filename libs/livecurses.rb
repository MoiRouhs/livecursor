#!/usr/bin/ruby
require 'curses'
include Curses

class Ventana < Window

# Define la forma de usar los colores
  def pintar arg = 'nil'
    abreviacion = { 
      'nn' => 0, 'rn' => 1, 'vn' => 2, 'an' => 3, 'zn' => 4, 'mn' => 5, 'cn' => 6, 'bn' => 7,
      'nr' => 8, 'rr' => 9, 'vr' => 10, 'ar' => 11, 'zr' => 12, 'mr' => 13, 'cr' => 14, 'br' => 15,
      'nv' => 16, 'rv' => 17, 'vv' => 18, 'av' => 19, 'zv' => 20, 'mv' => 21, 'cv' => 22, 'bv' => 23,
      'na' => 24, 'ra' => 25, 'va' => 26, 'aa' => 27, 'za' => 28, 'ma' => 29, 'ca' => 30, 'ba' => 31,
      'nz' => 32, 'rz' => 33, 'vz' => 34, 'az' => 35, 'zz' => 36, 'mz' => 37, 'cz' => 38, 'bz' => 39,
      'nm' => 40, 'rm' => 41, 'vm' => 42, 'am' => 43, 'zm' => 44, 'mm' => 45, 'cm' => 46, 'bm' => 47,
      'nc' => 48, 'rc' => 49, 'vc' => 50, 'ac' => 51, 'zc' => 52, 'mc' => 53, 'cc' => 54, 'bc' => 55,
      'nb' => 56, 'rb' => 57, 'vb' => 58, 'ab' => 59, 'zb' => 60, 'mb' => 61, 'cb' => 62, 'bb' => 63
    }
    cordenadas = { 
      0.0 => 0,  1.0 => 1,  2.0 => 2,  3.0 => 3,  4.0 => 4,  5.0 => 5,  6.0 => 6,  7.0 => 7,
      0.1 => 8,  1.1 => 9,  2.1 => 10, 3.1 => 11, 4.1 => 12, 5.1 => 13, 6.1 => 14, 7.1 => 15,
      0.2 => 16, 1.2 => 17, 2.2 => 18, 3.2 => 19, 4.2 => 20, 5.2 => 21, 6.2 => 22, 7.2 => 23,
      0.3 => 24, 1.3 => 25, 2.3 => 26, 3.3 => 27, 4.3 => 28, 5.3 => 29, 6.3 => 30, 7.3 => 31,
      0.4 => 32, 1.4 => 33, 2.4 => 34, 3.4 => 35, 4.4 => 36, 5.4 => 37, 6.4 => 38, 7.4 => 39,
      0.5 => 40, 1.5 => 41, 2.5 => 42, 3.5 => 43, 4.5 => 44, 5.5 => 45, 6.5 => 46, 7.5 => 47,
      0.6 => 48, 1.6 => 49, 2.6 => 50, 3.6 => 51, 4.6 => 52, 5.6 => 53, 6.6 => 54, 7.6 => 55,
      0.7 => 56, 1.7 => 57, 2.7 => 58, 3.7 => 59, 4.7 => 60, 5.7 => 61, 6.7 => 62, 7.7 => 63
    }

    if arg.kind_of? String and abreviacion.key?(arg)
      arg = abreviacion[arg]
    elsif arg.kind_of? Float and cordenadas.key?(arg)
      fr = arg.round(1)
      arg = cordenadas[fr]
    elsif arg.kind_of? Integer and arg >= 0 and arg <= 63
      arg = arg
    else
      arg = 0
    end
    self.attrset(color_pair(arg))
  end
  alias :ptr :pintar

# Define la posición de la ventana  
  def mover sy = 'nil', sx = 'nil', y: self.begy, x:self.begx
    if sy != 'nil' and sx != 'nil' and sy.kind_of? Integer and sx.kind_of? Integer
      self.move(sy,sx) 
    elsif y.kind_of? Integer and x.kind_of? Integer
      self.move(y,x)
    else
      self.move(self.begy,self.begx)
    end
  end
  alias :mvr :mover

# Define el tamaño de la ventana  
  def redimensionar sy='nil', sx='nil', y:'nil', x:'nil'
    if sy != 'nil' and sx != 'nil' and sy.kind_of? Integer and sx.kind_of? Integer
      self.resize(sy,sx)
    elsif y !='nil' or x !='nil' 
      if y.kind_of? Integer and x.kind_of? Integer
        self.resize(y,x)
      end
    else
      self.resize(Curses.lines,Curses.cols)
    end
  end
  alias :rdr :redimensionar

# Define la posición y el tamaño de la ventana  
  def colocar *a, c:'nil', v:'nil', h:'nil', m:'nil'
    
    if a.length() >= 1
      case a.length
        when 0
          self.mvr y:a[0],x:a[0]
          self.rdr y:a[0], x:a[0] 
        when 1
          self.mvr y:a[0],x:a[0]
          self.rdr y:a[1], x:a[1]
        when 2
          self.mvr y:a[0],x:a[1]
          self.rdr y:a[2], x:a[2]
        when 3
          self.mvr y:a[0],x:a[1]
          self.rdr y:a[2], x:a[3]
      end  
    elsif (0..3).include?(c) 
      case c
        when 0
          self.mvr y:0,x:0
          self.rdr y:lines / 2, x:cols / 2
        when 1
          self.mvr y:0, x:cols / 2
          self.rdr y:lines / 2, x:cols / 2
        when 2
          self.mvr y:lines / 2, x:cols / 2
          self.rdr y:lines / 2, x:cols / 2
        when 3
          self.mvr y:lines / 2, x:0
          self.rdr y:lines / 2, x:cols / 2       
      end  
    elsif (0..3).include?(v) 
      case v
        when 0
          self.mvr y:0,x:0
          self.rdr y:lines, x:cols / 4
        when 1
          self.mvr y:0, x:cols / 4
          self.rdr y:lines, x:cols / 4
        when 2
          self.mvr y:0, x:cols / 2
          self.rdr y:lines, x:cols / 4
        when 3
          self.mvr y:0, x:3*cols / 4
          self.rdr y:lines, x:cols / 4
      end  
    elsif (0..3).include?(h) 
      case h
        when 0
          self.mvr y:0,x:0
          self.rdr y:lines / 4, x:cols
        when 1
          self.mvr y:lines / 4, x:0
          self.rdr y:lines / 4, x:cols
        when 2
          self.mvr y:lines / 2, x:0
          self.rdr y:lines / 4, x:cols
        when 3
          self.mvr y:3*lines / 4, x:0
          self.rdr y:lines / 4, x:cols
      end  
    elsif (0..3).include?(m) 
      case m
        when 0
          self.mvr y:0,x:0
          self.rdr y:lines / 2, x:cols
        when 1
          self.mvr y:0, x:0
          self.rdr y:lines, x:cols / 2
        when 2
          self.mvr y:lines / 2, x:0
          self.rdr y:lines / 2, x:cols
        when 3
          self.mvr y:0, x: cols / 2
          self.rdr y:lines, x:cols / 2
      end
    end

  end
  alias :clr :colocar
  
# Define los bordes de la ventana  
  def bordes *a, y:"nil", x:"nil"
    if y != "nil" and x != "nil" 
      y = y.to_s
      x = x.to_s
    elsif  a.length() >= 1
      if a.length() == 1
        y = a[0].to_s
        x = a[0].to_s
      elsif a.length() == 2
        y = a[0].to_s
        x = a[1].to_s
      end
    end
    
    self.box(x, y)
  end
  alias :bds :bordes

# Define la posición del cursor
  def cursor_posicion *a, y:'nil', x:'nil'
    if y != "nil" or  x != "nil" 
      y = y.to_i
      x = x.to_i
    elsif  a.length() >= 1
      if a.length() == 1
        y = a[0].to_i
        x = a[0].to_i
      elsif a.length() == 2
        y = a[0].to_i
        x = a[1].to_i
      end
    end

    self.setpos(y, x)
  end
  alias :cps :cursor_posicion

# Asigna un caracter 
  def texto arg="·"
    self.addstr(arg.to_s)
  end
  alias :txt :texto


  def punto *a, y:'nil', x:'nil', cps:[], ptr:'nil', txt:'nil' 
    if a.length() >= 1
      if a.length() == 1
        self.cps(a[0])
        self.ptr()
        self.txt(' ')
      elsif a.length() == 2
        self.cps(a[0],a[1])
        self.ptr()
        self.txt(' ')
      elsif a.length() == 3
        self.cps(a[0],a[1])
        self.ptr(a[2])
        self.txt(' ')
      elsif a.length() == 4
        self.cps(a[0],a[1])
        self.ptr(a[2])
        self.txt(a[3])
      end
    else
      if y != 'nil' and x == 'nil'
        self.cps(y)
      elsif y != 'nil' and x != 'nil'
        self.cps(y,x)
      elsif cps.length() == 1 
        self.cps(cps[0])
      elsif cps.length() == 2 
        self.cps(cps[0], cps[1])
      else
        self.cps()
      end
      if ptr != 'nil'
        self.ptr(ptr)
      else
        self.ptr()
      end
      if txt != 'nil'
        self.txt(txt)
      else
        self.txt(' ')
      end
    end
    
  end
  alias :pt :punto

# Define fondo de la ventana  
  def fondo *a, ptr:'nil', txt:'nil' 
    if a.length() >= 1
      case a.length()
      when 1
        color = a[0]
        caracter = ' '
      when 2
        color = a[0]
        caracter = a[1]
      end
    elsif ptr != 'nil' or txt != 'nil'
      if ptr != 'nil' or txt != 'nil'
        color = ptr
        caracter = txt
      elsif ptr != 'nil' or txt == 'nil'
        color = ptr
        caracter = ' '
      elsif ptr == 'nil' or txt != 'nil'
        color ='nil'
        caracter = txt
      end
    else
    end
    (0..self.maxy).each do |y|
      (0..self.maxx).each do |x|
        self.pt y, x, color, caracter
      end
    end
  end
  alias :fn :fondo

# bytebeat para generar cosas abstractas
  def bytebeat *a, d:'nil', r:64, i:1, txt:'nil', ec:'nil' 
    ec2 = 'nil' 
    txt2 = 'nill'
    d1 = self.maxx
    d2 = self.maxy

    if d != 'nil'
      case d 
        when 'horizontal', 'h'
          d1 = self.maxy
          d2 = self.maxx
        when 'vertical', 'v'
          d1 = self.maxx
          d2 = self.maxy
        end
    end

    if a.length() >= 1
      if a.length() == 1
        ec = a[0] 
      elsif a.length() == 2
        ec = a[0] 
        txt = a[1] 
      end
    end

    c = 0 
 
    (0...d1).each do |x|
      (0...d2).each do |y|
        if ec != 'nil'
            cc = eval(ec)
          #begin
          #  cc = eval(ec)
          #  ec2 = ec
          #rescue
          #  cc = eval(ec2)
          #end
        else
          cc = c
        end

        if txt == 'nil'
          etxt = ' '
        elsif txt.length == 1
          etxt = txt
        else
          etxt = (1 + (eval(txt)).abs).chr(Encoding::UTF_8)
          #begin
          #  etxt = (1 + (eval(txt)).abs).chr(Encoding::UTF_8)
          #  txt2 = txt
          #rescue
          #  etxt = (1 + (eval(txt2)).abs).chr(Encoding::UTF_8)
          #end
        end

        if d == 'horizontal' or d == 'h'
          self.pt x, y,  cc, etxt
        else
          self.pt y, x,  cc, etxt 
        end

        if c < r
          c += i
        else
          c = 0
        end
      end
    end
  end
  alias :bb :bytebeat
  
# asciiart para generar cosas no abstractas
  def asciiart *a, cps:[], n:'nil', t:'nil', c:'nil', txt:'nil' 
    if a.length() >= 3
      if a.length() == 3
        y = a[0].to_i
        x = a[0].to_i
        n = a[1]
        t = $contenido[n]['t']
        c = $contenido[n]['c']
        txt = a[2]
      elsif a.length() == 4
        y = a[0].to_i
        x = a[1].to_i
        n = a[2]
        t = $contenido[n]['t']
        c = $contenido[n]['c']
        txt = a[3]
      end
    else
      case cps.length
        when 1
          y = cps[0]
          x = cps[0]
        when 2
          y = cps[0]
          x = cps[1]
      end
      if t == 'nil'
        t = $contenido[n]['t']
      end
      if c == 'nil'
        c = $contenido[n]['c']
      end
    end

    case t 
    when 'fuente', 'f'
      maxd = 0
      txt.split('').each do |w|
        l = $contenido[n]['e'][w].length 
        l.times do |i|
          d = $contenido[n]['e'][w][i]
          self.pt y + i, x, c, d
          maxd = maxd.to_i < d.length ? d.length : maxd
        end
          x = x + maxd
          maxd = 0
      end
    when 'dibujo', 'd'
      case txt
      when String
        l = $contenido[n]['e'][txt].length 
        l.times do |i|
          self.pt y + i, x, c, $contenido[n]['e'][txt][i]
        end
      when Array
        l = $contenido[n]['e'][txt[$t%txt.length]].length 
        l.times do |i|
          self.pt y + i, x, c, $contenido[n]['e'][txt[$t%txt.length]][i]
        end
      end
    end
  end
  alias :aa :asciiart
end
