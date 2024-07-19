class SearchController < ApplicationController
  def index
    @searched_members = params[:nation]
    conn = Faraday.new( url: 'https://last-airbender-api.fly.dev' )
    response = conn.get('/api/v1/characters?affiliation=Fire+Nation')
    data = JSON.parse(response.body, symbolize_names: true)

    #binding.pry
    members_list = data[:_id].first(25)
    @members = members_list
  end
end