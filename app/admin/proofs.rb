ActiveAdmin.register Proof do
  filter :user
  filter :state, :as => :select, :collection => [["Sent to Client", "sent_to_client"], ["Client Responded", "client_responded"]]
  filter :in_home_date
  filter :start_date
  index do
    column :user
    column :in_home_date
    column :print_date
    column :state
    column "image" do |proof|
      link_to "#{image_tag proof.pdf.url(:thumb)}".html_safe, proof.pdf.url(:original) if proof.pdf
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "", :multipart => true do
      f.input :user, :as => :select, :collection => User.all
      f.input :in_home_date
      f.input :print_date
      f.input :urgent_message
      f.input :pdf, :as => :file
    end
    f.buttons
  end
end
