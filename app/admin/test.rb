ActiveAdmin.register Test do

controller do
  def new
    @test = Test.new
    2.times do 
      question = @test.questions.build
      2.times { question.answers.build }
    end
  end
end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  permit_params :test_category_name, questions_attributes: [:id,:test_id,:_destroy,:content, answers_attributes: [:id,:question_id,:_destroy,:content,:correct]]
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :test_category_name
        f.inputs do
          f.has_many :questions, :header=>"" do |question|
            question.input :content, :input_html => {:rows => 2}
              question.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove Question'
                question.has_many :answers, :header=>"Answers" do |answer|
                  answer.input :content, :input_html => {:rows => 1}
                  # answer.input :correct, :as=>:boolean,:required => false
                  answer.input :correct, :as => :boolean
                  answer.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove Answer'
                end
          end
        end

    end
    f.actions
  end

  filter :questions, :as => :select, :collection => Question.all.map{|t| ["#{t.content}",t.id]}
  # filter :users_tests
  filter :test_category_name
  filter :created_at
  filter :updated_at

end
