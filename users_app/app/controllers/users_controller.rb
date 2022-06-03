# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: User.mapped_render
  end
end
