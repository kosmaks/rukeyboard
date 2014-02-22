require 'rbconfig'

class RuKeyboard
  def press_key key
    raise NotImplementedError
  end

  def release_key key
    raise NotImplementedError
  end
  
  def tap_key key, n = 1
    n.times do 
      press_key key
      release_key key
    end
  end

  def type_string str, interval=0
    str.chars.each do |ch|
      sleep interval
      tap_key ch
    end
  end
end

os = RbConfig::CONFIG['host_os']

case os
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  require 'rukeyboard/win32.rb'
when /darwin|mac os/
  require 'rukeyboard/darwin.rb'
when /linux|bsd/
  require 'rukeyboard/x11.rb'
end
