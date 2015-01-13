ActiveAdmin.register Question do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id,:test_id,:content, answers_attributes: [:id,:question_id,:_destroy,:content,:correct]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :content
    column "Test",:test_id
    column :created_at
    column :updated_at
    actions
  end

    form do |question|
      question.inputs do
        question.input :test_id,:as => :select, :collection => Test.all.map{|t| ["#{t.test_category_name}",t.id]}
        question.input :content, :input_html => {:rows => 2}

          question.inputs do 
            question.has_many :answers, :header=>"Answers" do |answer|
              answer.input :content, :input_html => {:rows => 1}
              answer.input :correct, :as=>:boolean
              answer.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove Answer'
            end
          end
      end
 
      question.actions
    end

  filter :test, :as => :select, :collection => Test.all.map{|t| ["#{t.test_category_name}",t.id]}
  filter :answers, :as => :select, :collection => Answer.all.map{|t| ["#{t.content}",t.id]}
  filter :users_answers
  filter :users_tests
  filter :content
  filter :created_at
  filter :updated_at
end

