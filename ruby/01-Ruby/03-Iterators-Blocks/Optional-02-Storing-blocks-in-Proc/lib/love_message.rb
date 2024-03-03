def tell(who, &message_blk)
  # TODO: return message addressed to who
  "#{who}, #{message_blk.call}!"
end

def tell_mum(&message_blk)
  # TODO: return message addressed to your mum
  # => Should call #tell of course
  tell("mum", &message_blk)
end

# Example:
# tell_mum {"I love you"}

def tell_with_proc(who, message_blk)
  # TODO: return message addressed to who
  # => Message is passed as Proc, not as block
  "#{who}, #{message_blk.call}!"
end

def tell_mum_with_proc(message_blk)
  # TODO: return message addressed to your mum
  # => Should call #tell_with_proc of course
  tell_with_proc("mum", message_blk)
end

# Example:
# love_block = proc { "I love you" }
# tell_mum_with_proc(love_block)
