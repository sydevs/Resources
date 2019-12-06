require 'net/http'
require 'uri'

class ApplicationController < ActionController::Base

  caches_action :download, :submit

  def index
    @resources = {
      materials: Material.approved.count,
      marketing: Marketing.approved.count,
      lectures: Lecture.approved.count,
      guides: Guide.approved.count,
      images: Image.all.count,
      documents: Document.all.count,
      digital: Digital.all.count,
    }
  end

  def documents
    @documents = Document.all
    @types = @documents.collect { |r| r['Type'] }.uniq
  end

  def guides
    @guides = Guide.approved
    @topics = @guides.collect { |r| r['Topics'] }.flatten.uniq
  end

  def images
    @images = Image.all
    @types = @images.collect { |r| r['Type'] }.uniq
  end

  def marketing
    @marketing = Marketing.approved
    @formats = @marketing.collect { |r| r['Format'] }.uniq
  end

  def materials
    @materials = Material.approved
    @formats = @materials.collect { |r| r['Format'] }.uniq
    @purposes = @materials.collect { |r| r['Purpose'] }.uniq
    @audiences = @materials.collect { |r| r['Audience'] }.uniq
  end

  def lectures
    @lectures = Lecture.approved
    @topics = @lectures.collect { |r| r['Topics'] }.flatten.uniq
    @audiences = @lectures.collect { |r| r['Audience'] }.uniq
  end

  def digital
    @digital = Digital.all
    @types = @digital.collect { |r| r['Type'] }.uniq
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
