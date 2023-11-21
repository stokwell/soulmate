class ExportProfileDataWorker
  include Sidekiq::Worker

  sidekiq_options retry: 2

  def perform(user_id)
    user = User.find(user_id)
    ExportProfileDataService.new(user).call
    send_notification(user_id)
  rescue ActiveRecord::RecordNotFound
    # nope
  end

  def send_notification(user_id)
    ActionCable.server.broadcast("notifications_channel:#{user_id}", { message: 'Your task is completed!' })
  end
end
