# frozen_string_literal: true

class ExportProfileDataService
  def initialize(user)
    @user = user
  end

  def call
    path = generate_csv_file
    export_to_storage(path)
    sleep(3.seconds)
  end

  def generate_csv_file
    csv_data = @user.profile.to_csv
    path = Rails.root.join('tmp', 'user', @user.id.to_s, 'profiles', "profile_export_#{Time.now.strftime('%Y%m%d_%H%M%S')}.csv")

    FileUtils.mkdir_p(File.dirname(path))
    File.open(path, 'w') { |file| file.write(csv_data) }

    path
  end

  def export_to_storage(path)
    file = File.open(path)

    attachment = @user.profile.csv_export.attach(io: file, filename: File.basename(path), content_type: 'text/csv')
    file.close

    attachment
  end
end
