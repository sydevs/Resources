class Theme < Airrecord::Table

  self.base_key = 'appGIvouVhGQJi2PS' # Sahaj Resources Base
  self.table_name = 'Themes'

  has_many :materials, class: "Material", column: "Materials"
  has_many :marketing, class: "Marketing", column: "Marketing"

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[]
  end

end
