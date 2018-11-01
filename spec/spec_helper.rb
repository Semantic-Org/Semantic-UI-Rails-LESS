require 'dummy_app/init'

# Silence +STDOUT+ temporarily.
#
# &block:: Block of code to call while +STDOUT+ is disabled.
#
def spec_helper_silence_stdout( &block )
  spec_helper_silence_stream( $stdout, &block )
end

# Back-end to #spec_helper_silence_stdout; silences arbitrary streams.
#
# +stream+:: The output stream to silence, e.g. <tt>$stdout</tt>
# &block::   Block of code to call while output stream is disabled.
#
def spec_helper_silence_stream( stream, &block )
  begin
    old_stream = stream.dup
    stream.reopen( File::NULL )
    stream.sync = true

    yield

  ensure
    stream.reopen( old_stream )
    old_stream.close

  end
end
