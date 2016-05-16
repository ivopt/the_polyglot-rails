class EntriesController < ApplicationController

  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render nothing: true, status: 404
  end

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

end
