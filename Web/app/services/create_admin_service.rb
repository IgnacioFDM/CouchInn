class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email, telephone: Rails.application.secrets.admin_telephone, name: Rails.application.secrets.admin_name, birthdate: Date.new(1970, 01, 01)) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.admin!
      end
  end
end
