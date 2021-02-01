#!/usr/bin/ruby

comando = `clear`
content2 = 'nil'

loop do 
  content = File.read("codigo.rbd")

  begin
    eval(content)
    content2 = content
  rescue
    eval(content2)
  end
    print "\a"
    sleep 1
    puts comando

end

