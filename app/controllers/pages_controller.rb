class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :articles ]

  def home
  end
end
