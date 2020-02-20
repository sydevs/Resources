class Digital < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Digital'

  def self.public
    all(view: "Published")
  end

end
