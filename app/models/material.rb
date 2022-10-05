class Material < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Materials'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Format Purpose Audience]
  end

end
