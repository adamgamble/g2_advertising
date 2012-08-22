ActiveAdmin.register AdminUser do
  filter :email
  filter :username
  index do
    column :email
    column :last_sign_in_at
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
