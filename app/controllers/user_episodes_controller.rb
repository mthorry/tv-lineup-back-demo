class UserEpisodesController < ApplicationController

  def rate_episode
    user = User.find(1)
    user_episode = user.user_episodes.find_by(episode_id: params[:episode_id])
    user_episode.rating = params[:prating].to_i
    user_episode.save
    render json: user.user_episodes
  end

  def destroy
    user_episode = UserEpisode.find_by(user_id: 1, episode_id: params[:episode_id])
    user_episode.destroy
    episodes = User.find(1).episodes

    render json: episodes
  end

end