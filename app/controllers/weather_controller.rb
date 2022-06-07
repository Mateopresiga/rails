class WeatherController < ApplicationController

    require 'net/http'
    require 'uri'
    require 'json'

    def index
        search = Weather.find_by_city("Medellín")
        uri = URI('https://api.openweathermap.org/data/2.5/weather?')
        params = { :lat => search.latitude, :lon => search.longitude, :units => 'Metric', :appid => '8a1bf7097809446d5438883996f44554'}
        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)

        @data = JSON.parse(res.body)

        puts @data
    end

    def weather_search
        city = params[:city]
        temperature = params[:temp]
        if temperature == 'Metric'
            @temp = '° C'
        else
            @temp = '° F'
        end
        search = Weather.find_by_city(city)
        uri = URI('https://api.openweathermap.org/data/2.5/weather?')
        params = { :lat => search.latitude, :lon => search.longitude, :units => temperature, :appid => '8a1bf7097809446d5438883996f44554'}
        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)

        @data = JSON.parse(res.body)

        puts @data
    end
end
