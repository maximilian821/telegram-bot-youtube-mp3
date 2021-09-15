module AudioProcessor
  PATTERN = /http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?/

  # Check if provided link is youtube video link according to the pattern
  def yt_link?(link)
    PATTERN.match?(link)
  end
  
  # Delete incorrectly downloaded files
  def delete_broken
    Dir.entries('./tmp').each { |e| File.delete("./tmp/#{e}") if e.end_with?('.part') }
  end
  
  # Download mp3 file and check is everything OK
  def get_audio link
    stdout = `youtube-dl -x -o './tmp/%(title)s.%(ext)s' --max-filesize 50m --no-playlist --audio-format mp3 "#{link}"`
    if stdout.include?('Aborting.')
      delete_broken
      return false
    else
      return true
    end
  end

  # Get the name of the downloaded file
  def audio_file link
    stdout = `youtube-dl --get-title --no-playlist "#{link}"`
    stdout.slice!(0) if stdout[0] == '/'
    file_name = stdout.strip.gsub('/', '_').insert(0, '/') + '.mp3'
    return file_name
  end
end
