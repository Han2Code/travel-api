class TravelController < ApplicationController
  def index
  end

  def search

    url = URI("https://restcountries-v1.p.rapidapi.com/name/#{params[:country]}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV.fetch('RAPIDAPI_API_KEY')
    request["x-rapidapi-host"] = 'restcountries-v1.p.rapidapi.com'

    response = http.request(request)

    country = JSON.parse(response.body)

    @country = country.first

    @weather = find_weather(@country['capital'], @country['alpha2Code'])


  end


  def find_weather(city, country_code)

    url = URI("https://community-open-weather-map.p.rapidapi.com/weather?q=#{city}%2C#{country_code}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV.fetch('RAPIDAPI_API_KEY')
    request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'

    response = http.request(request)

    return JSON.parse(response.body)

    puts response.read_body
       
  end


end


