class Lecture < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Lectures'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Topics Audience]
  end

  def youtube_id
    regex = %r{(?:youtube(?:-nocookie)?\.com/(?:[^/\n\s]+/\S+/|(?:v|e(?:mbed)?)/|\S*?[?&]v=)|youtu\.be/)([a-zA-Z0-9_-]{11})}
    match = regex.match(self['Video URL'])
    match[1] if match && !match[1].blank?
  end

  def start_seconds
    self['Start Time']
  end

  def end_seconds
    self['End Time']
  end

  def duration_seconds
    end_seconds - start_seconds
  end

  def thumbnail_url
    "https://img.youtube.com/vi/#{youtube_id}/default.jpg" if youtube_id.present?
  end

  def embed_url
    "https://www.youtube.com/embed/#{youtube_id}?version=3&autoplay=1&start=#{start_seconds}&end=#{end_seconds}" if youtube_id.present?
  end

end
