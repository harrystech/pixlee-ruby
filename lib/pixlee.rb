require "pixlee/version"
require 'open-uri'

module Pixlee
    class API
    	def initialize(api_key, app_name)
    	    @api_key = api_key
    	    @app_name = app_name
    	end

    	# Get all albums for a user
    	def get_albums
    	    json = call_api("#{base_url}", {})

    	    return json["data"]
    	end

    	# Method to get album contents. Options accepts: type, sort, page, per_page
    	def get_album_contents(album_id, options = {})
    	    json = call_api("#{base_url}/albums/#{album_id}", options)

    	    response = {
    	        :photos => json["data"],
    	        :num_results => json["num_results"]
    	    }

    	    # These are only useful if using paginaiton (e.g. not requesting all)
    	    if options[:type] != 'all'
    	        response[:num_results_per_page] = json["num_results_per_page"]
    	        response[:total_photos] = json["num_results_per_page"]
    	        response[:page_previous_url] = json["page_next_url"]
    	        response[:page_previous_url] = json["page_next_url"]
    	    end

    	    return response
    	end

    	# Method to get album contents. Options accepts: type, sort
    	def get_album_photo(album_id, album_photo_id, options = {})
    	    json = call_api("#{base_url}/albums/#{album_id}/photos/#{album_photo_id}", options)

    	    reponse = json["data"]["photo"]
    	    reponse["updated_at"] = json["data"]["updated_at"]
    	    reponse["created_at"] = json["data"]["created_at"]

    	    return reponse
    	end

    	# Method to get users albums. Options accepts: type, sort
    	def get_users_albums(user_id, options = {})
    	    json = call_api("http://api.pixlee.com/v1/#{user_id}", options)

    	    reponse = json["data"]["photo"]

    	    return reponse
    	end

    	private

    	# Base URL for most API calls (except user lookups)
    	def base_url
    	    return "http://api.pixlee.com/v1/#{@app_name}"
    	end

    	# Private method to actually make the call to the api and parse the json
    	def call_api(url, options = {})
    	    # always add api key
    	    options["api_key"] = @api_key
    	    JSON.parse(URI.parse("#{url}?#{hash_to_query(options)}").read)
    	end

    	def hash_to_query(query_object)
    	    query_object.map{|k,v|
    	        # Make it a string in case it is a symbol
    	        k = k.to_s
    	        v = v.to_s
    	        "#{CGI.escape(k)}=#{CGI.escape(v)}"
    	    }.join("&")
    	end
    end
end
