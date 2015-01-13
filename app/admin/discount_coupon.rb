ActiveAdmin.register DiscountCoupon do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :token, :test_master_id, :cost, :used, :start_date, :end_date, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

    form do |f|
      f.inputs "Details" do
        f.input :test_master_id,:as => :select, :collection => TestMaster.all.map{|t| ["#{t.name}",t.id]}
        f.input :cost
        f.input :used, :as=>:boolean
        f.input :start_date
        f.input :end_date
        f.input :active, :as=>:boolean
      end
      f.actions
    end

  filter :users_tests
  filter :test_master, :as => :select, :collection => TestMaster.all.map{|t| ["#{t.name}",t.id]}
  filter :token
  filter :cost
  filter :used
  filter :created_at
  filter :updated_at
  filter :start_date
  filter :end_date
  filter :active
end
