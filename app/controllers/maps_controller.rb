class MapsController < ApplicationController
  def index
    @accident = Accident.waiting
    @hash = Gmaps4rails.build_markers(@accident) do |accident, marker|
      marker.lat accident.lati
      marker.lng accident.longti
      marker.infowindow accident.user.description
    end
  end
end
