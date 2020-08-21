class ContactController < ApplicationController
  skip_before_action :authorize

  def show
    render template: "contact/#{params[:contact]}"
  end
end
