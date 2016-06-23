class SettingsController < ApplicationController
	before_filter :admin_only
	def show
		@about_text=Setting.about_text
		@site_title=Setting.site_title

	end

	def save
		params.require(:settings)
	    Setting.about_text=params[:settings][:about_text]
	    Setting.site_title=params[:settings][:site_title]
	    redirect_to :show_settings, notice: "Settings saved"
	end

	def admin_only
		unless current_user.admin? 
			redirect_to root_path, :alert => "Access denied."
		end
	end
end
