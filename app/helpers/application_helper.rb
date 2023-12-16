module ApplicationHelper

  COLORS = %i[red green blue purple orange pink yellow teal violet brown olive].freeze

  PRIORITY_TOPICS = [
    "Left Side",
    "Right Side",
    "Mooladhara",
    "Swadhistan",
    "Nabhi",
    "Void",
    "Anahat",
    "Vishuddhi",
    "Agnya",
    "Sahasrara",
  ].freeze

  SUBMISSION_URLS = {
    digital: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shrrFcZEaxJCjoWzP',
    documents: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shrbjcZF4xOyDg3Rq',
    guides: '',
    images: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shr6gMLDcKXvS02vA',
    lectures: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shryw0V7ZaCEzQf7a',
    marketing: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shrMButMgMmKxHYgw',
    materials: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shrXsEa3X2DQZZMqg',
    contact: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shr15CoKu6d56V10b',
    events: 'https://airtable.com/embed/appGIvouVhGQJi2PS/shrpZkm9vcW0S4Bk2',
  }.freeze

  def color_by_index key, order
    COLORS[order.index(key)]
  end

  def download_path attachment
    file = attachment['url']
    file.slice!('https://v5.airtableusercontent.com/')
    format = attachment['type'].split('/').last
    download_file_path(format: format, file: file, name: attachment['filename'], type: attachment['type'])
  end

  def submission_form_url type
    SUBMISSION_URLS[type.to_sym]
  end

  def filter_tag title, options
    return if options.length < 2

    content_tag :div, class: 'ui scrolling dropdown item' do
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
        classes << "#{key}--#{value.parameterize.dasherize}"
      end
    end

    classes
  end

  def reorder_topics topics
    other_topics = topics - PRIORITY_TOPICS
    (PRIORITY_TOPICS & topics) + other_topics
  end

  def valid_url?(uri)
    uri = URI.parse(uri) && uri.host.present?
  rescue URI::InvalidURIError
    false
  end

end
