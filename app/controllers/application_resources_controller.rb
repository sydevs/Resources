require 'net/http'
require 'uri'

class ApplicationResourcesController < ApplicationController

  def index
    @records = @model.public
    @filters = @model.filters.map do |filter|
      [filter, @records.collect { |r| r[filter] }.flatten.uniq]
    end.to_h
  end

  def show
    @record = @model.find(params[:id])
  end

end
