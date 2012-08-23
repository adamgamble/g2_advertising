ActiveAdmin.register Proof do
  filter :user
  index do
    column :user
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :user, :as => :select, :collection => User.all
    end
    f.buttons
  end
end
