class NewsController < ApplicationController
  skip_before_action :authorize

  def show
    render template: "news/#{params[:news]}"
  end
end
