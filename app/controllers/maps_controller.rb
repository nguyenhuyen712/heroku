class MapsController < ApplicationController
  def index
    @accident = Accident.waiting_or_processing
    @hash = Gmaps4rails.build_markers(@accident) do |accident, marker|
      marker.lat accident.lati
      marker.lng accident.longti
      marker.picture({
        :url => view_context.image_path("logo.png"),
        :width   => 32,
        :height  => 32
        })
      marker.infowindow render_to_string(:partial => "accidents/infowindow",
        :locals => { :accident => accident})
    end
  end
end
