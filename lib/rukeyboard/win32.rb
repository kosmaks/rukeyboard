require 'ffi'

module User32
  extend FFI::Library
  ffi_lib 'user32.dll'
  ffi_convention :stdcall

  KEYEVENTF_KEYUP = 0x0002

  attach_function :keybd_event, [:short, :short, :uint, :pointer], :void
  attach_function :VkKeyScanA, [:char], :short
end

class RuKeyboard
  def press_key key
    code = User32::VkKeyScanA key[0].ord
    User32::keybd_event code, 0, 0, nil
  end

  def release_key key
    code = User32::VkKeyScanA key[0].ord
    User32::keybd_event code, 0, User32::KEYEVENTF_KEYUP, nil
  end
end
