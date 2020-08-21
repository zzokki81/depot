class QuestionsController < ApplicationController
  skip_before_action :authorize

  def show
    render template: "questions/#{params[:question]}"
  end
end
