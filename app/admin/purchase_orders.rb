ActiveAdmin.register PurchaseOrder do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :po_number, :billing_address, :gst_no, :payment_terms, :site_address, :contact_person, :contact_person_phone, :gst_per, :total_amount, :status, :comment, :vender_detail, :group, :contact_person_designation, :contact_person_email, :project, :user_id, :project_id, :department_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:po_number, :billing_address, :gst_no, :payment_terms, :site_address, :contact_person, :contact_person_phone, :gst_per, :total_amount, :status, :comment, :vender_detail, :group, :contact_person_designation, :contact_person_email, :project, :user_id, :project_id, :department_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :po_number
  filter :created_at
  filter :project

  index do
    selectable_column 
    column :po_number
    actions
  end
end
