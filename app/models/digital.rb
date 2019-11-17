class Digital < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Digital'

  def self.approved
    all(filter: '{Approved}')
  end

end
