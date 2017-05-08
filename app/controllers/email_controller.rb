class EmailController < ApplicationController

  def index

    errors = []
    company = params[:company]
    fullname = params[:fullname]

    errors.push("No company was provided") unless company.present?
    errors.push("No fullName was provided") unless fullname.present?
    (render json: errors, status: :bad_request and return) unless errors.empty?

    errors.push("Email cannot be derive from company and fullName combination") unless @@MOCK_DATA[company].present?

    (render json: errors, status: :not_found and return) unless errors.empty?

    derive_email = EmailHelper.translate(@@MOCK_DATA[company][:type],company,fullname)

    render json: {email:derive_email}
  end

end
