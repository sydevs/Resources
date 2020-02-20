class Marketing < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Marketing'

  def self.public
    all(view: "Published")
  end

end
