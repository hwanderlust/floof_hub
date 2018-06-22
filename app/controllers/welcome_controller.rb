class WelcomeController < ApplicationController
  def home
    @shelters = Shelter.last(3)
    @pets = Pet.last(3)
  end
  def about
  end
  def contact
  end
  def matt
  end
end
