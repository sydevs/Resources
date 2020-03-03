require 'net/http'
require 'uri'

class ApplicationController < ActionController::Base

  caches_action :download, :submit

  def index
    @resources = {
      materials: {
        description: "For giving public programs, exhibitions, and other presentations. \"How to meditate at home\" booklets, treatment handouts, materials for children, exhibitions, slideshows, chakra charts, etc.",
        count: Material.public.count,
      },
      marketing: {
        description: "For booking or promoting public programs. Posters, business cards, brochures, etc.",
        count: Marketing.public.count,
      },
      lectures: {
        description: "Excerpts of Mother's talks that are suitable for public programs. Categorized by topic and for beginner/intermediate/advanced seekers.",
        count: Lecture.public.count,
      },
      guides: {
        description: "Guides on topics related to spreading Sahaja Yoga, such as Facebook advertising, 12-week courses, using Meetup effectively, tour organization, etc.",
        count: Guide.public.count,
      },
      images: {
        description: "Photos of Shri Mataji, stock photos to use in new materials, logos, etc.",
        count: Image.public.count,
      },
      documents: {
        description: "Research on the impact of Sahaja Yoga.",
        count: Document.public.count,
      },
      digital: {
        description: "Links to high quality Sahaj websites and other digital resources.",
        count: Digital.public.count,
      },
    }
  end

  def documents
    @documents = Document.public
    @types = @documents.collect { |r| r['Type'] }.uniq
  end

  def guides
    @guides = Guide.public
    @topics = @guides.collect { |r| r['Topics'] }.flatten.uniq
  end

  def images
    @images = Image.public
    @types = @images.collect { |r| r['Type'] }.uniq
  end

  def marketing
    @marketing = Marketing.public
    @formats = @marketing.collect { |r| r['Format'] }.uniq
  end

  def materials
    @materials = Material.public
    @formats = @materials.collect { |r| r['Format'] }.uniq
    @purposes = @materials.collect { |r| r['Purpose'] }.uniq
    @audiences = @materials.collect { |r| r['Audience'] }.uniq
  end

  def lectures
    @lectures = Lecture.public
    @topics = @lectures.collect { |r| r['Topics'] }.flatten.uniq
    @audiences = @lectures.collect { |r| r['Audience'] }.uniq
  end

  def digital
    @digital = Digital.public
    @types = @digital.collect { |r| r['Type'] }.uniq
  end

  def themes
    @themes = Theme.public
  end

  def download
    path = params[:file]
    filename = "#{File.basename(path)}.#{params[:format]}"
    puts filename
    type = MIME::Types.type_for(filename).first.content_type
    data = Net::HTTP.get(URI.parse("https://dl.airtable.com/.attachments/#{path}.#{params[:format]}"))
    send_data data, filename: filename, type: type, disposition: 'inline'
  end

  def submit
    # Do nothing
  end

end
