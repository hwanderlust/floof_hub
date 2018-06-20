class PetsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end
end
