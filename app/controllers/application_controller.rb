require 'net/http'
require 'uri'

class ApplicationController < ActionController::Base

  caches_action :download, :submit

  def home
    @resources = {
      materials: {
        description: "For giving public programs, exhibitions, and other presentations. \"How to meditate at home\" booklets, treatment handouts, materials for children, exhibitions, slideshows, chakra charts, etc.",
        count: Material.public.count,
      },
      adverts: {
        description: "For booking or promoting public programs. Posters, business cards, brochures, etc.",
        count: Advert.public.count,
      },
      lectures: {
        description: "Excerpts of Mother's talks that are suitable for public programs. Categorized by topic and for beginner/intermediate/advanced seekers.",
        count: Lecture.public.count,
      },
      events: {
        description: "Upcoming tours, seminars, expos, international pujas, etc - for yogis.",
        count: Event.public.count,
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
      projects: {
        description: "Links to high quality Sahaj websites and other digital resources.",
        count: Project.public.count,
      },
    }
  end

  def download
    path = params[:file]
    fmt = params[:format].split('?').first
    filename = "#{File.basename(path)}.#{fmt}"
    type = MIME::Types.type_for(filename).first.content_type
    data = Net::HTTP.get(URI.parse("https://dl.airtable.com/.attachments/#{path}.#{fmt}"))
    send_data data, filename: filename, type: type, disposition: 'inline'
  end

  def submit
    @submit_url = helpers.submission_form_url(params[:type])
  end

end
