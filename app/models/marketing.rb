class Marketing < Airrecord::Table

  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Marketing'

  def self.approved
    all(filter: '{Approved}')
  end

end
