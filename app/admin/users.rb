ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :department_id, :phone_number, :designation, approver_users_attributes: [:id,:approver_id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :first_name, :last_name, :phone_number, :reset_password_token, :reset_password_sent_at, :remember_created_at, :provider, :uid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :email
  filter :created_at
  filter :department
  index do
    selectable_column 
    column :first_name
    column :last_name
    column :email
    column :department
    column :phone_number
    actions
  end

  form do |f|
    f.inputs "Member Details" do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :department
        f.input :designation
        f.input :phone_number
        if f.object.new_record?
          f.input :password
          f.input :password_confirmation
        end
        f.inputs 'Approvers' do
          f.has_many :approver_users, allow_destroy: true, new_record: true do |a|
            a.input :approver_id, as: :select, collection: User.all.map { |u| [u.email, u.id] }
          end
        end
    end
      f.button :Submit
  end
end
