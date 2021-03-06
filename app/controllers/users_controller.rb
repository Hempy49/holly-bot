class UsersController < Clearance::UsersController

    def create
      @user = user_from_params

      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the chatbot, #{@user.email}!"
        redirect_to '/'
      else
        flash[:error] = "Have you already signed up? Please sign in"
        render template: 'users/new'
      end
    end

    private

    def user_from_params
      user_params = params[:user] || Hash.new
      email = user_params.delete(:email)
      password = user_params.delete(:password)

      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.email = email
        user.password = password
      end
    end
  end
