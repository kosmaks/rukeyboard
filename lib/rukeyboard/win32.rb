require 'ffi'

module User32
  extend FFI::Library
  ffi_lib 'user32.dll'
  ffi_convention :stdcall

end

class RuKeyboard
end
