class StaticController < ApplicationController
  before_filter :authenticate_user!, only: [:asks]
  
  def asks
    @asks = current_user.asks
  end

  def home
  end

  def about
  end

  def help
  end

  def contact
  end

  def help
  end

  def stories
  end

  def terms
  end
end
