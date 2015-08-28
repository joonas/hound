class AcceptOrgInvitationsJob < ApplicationJob
  queue_as :high

  def perform
    github = GithubApi.new(Hound::HOUND_GITHUB_TOKEN)
    github.accept_pending_invitations
  end
end
