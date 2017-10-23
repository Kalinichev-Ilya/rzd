# Names
cities = %i[Moscow St-Petersburg Novosibirsk Ekaterinburg
            Nizhny Novgorod Kazan Chelyabinsk Omsk
            Samara Rostov-na-Donu Ufa Krasnoyarsk
            Permian Voronezh Volgograd]

names = %i[Kelvin Keneth Lillie Kenneth Karl
           Abigail Donatella Keith Keenan Kelley Ella
           Jacintha Fayre Bonita Ellie Kareem Isa Kaytlyn
           Kelly Kenny Kasey Belinda Kennith Ken Bella
           Kendall Iowa Keva Kendrick Ellen]

# Create Railway stations
cities.each do |city|
  RailwayStation.create! title: city
end

# Create Routes
cities.each.with_index(1) do |station, i|
  Route.create! name: "#{station}-#{cities[cities.count - i]}"
end

stations = RailwayStation.all
routes = Route.all

# Create associations Railway stations has many Routes
routes.zip(stations).each { |route, station| station.routes << route }

# generate random number
def number(nums_count, chars_count, separator)
  nums = []
  chars = []
  nums_count.times { nums << (0..9).to_a.sample }
  chars_count.times { chars << ('A'..'Z').to_a.sample }

  "#{nums.join}#{separator}#{chars.join}"
end

# Create Trains
routes.zip(stations).each do |route, station|
  Train.create! number: number(3, 2, '-'),
                route: route,
                current_station: station
end

# Create Users
names.each do |name|
  User.create! name: name
end

trains = Train.all
users = User.all

# Create Tickets
stations.each_with_index do |station, i|
  Ticket.create! number: number(3, 4, ':'),
                 train: trains[i],
                 from_station: station,
                 to_station: stations[stations.count - (i + 1)],
                 user: users[i]
end
