ActiveAdmin.register Proof do
  filter :user
  index do
    column :user
    column :created_at
    column "image" do |proof|
      image_tag proof.proof_pdf.encode(:png).url
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "", :multipart => true do
      f.input :user, :as => :select, :collection => User.all
      f.input :proof_pdf, :as => :file
    end
    f.buttons
  end
end
