class Event < Airrecord::Table

  self.base_key = 'appMvrLJ4xguL5oE8' # Sahaj Events Base
  self.table_name = 'Events'

  def self.public
    all(view: "Published")
  end

  def self.filters
    %w[Type]
  end

  def contact_url
    self['Website or Email']
  end

  def contact_host
    return nil unless contact_url.present?

    URI.parse(contact_url)&.host
  end

  def dates
    return nil unless self['Start Date'].present?

    if self['End Date'].present?
      [self['Start Date'], self['End Date']].map{ |d| Date.parse(d).strftime('%d %B') }.join(' - ')
    else
      Date.parse(self['Start Date']).strftime('%B')
    end
  end

  def thumbnail_url
    return nil unless self['Images'].present?

    self['Images'][0]['thumbnails']['large']['url']
  end

  def banner_url
    return nil unless self['Images'].present?

    self['Images'][0]['thumbnails']['full']['url']
  end

  def image_urls
    return [] if !self['Images'].present? #|| self['Images'].length < 2

    self['Images'].map { |i| i['thumbnails']['large']['url'] }
  end

end
