class Advert < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Marketing'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Format]
  end

end
