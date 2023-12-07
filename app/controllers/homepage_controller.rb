class HomepageController < ApplicationController

  def index
    render({ :template => "homepage" })
  end

end
