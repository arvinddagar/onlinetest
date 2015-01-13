class TestsController < InheritedResources::Base
  before_action :authenticate_user!
	# def show
	#   @user_current_test = UsersTest.find(session[:current_user_test])
 #    @test= @user_current_test.test_master
	# 	questions= @user_current_test.questions.order('RANDOM()')
	# 	set_session questions.count
 #    @test.current_step
	# 	@question = questions.first
 #  end

  def show
    @user_current_test = UsersTest.find(params[:id])
    @test= @user_current_test.test_master
    if params[:type] == 'reused'
      questions= @user_current_test.questions.where(users_answers: {attempted: nil})
      if questions.blank?
         @skip= @user_current_test.users_answers.where(attempted: false)
      end
    else
      questions= @user_current_test.questions
    end

    set_session questions.count
    @test.current_step
    @question = questions.first
  end

   def submit_answer

    @user_current_test = UsersTest.find(params[:user_current_test])
    @test= @user_current_test.test_master
    if params[:skipped_set].present?
      if !(params[:skipped_set] == "skip")
        record=  @user_current_test.users_answers.find_by(question_id: params[:question_id])
        record.answers = []
        record.answers << params[:answer][:id].to_i
        record.attempted = true
        record.save!
      end
      redirect_to skip_path
    elsif (params[:type] == 'skipped_set').present?
        @question= @user_current_test.questions.find(params[:question_id])
     else
        @test.current_step = session[:current_test_step
        ]
        question= @user_current_test.questions.find(params[:question_id])
        record=  @user_current_test.users_answers.find_by(question_id: params[:question_id])
        if !@test.last_step?
          if params[:skip_button].present?
            record.attempted = false
            @test.skip_step
          elsif params[:commit].present?
            record.answers = []
            record.answers << params[:answer][:id].to_i
            record.attempted = true
            @test.next_step
          end
            record.save!
            left_test= @user_current_test.users_answers.where("attempted is null")
            session[:current_test_step]= @test.current_step
            @question= left_test.first.question
        else
          if params[:skip_button].present?
            record.attempted = false
          elsif params[:commit].present?
            record.answers = []
            record.answers << params[:answer][:id].to_i
            record.attempted = true
          end
            record.save!
          redirect_to skip_path
        end
    end
  end



  def check_duration
    @test_master = TestMaster.find(params[:id])
    test_start_time = @test_master.test_start_time.strftime("%H:%M")
    test_master_duartion= @test_master.duration 
    test_e_time = test_start_time.to_time+test_master_duartion.minutes
    @test_duration= test_e_time.to_time- test_start_time.to_time 
    current_time= Time.now.strftime("%M")
    @remaining_time = ((Time.parse(test_e_time.to_s)-(Time.parse(DateTime.now.to_s)))/3600)*60
    if @test_master.present?
      render :json =>  @remaining_time
    else
      render :json =>  ""
    end
  end

  def final_submition
    
    @user_current_test =  UsersTest.find(params[:id])
    score=0.0
    if @user_current_test.present?
      @user_attempted = @user_current_test.users_answers.where(attempted: true)
      @user_attempted.each do |f|
        ans=f.answers.first
        if f.question.correct_answer.include?(ans)
            score=score+1
        else
           score=score-1.0/4.00
        end
      end
     
      @total_score= score
      @user_current_test.update(score: @total_score, end_time: Time.now)
    end
    session[:current_user_test] = nil
  end

  def set_session steps_count
    a=[]
    steps_count.times.each do |step|
      a << step
    end
    $data = a
    session[:current_test_step] = 0
  end

  def check_test
    @test =  UsersTest.find(session[:current_user_test]).test_master
    @test_time = @test.test_start_time.strftime("%H:%M%p")
    @test_day= @test.test_start_time.strftime("%d-%m-%y")
    if @test.present?
      render :json =>  @test
    else
      render :json =>  ""
    end     
  end

  def skip_question
   
    # @user_current_test = current_user.users_test
    # @test= current_user.test_master 
    # @skip= @user_current_test.users_answers.where(attempted: false)
    @user_current_test = UsersTest.find(session[:current_user_test])
    @skip = @user_current_test.users_answers.where(attempted: false)
  end
end

