module ApplicationHelper

  COLORS = %i[red orange yellow olive green teal blue violet purple pink brown].freeze
  SUBMISSION_URLS = {
    documents: nil,
    guides: nil,
    images: nil,
    lectures: 'https://airtable.com/embed/shryw0V7ZaCEzQf7a',
    marketing: 'https://airtable.com/embed/shrMButMgMmKxHYgw',
    materials: 'https://airtable.com/embed/shrXsEa3X2DQZZMqg',
  }.freeze

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

  def filter_tag title, options
    return if options.empty?

    content_tag :div, class: 'ui dropdown item' do
      concat tag.div "#{title}:", class: 'title'
      concat tag.div 'All', class: 'default text'
      concat tag.i nil, class: 'dropdown icon'
      concat content_tag :div, filter_tag_options(title.parameterize.dasherize, options), class: 'menu'
    end
  end

  def filter_tag_options key, options
    capture do
      concat tag.a 'All', class: 'item', data: { filter: ".#{key}--*" }

      options.each do |option|
        concat tag.a option, class: 'item', data: { filter: ".#{key}--#{option.parameterize.dasherize}" }
      end
    end
  end

  def item_classes item, singular_filters = [], plural_filters = []
    classes = ['js-item']
    
    singular_filters.each do |filter|
      next unless item[filter].present?

      key = filter.parameterize.dasherize
      classes << "#{key}--#{item[filter].parameterize.dasherize}"
    end
    
    plural_filters.each do |filter|
      next unless item[filter].present?

      key = filter.parameterize.dasherize
      item[filter].each do |value|
        classes << "#{key}--#{value}"
      end
    end

    classes
  end

end
