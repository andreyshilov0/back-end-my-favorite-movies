# frozen_string_literal: true

class SettingSelectMoviesController < ApplicationController
  def index
    @setting_select_movies = setting_select_movies.all
  end

  def new
    @setting_select_movies = setting_select_movies.new
  end
end
