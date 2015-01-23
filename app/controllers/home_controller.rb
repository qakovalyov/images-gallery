class HomeController < ApplicationController

  def index
    if params[:search]
      search_string = params[:search].downcase
      hashtags = search_string.scan(/#\w+/)
      unless hashtags.empty?
        search_string = hashtags.join(' ').gsub('#', '')
        @pictures = Picture.search_by_hashtags(search_string).order('hashtags ASC')
      else
        @pictures = Picture.search_by_name(search_string).order('name ASC')
      end
    else
      @pictures = Picture.all.order('id ASC')
    end
  end
end