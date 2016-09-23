require 'instagram'
require 'httparty'
require 'ostruct'

class InstagramController < ApplicationController

	def connect
		redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL, :scope => 'public_content')
	end

	def callback
		response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
		instagram[:access_token] = response.access_token
		instagram[:code] = response.code

		redirect_to :controller => 'welcome', :action => 'show'
	end
end