require "openssl/hmac"
require "base64"

module Steam
  class Totp
    CHARS = "23456789BCDFGHJKMNPQRTVWXY"
    def initialize(secret : String)
      @secret = Base64.decode_string(secret)
    end
    
    def generateAuthCode(time : Int = Time.now.epoch)
      IO::ByteFormat::LittleEndian.encode(time / 30, bytes = Bytes.new(8))
      hmac = OpenSSL::HMAC.digest(:sha1, @secret, bytes.reverse!)
      offset = (hmac[-1] & 0xf)
      fullcode = (hmac[offset].to_i & 0x7f) << 24 |
                 (hmac[offset + 1].to_i & 0xff) << 16 |
                 (hmac[offset + 2].to_i & 0xff) << 8 |
                 (hmac[offset + 3].to_i & 0xff)
      code = ""

      5.times do
        code += CHARS[fullcode % CHARS.size]
        fullcode /= CHARS.size
      end

      return code
    end
  end
end