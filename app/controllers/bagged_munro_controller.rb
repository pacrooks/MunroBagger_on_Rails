class BaggedMunroController < ApplicationController

  before_action(:authenticate_user!)

  def index
    bagged = current_user.bagged_munros.all()
    render({json: bagged.as_json()})
    # puts bagged
  end

end