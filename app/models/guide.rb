class Guide < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Guides'

  def self.public
    all(view: "Published")
  end

end
