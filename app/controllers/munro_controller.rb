class MunroController < ApplicationController

  # before_action(:authenticate_user!)
  

  def shape_munro( mtn )
    fc = Forecast.where( { munro_id: mtn.id } )
    return {
      id: mtn.id,
      smcId: mtn.smcid,
      name: mtn.name,
      height: mtn.height,
      gridRef: {
        letters: mtn.gridref_letters,
        eastings: mtn.gridref_eastings,
        northings: mtn.gridref_northings
      },
      latLng: {
        lat: mtn.latlng_lat,
        lng: mtn.latlng_lng
      },
      region: mtn.region,
      meaning: mtn.meaning,
      weatherId: mtn.weatherid,
      forecast: {
        data: fc.first.data,
        updated: fc.first.updated_at
      }
    }
  end

  def index
    munros = Munro.all().map { | mtn | shape_munro(mtn) }

    render({json: munros.as_json()})
  end

  def show
    munro = shape_munro (Munro.find( params[:id] ).first)
    render :json => munro
  end

end
