helpers do 
	def current_user
		@current_user ||= User.find(session[:id]) if session[:id]
	end

	def get_planet
		response = HTTParty.get('http://swapi.co/api/planets')
	end

	def get_starship
		response = HTTParty.get('http://swapi.co/api/starships')
	end

	def get_species
		response = HTTParty.get('http://swapi.co/api/species')
	end
end

