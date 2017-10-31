class EpisodesController < ApplicationController
  def create
    user = User.find(1)

    if params[:episode][:image]
      image = params[:episode][:image][:original]
    elsif params[:image]
      image = params[:image][:original]
    else
      image = nil
    end

    if params[:show_id]
       show = Show.find(params[:show_id])
      episode = Episode.find_or_create_by(
        id: params[:episode][:id],
        show_title: show.title,
        title: params[:episode][:name],
        season: params[:episode][:season],
        number: params[:episode][:number],
        airdate: params[:episode][:airdate],
        airtime: params[:episode][:airtime],
        airstamp: params[:episode][:airstamp],
        runtime: params[:episode][:runtime],
        img: image,
        url: params[:episode][:url],
        summary: params[:episode][:summary],
        show_id: show.id
      )
      episode.users << user
    else
    end

    render json: user.episodes
  end

  def index
    user = User.find(1)
    episodes = user.episodes
    render json: episodes
  end

  def destroy
    episode = Episode.find(params[:id])
    user = User.find(1)
    episode.destroy
    render json: user.episodes
  end
end

