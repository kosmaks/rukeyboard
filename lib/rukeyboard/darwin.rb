require 'ffi'

module CGEvent
  extend FFI::Library
  ffi_lib "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/CoreGraphics.framework/Versions/A/CoreGraphics"

  enum :CGEventTapLocation, [:kCGHIDEventTap, 0,
                             :kCGSessionEventTap,
                             :kCGAnnotatedSessionEventTap ]                    

  CHARS = {
    'a' =>  0x00, 's' =>  0x01, 'd' =>  0x02, 'f' =>  0x03, 'h' =>  0x04,
    'g' =>  0x05, 'z' =>  0x06, 'x' =>  0x07, 'c' =>  0x08, 'v' =>  0x09,
    'b' =>  0x0b, 'q' =>  0x0c, 'w' =>  0x0d, 'e' =>  0x0e, 'r' =>  0x0f,
    'y' =>  0x10, 't' =>  0x11, '1' =>  0x12, '2' =>  0x13, '3' =>  0x14,
    '4' =>  0x15, '6' =>  0x16, '5' =>  0x17, '=' =>  0x18, '9' =>  0x19,
    '7' =>  0x1a, '-' =>  0x1b, '8' =>  0x1c, '0' =>  0x1d, ']' =>  0x1e,
    'o' =>  0x1f, 'u' =>  0x20, '[' =>  0x21, 'i' =>  0x22, 'p' =>  0x23,
    'l' =>  0x25, 'j' =>  0x26, '\'' =>  0x27, 'k' =>  0x28, ';' =>  0x29,
    '\\' =>  0x2a, ',' =>  0x2b, '/' =>  0x2c, 'n' =>  0x2d, 'm' =>  0x2e,
    '.' =>  0x2f, '`' =>  0x32, ' ' =>  0x31, '\r' =>  0x24, '\t' =>  0x30,
    'shift' =>  0x38
  }

  attach_function :CGEventCreateKeyboardEvent, 
                  [:pointer, :char, :bool], 
                  :pointer

  attach_function :CGEventPost, 
                  [:CGEventTapLocation, :pointer], 
                  :void

  attach_function :CFRelease, 
                  [:pointer], 
                  :void
end

class RuKeyboard
  def press_key key
    event key, true
  end

  def release_key key
    event key, false
  end

  private

  def event key, press
    code = CGEvent::CHARS[key.downcase]
    return if code.nil?
    event = CGEvent::CGEventCreateKeyboardEvent nil, code, press
    CGEvent::CGEventPost :kCGHIDEventTap, event
    CGEvent::CFRelease event
  end
end
