require "./steam/*"

# TODO: Write documentation for `Steam`
module Steam
  # TODO: Put your code here
  totp = Steam::Totp.new("CYwRTgCB5B8tnA8FS01jqtJnsts=")
  #totp = Steam::Totp.new("\t\x8C\x11N\x00\x81\xE4\x1F-\x9C\x0F\x05KMc\xAA\xD2g\xB2\xDB")
  #totp = Steam::Totp.new("aa2a")
  puts totp.generateAuthCode
end
