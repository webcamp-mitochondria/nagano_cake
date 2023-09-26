# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :active_for_authentication?, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def active_for_authentication?
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer.present? && @customer.valid_password?(params[:customer][:password])
        unless @customer.is_active
          redirect_to new_customer_registration_path
        end
    else
      return
    end
  end

end
