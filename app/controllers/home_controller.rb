class HomeController < ApplicationController
  
  def index
    
  end
  
  def sessions_create
    response = RestClient::Request.execute(
      method: :post,
      url: "localhost:3002/sessions.json?email=#{params[:sign_in][:email]}&password=#{params[:sign_in][:password]}"
     )

     if !response.blank?
       redirect_to home_index_path
     else
       flash[:error] = "Invalid Username or Password"
       redirect_to root_path
     end
  end
  
  def new_registration
    response = RestClient::Request.execute(
      method: :post,
      url: "localhost:3002/new_user_registration.json?email=#{params[:sign_up][:email]}&password=#{params[:sign_up][:password]}&password_confirmation=#{params[:sign_up][:password_confirmation]}"
     )

     if !ActiveSupport::JSON.decode(response)["id"].blank?
       flash[:notice] = "Succefully Created. Please Login"
       redirect_to root_path
     else
       flash[:error] = ActiveSupport::JSON.decode(response)["error"]
       redirect_to root_path
     end
  end
end
