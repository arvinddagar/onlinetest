class HomeController < ApplicationController
    before_filter :authenticate_user!, :only=> :index

  
  def index
  	  if request.post?         
        @coupon = DiscountCoupon.find_by_token(params[:a])
    	    if @coupon.present?
            if @coupon.used == false
            abc=[]
            current_test= @coupon.test_master
            start= current_test.test_start_time
            finish= current_test.test_start_time+(current_test.duration*60)
            if  ((start.strftime("%d-%m-%y %H:%M"))...(finish.strftime("%d-%m-%y %H:%M"))).cover?(Time.now.strftime("%d-%m-%y %H:%M"))
              @user_current_test=UsersTest.create!(user: current_user, start_time: Time.now(), score: 0, test_master: @coupon.test_master)
              session[:current_user_test] =  @user_current_test.id
              @coupon.update(used: true,active: false, users_test: @user_current_test)
              current_test.test_master_tests.each do |tmt|
                questions= tmt.test.questions.order('RANDOM()').limit(tmt.question_count)
                questions.each do |question|
                  abc << question
                 end
              end
                  abc.shuffle.each do |question|
                    @user_current_test.users_answers.create!(question: question )
                  end
            
              redirect_to testquestions_path(@user_current_test.id) 
            else
              
              redirect_to root_path, :notice =>"Test can not be started now"+ " " + "Test Date: "+" " +start.strftime("%d-%m-%y")+ " " + "Test Time: "+" "+ start.strftime("%H:%M")
            end
            else @coupon.used == true
              if @coupon.users_test.user == current_user
                if @coupon.users_test.present? && @coupon.users_test.end_time == nil
                @user_current_test = @coupon.users_test 
                session[:current_user_test] =  @user_current_test.id
                redirect_to testquestions_path(@user_current_test.id, type: 'reused')
                else
                 redirect_to testsubmit_path(@coupon.users_test.id)
                end
              else
                redirect_to root_path, :notice =>"Invalid Discount Coupon or User please contact Admin" 
            end
          end
          else
              redirect_to root_path, :notice =>"Invalid Discount Coupon please contact Admin"
          end
  		 
  		end 
  end




# ((1..10) === 5)
# ((@coupon.test_master.test_start_time..@coupon.test_master.test_start_time+@coupon.test_master.duration )===Time.now)



end
