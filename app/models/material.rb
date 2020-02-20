class Material < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Materials'

  def self.public
    all(view: "Published")
  end

end
