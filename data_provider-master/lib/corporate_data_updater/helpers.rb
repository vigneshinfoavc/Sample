require 'pinch'

class Hash
  def underscore_keys!
    keys.each do |key|
      self[(key.underscore rescue key) || key] = delete(key)
    end
    self
  end
end

class PinchResponse
  def stream
    piper, pipew = IO.pipe

    Thread.new do
      begin
        read_body do |chunk|
          begin
            pipew << chunk.sanitize
          rescue => e
          end
        end
      ensure
        pipew.close
      end
    end

    begin
      yield piper
    ensure
      piper.close
    end
  end
end

class String
  def sanitize
    encode('UTF-8',
      :invalid => :replace,
      :undef   => :replace,
      :replace => ''
    ).tr("\u0000-\u001f\u007f\u2028", "\n")
  end
end

