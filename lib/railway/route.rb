# frozen_string_literal: true

module Railway
  ##
  # @attr_reader routes [Array[Railway::Station]]
  class Route
    attr_reader :routes

    ##
    # @param start_station [Railway::Station]
    # @param end_station   [Railway::Station]
    # @return [Route]
    def initialize(start_station, end_station)
      raise ArgumentError if start_station.nil?
      raise ArgumentError if end_station.nil?

      @routes = [start_station, end_station]
    end
  end
end
