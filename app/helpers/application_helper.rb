module ApplicationHelper

  COLORS = %i[red orange yellow olive green teal blue violet purple pink brown]
  SUBMISSION_URLS = {
    document: nil,
    guide: nil,
    image: nil,
    lecture: 'https://airtable.com/embed/shryw0V7ZaCEzQf7a',
    marketing: 'https://airtable.com/embed/shrMButMgMmKxHYgw',
    material: 'https://airtable.com/embed/shrXsEa3X2DQZZMqg',
  }

  def color_by_index key, order
    COLORS[order.index(key)]
  end

  def download_path file
    file.slice!('https://dl.airtable.com/.attachments/')
    download_file_path(file: file)
  end

  def submission_form_url type
    SUBMISSION_URLS[type.to_sym]
  end

end
