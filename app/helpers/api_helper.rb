helpers do 
	def get_alderaan
		response = HTTParty.get('http://swapi.co/api/planets')
		response
	end
end