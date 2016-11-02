class BaggedMunroController < ApplicationController

  before_action(:authenticate_user!)

  def index
    bagged = current_user.bagged_munros.all()
    render({json: bagged.as_json({except: [:user_id, :created_at, :updated_at]})})
  end

  def create
    munro = current_user.bagged_munros.create({ munro_id: params[:munro_id], bagged_on: params[:bagged_on] })
    render({json: munro.as_json({except: [:user_id, :created_at, :updated_at]})})
  end

  def update
    munro = current_user.bagged_munros.find(params[:id])
    if munro.update({bagged_on: params[:bagged_on]})
      render({json: munro.as_json({except: [:user_id, :created_at, :updated_at]})})
    else
      render({json: {status: :update_failed}})
    end
  end

  def destroy
    if current_user.bagged_munros.find(params[:id]).destroy
      render({json: {status: :success}})
    else
      render({json: {status: :delete_failed}})
    end
  end

end
