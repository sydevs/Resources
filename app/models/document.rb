class Document < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Documents'

  def self.public
    all(view: "Published")
  end

end
