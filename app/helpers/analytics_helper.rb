module AnalyticsHelper
  def analytics?
    ENV["SEGMENT_KEY"].present?
  end

  def identify_hash(user = current_user)
    {
      created: user.created_at,
      email: user.email_address,
      username: user.github_username,
      user_id: user.id,
      active_repo_ids: user.active_repos.pluck(:id),
    }
  end

  def intercom_hash(user = current_user)
    {
      "Intercom" => {
        userHash: OpenSSL::HMAC.hexdigest(
          "sha256",
          ENV["INTERCOM_API_SECRET"],
          user.id.to_s
        )
      }
    }
  end

  def campaign_hash
    {
      context: {
        campaign: session[:campaign_params]
      }
    }
  end
end
