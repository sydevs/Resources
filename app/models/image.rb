class Image < Airrecord::Table
  self.base_key = ENV['AIRTABLE_BASE']
  self.table_name = 'Images'

  def self.approved
    all(filter: '{Approved}')
  end
end
