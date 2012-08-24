ActiveAdmin.register Proof do
  filter :user
  index do
    column :user
    column :created_at
    column "image" do |proof|
      link_to "#{image_tag proof.pdf.url(:thumb)}".html_safe, proof.pdf.url(:original) if proof.pdf
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "", :multipart => true do
      f.input :user, :as => :select, :collection => User.all
      f.input :pdf, :as => :file
    end
    f.buttons
  end
end
