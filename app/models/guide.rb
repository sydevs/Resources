class Guide < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Guides'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Topics]
  end

end
