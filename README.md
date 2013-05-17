# Pixlee

This gem is a simple API wrapper for Pixlee's API. It allows you to pull your albums, specific images from an album, or search for users albums.

## Installation

Add this line to your application's Gemfile:

    gem 'pixlee'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pixlee

## Usage


	pixlee = Pixlee::API.new(<pixlee_api_key>, <pixlee_app_name>)

	# Getting  your albums
	albums = pixlee.get_albums

	# Getting all photos in an album
	photos = pixlee.get_album_contents(<album_id>, :type => "all", :sort => "recent|popularity")

	# Getting a specific photos data
	photo = pixlee.get_album_photo(<album_id>, <album_photo_id>, :type => "public|private")

	# Getting a users albums
	albums = pixlee.get_users_albums(<user_id>)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
