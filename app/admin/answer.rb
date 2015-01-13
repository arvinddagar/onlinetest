ActiveAdmin.register Answer do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id,:question_id,:content,:correct
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


    form do |answer|
      answer.inputs do
        answer.input :question_id,:as => :select, :collection => Question.all.map{|t| ["#{t.content}",t.id]}
        answer.input :content
        answer.input :correct, :as=>:boolean
        # answer.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove Answer'          
      end

      answer.actions
    end

  filter :question, :as => :select, :collection => Question.all.map{|t| ["#{t.content}",t.id]}
  filter :users_answers
  filter :content
  filter :created_at
  filter :updated_at
    
end
