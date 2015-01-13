ActiveAdmin.register TestMaster do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :name,:test_start_time,:duration, test_master_tests_attributes:[:id,:test_id,:question_count,:_destroy] 
  # permit_params :test_ids
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    # f.semantic_errors *f.object.errors.keys
    f.inputs "TestMaster" do
      f.input :name
      f.input :test_start_time
      f.input :duration
        f.has_many :test_master_tests do |tmt|
          tmt.input :test_id, :label=>'Test Category', :collection=>Test.all.map {|m| [m.test_category_name,m.id]}, :as => :select
          tmt.input :question_count
          tmt.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove'
        end
    end
    f.actions
  end

  filter :discount_coupons, :as => :select, :collection => DiscountCoupon.all.map{|t| ["#{t.cost}",t.id]}
  filter :users, :as => :select, :collection => User.all.map{|t| ["#{t.email}",t.id]}
  filter :tests, :as => :select, :collection => Test.all.map{|t| ["#{t.test_category_name}",t.id]}
  filter :name
  # filter :content
  filter :created_at
  filter :updated_at

end

