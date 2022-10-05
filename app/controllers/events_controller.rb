
class EventsController < ApplicationResourcesController

  before_action -> { @model = Event }

  def submit
    @submit_url = 'https://airtable.com/shrpZkm9vcW0S4Bk2'
  end

end
