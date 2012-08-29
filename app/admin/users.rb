ActiveAdmin.register User do
  filter :email
  filter :username
  index do
    column :email
    column :last_sign_in_at
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "", :multipart => true do
      f.input :email
      f.input :name
      f.input :logo, :as => :file
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
