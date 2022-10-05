class Image < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Images'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Type]
  end

end
