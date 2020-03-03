class Theme < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Themes'

  has_many :materials, class: "Material", column: "Materials"
  has_many :marketing, class: "Marketing", column: "Marketing"

  def self.public
    all(view: "Published")
  end

end
