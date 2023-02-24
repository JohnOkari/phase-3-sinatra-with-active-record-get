class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(include: { reviews: { include: :user } })
  end

end
