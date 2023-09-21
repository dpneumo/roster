# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize first account:
require 'securerandom'

User.create! do |u|
  u.email = 'first@admin.com'
  u.password   = 'password'
  u.first_name = 'Replace'
  u.last_name  = 'Me!'
  u.role       = 'admin'
end

p1_id = SecureRandom.uuid
p2_id = SecureRandom.uuid

Person.create([
                { id: p1_id, nickname: 'Mitch', first: 'Mitch', middle: 'C', last: 'Kuppinger' },
                { id: p2_id, nickname: 'Blake', first: 'J', middle: 'Blake', last: 'Kuppinger' }
              ])

Position.create([
                  { person_id: p1_id, name: 'President', start: '2021-01-01', stop: '2021-01-30' },
                  { person_id: p2_id, name: 'Vice President', start: '2021-01-01', stop: '2021-02-28' },
                  { person_id: p2_id, name: 'Secretary',      start: '2021-03-01', stop: '2021-06-30' },
                  { person_id: p1_id, name: 'Treasurer',      start: '2021-02-01', stop: '2021-12-31' },
                  { person_id: p1_id, name: 'Landscape',      start: '2021-01-29', stop: '2021-01-30' },
                  { person_id: p2_id, name: 'Welcome',        start: '2021-02-01', stop: '2021-04-30' }
                ])

House.create([
               { 'number' => 6000, 'street' => 'Englishoak Dr', 'lat' => 32.7074229, 'lng' => -97.1994438 },
               { 'number' => 6002, 'street' => 'Englishoak Dr', 'lat' => 32.707006, 'lng' => -97.199421 },
               { 'number' => 6003, 'street' => 'Englishoak Dr', 'lat' => 32.7077706, 'lng' => -97.1998777 },
               { 'number' => 6004, 'street' => 'Englishoak Dr', 'lat' => 32.7070476, 'lng' => -97.1998648 },
               { 'number' => 6005, 'street' => 'Englishoak Dr', 'lat' => 32.7075549, 'lng' => -97.2002017 },
               { 'number' => 6006, 'street' => 'Englishoak Dr', 'lat' => 32.707066, 'lng' => -97.20033099999999 },
               { 'number' => 6007, 'street' => 'Englishoak Dr', 'lat' => 32.7075293, 'lng' => -97.2006021 },
               { 'number' => 6008, 'street' => 'Englishoak Dr', 'lat' => 32.7070687, 'lng' => -97.2006438 },
               { 'number' => 6009, 'street' => 'Englishoak Dr', 'lat' => 32.707512, 'lng' => -97.20086119999999 },
               { 'number' => 6010, 'street' => 'Englishoak Dr', 'lat' => 32.7070932, 'lng' => -97.2009806 },
               { 'number' => 6011, 'street' => 'Englishoak Dr', 'lat' => 32.707492, 'lng' => -97.2011773 },
               { 'number' => 6012, 'street' => 'Englishoak Dr', 'lat' => 32.7071161, 'lng' => -97.2013489 },
               { 'number' => 6014, 'street' => 'Englishoak Dr', 'lat' => 32.7070933, 'lng' => -97.201674 },
               { 'number' => 6015, 'street' => 'Englishoak Dr', 'lat' => 32.7075526, 'lng' => -97.201619 },
               { 'number' => 6016, 'street' => 'Englishoak Dr', 'lat' => 32.7071205, 'lng' => -97.2020333 },
               { 'number' => 6018, 'street' => 'Englishoak Dr', 'lat' => 32.7072788, 'lng' => -97.20235319999999 },
               { 'number' => 2100, 'street' => 'Englishoak Dr', 'lat' => 32.7112331, 'lng' => -97.2033885 },
               { 'number' => 2102, 'street' => 'Englishoak Dr', 'lat' => 32.7109698, 'lng' => -97.2034018 },
               { 'number' => 2104, 'street' => 'Englishoak Dr', 'lat' => 32.7106333, 'lng' => -97.20314909999999 },
               { 'number' => 2106, 'street' => 'Englishoak Dr', 'lat' => 32.7105874, 'lng' => -97.2028179 },
               { 'number' => 2107, 'street' => 'Englishoak Dr', 'lat' => 32.7107048, 'lng' => -97.20228589999999 },
               { 'number' => 2108, 'street' => 'Englishoak Dr', 'lat' => 32.710396, 'lng' => -97.2026284 },
               { 'number' => 2110, 'street' => 'Englishoak Dr', 'lat' => 32.71017090000001, 'lng' => -97.2024122 },
               { 'number' => 2200, 'street' => 'Englishoak Dr', 'lat' => 32.7098064, 'lng' => -97.2020368 },
               { 'number' => 2202, 'street' => 'Englishoak Dr', 'lat' => 32.7096294, 'lng' => -97.20190699999999 },
               { 'number' => 2204, 'street' => 'Englishoak Dr', 'lat' => 32.7093294, 'lng' => -97.2017806 },
               { 'number' => 2206, 'street' => 'Englishoak Dr', 'lat' => 32.709137, 'lng' => -97.20170499999999 },
               { 'number' => 2300, 'street' => 'Englishoak Dr', 'lat' => 32.7087535, 'lng' => -97.2017511 },
               { 'number' => 2304, 'street' => 'Englishoak Dr', 'lat' => 32.7085896, 'lng' => -97.20205430000001 },
               { 'number' => 2307, 'street' => 'Englishoak Dr', 'lat' => 32.7080718, 'lng' => -97.2019571 },
               { 'number' => 2308, 'street' => 'Englishoak Dr', 'lat' => 32.7080715, 'lng' => -97.2029838 },
               { 'number' => 2315, 'street' => 'Englishoak Dr', 'lat' => 32.7077996, 'lng' => -97.20205430000001 },
               { 'number' => 2316, 'street' => 'Englishoak Dr', 'lat' => 32.7075095, 'lng' => -97.20262410000001 },
               { 'number' => 6000, 'street' => 'Amberwood Ct', 'lat' => 32.7077941, 'lng' => -97.2006227 },
               { 'number' => 6001, 'street' => 'Amberwood Ct', 'lat' => 32.7080767, 'lng' => -97.2002859 },
               { 'number' => 6003, 'street' => 'Amberwood Ct', 'lat' => 32.7083535, 'lng' => -97.2004333 },
               { 'number' => 6004, 'street' => 'Amberwood Ct', 'lat' => 32.7079295, 'lng' => -97.20093849999999 },
               { 'number' => 6005, 'street' => 'Amberwood Ct', 'lat' => 32.708394, 'lng' => -97.2008754 },
               { 'number' => 6007, 'street' => 'Amberwood Ct', 'lat' => 32.7083124, 'lng' => -97.2011491 },
               { 'number' => 6010, 'street' => 'Amberwood Ct', 'lat' => 32.7079264, 'lng' => -97.2016393 },
               { 'number' => 6000, 'street' => 'Driftwood Ct', 'lat' => 32.7086819, 'lng' => -97.2003885 },
               { 'number' => 6001, 'street' => 'Driftwood Ct', 'lat' => 32.7090013, 'lng' => -97.20029989999999 },
               { 'number' => 6003, 'street' => 'Driftwood Ct', 'lat' => 32.7093008, 'lng' => -97.2003701 },
               { 'number' => 6004, 'street' => 'Driftwood Ct', 'lat' => 32.7087499, 'lng' => -97.2007912 },
               { 'number' => 6005, 'street' => 'Driftwood Ct', 'lat' => 32.7092498, 'lng' => -97.2008235 },
               { 'number' => 6007, 'street' => 'Driftwood Ct', 'lat' => 32.7091463, 'lng' => -97.2011491 },
               { 'number' => 6008, 'street' => 'Driftwood Ct', 'lat' => 32.7087513, 'lng' => -97.2011491 },
               { 'number' => 6000, 'street' => 'Forestcreek Ct', 'lat' => 32.709609, 'lng' => -97.200593 },
               { 'number' => 6001, 'street' => 'Forestcreek Ct', 'lat' => 32.709919, 'lng' => -97.2006859 },
               { 'number' => 6003, 'street' => 'Forestcreek Ct', 'lat' => 32.7101263, 'lng' => -97.20089639999999 },
               { 'number' => 6004, 'street' => 'Forestcreek Ct', 'lat' => 32.7095115, 'lng' => -97.2009956 },
               { 'number' => 6005, 'street' => 'Forestcreek Ct', 'lat' => 32.7099729, 'lng' => -97.2012754 },
               { 'number' => 6007, 'street' => 'Forestcreek Ct', 'lat' => 32.7098267, 'lng' => -97.201528 },
               { 'number' => 6008, 'street' => 'Forestcreek Ct', 'lat' => 32.7094877, 'lng' => -97.2013175 },
               { 'number' => 6001, 'street' => 'Lakehurst Dr', 'lat' => 32.7113638, 'lng' => -97.20112800000001 },
               { 'number' => 6003, 'street' => 'Lakehurst Dr', 'lat' => 32.7111554, 'lng' => -97.2013175 },
               { 'number' => 6004, 'street' => 'Lakehurst Dr', 'lat' => 32.7107311, 'lng' => -97.2010648 },
               { 'number' => 6005, 'street' => 'Lakehurst Dr', 'lat' => 32.7109007, 'lng' => -97.2015491 },
               { 'number' => 6006, 'street' => 'Lakehurst Dr', 'lat' => 32.7104971, 'lng' => -97.2013175 },
               { 'number' => 6007, 'street' => 'Lakehurst Dr', 'lat' => 32.7107155, 'lng' => -97.2017175 },
               { 'number' => 6008, 'street' => 'Lakehurst Dr', 'lat' => 32.7103157, 'lng' => -97.20147240000001 },
               { 'number' => 6009, 'street' => 'Lakehurst Dr', 'lat' => 32.710551, 'lng' => -97.20190699999999 },
               { 'number' => 6010, 'street' => 'Lakehurst Dr', 'lat' => 32.7101243, 'lng' => -97.20169639999999 },
               { 'number' => 6014, 'street' => 'Lakehurst Ct', 'lat' => 32.7095955, 'lng' => -97.2024965 },
               { 'number' => 6015, 'street' => 'Lakehurst Ct', 'lat' => 32.7099642, 'lng' => -97.2027415 },
               { 'number' => 6017, 'street' => 'Lakehurst Ct', 'lat' => 32.7096031, 'lng' => -97.2031281 },
               { 'number' => 6018, 'street' => 'Lakehurst Ct', 'lat' => 32.7093298, 'lng' => -97.2025386 },
               { 'number' => 6019, 'street' => 'Lakehurst Ct', 'lat' => 32.7092307, 'lng' => -97.2030334 },
               { 'number' => 6020, 'street' => 'Lakehurst Ct', 'lat' => 32.709098, 'lng' => -97.20246139999999 },
               { 'number' => 6021, 'street' => 'Lakehurst Ct', 'lat' => 32.7089965, 'lng' => -97.2030221 },
               { 'number' => 6022, 'street' => 'Lakehurst Ct', 'lat' => 32.7088104, 'lng' => -97.2024122 },
               { 'number' => 6023, 'street' => 'Lakehurst Ct', 'lat' => 32.7087984, 'lng' => -97.20304809999999 },
               { 'number' => 6024, 'street' => 'Lakehurst Ct', 'lat' => 32.7084812, 'lng' => -97.2025386 },
               { 'number' => 6025, 'street' => 'Lakehurst Ct', 'lat' => 32.7084814, 'lng' => -97.2028607 },
               { 'number' => 6004, 'street' => 'Royaloak Dr', 'lat' => 32.7112689, 'lng' => -97.2021582 },
               { 'number' => 6005, 'street' => 'Royaloak Dr', 'lat' => 32.7113341, 'lng' => -97.2027912 },
               { 'number' => 6006, 'street' => 'Royaloak Dr', 'lat' => 32.7111089, 'lng' => -97.2023175 },
               { 'number' => 6008, 'street' => 'Royaloak Dr', 'lat' => 32.7108731, 'lng' => -97.2024122 },
               { 'number' => 2201, 'street' => 'Woodsong Tr', 'lat' => 32.7110552, 'lng' => -97.2007701 },
               { 'number' => 2202, 'street' => 'Woodsong Tr', 'lat' => 32.7105054, 'lng' => -97.2007912 },
               { 'number' => 2203, 'street' => 'Woodsong Tr', 'lat' => 32.7108918, 'lng' => -97.20055959999999 },
               { 'number' => 2204, 'street' => 'Woodsong Tr', 'lat' => 32.7103444, 'lng' => -97.2005385 },
               { 'number' => 2205, 'street' => 'Woodsong Tr', 'lat' => 32.7107307, 'lng' => -97.2003069 },
               { 'number' => 2207, 'street' => 'Woodsong Tr', 'lat' => 32.7105697, 'lng' => -97.20005429999999 },
               { 'number' => 2208, 'street' => 'Woodsong Tr', 'lat' => 32.7101785, 'lng' => -97.2003701 },
               { 'number' => 2209, 'street' => 'Woodsong Tr', 'lat' => 32.7103743, 'lng' => -97.1997628 },
               { 'number' => 2211, 'street' => 'Woodsong Tr', 'lat' => 32.7101989, 'lng' => -97.1996333 },
               { 'number' => 2300, 'street' => 'Woodsong Tr', 'lat' => 32.7096516, 'lng' => -97.1999999 },
               { 'number' => 2301, 'street' => 'Woodsong Tr', 'lat' => 32.7099636, 'lng' => -97.199528 },
               { 'number' => 2302, 'street' => 'Woodsong Tr', 'lat' => 32.7094336, 'lng' => -97.1999496 },
               { 'number' => 2303, 'street' => 'Woodsong Tr', 'lat' => 32.7096173, 'lng' => -97.1994438 },
               { 'number' => 2304, 'street' => 'Woodsong Tr', 'lat' => 32.7091494, 'lng' => -97.19994899999999 },
               { 'number' => 2305, 'street' => 'Woodsong Tr', 'lat' => 32.7093795, 'lng' => -97.1993806 },
               { 'number' => 2307, 'street' => 'Woodsong Tr', 'lat' => 32.7091577, 'lng' => -97.1994227 },
               { 'number' => 2308, 'street' => 'Woodsong Tr', 'lat' => 32.7088904, 'lng' => -97.1999388 },
               { 'number' => 2309, 'street' => 'Woodsong Tr', 'lat' => 32.7089446, 'lng' => -97.19940989999999 },
               { 'number' => 2310, 'street' => 'Woodsong Tr', 'lat' => 32.7086227, 'lng' => -97.19994899999999 },
               { 'number' => 2311, 'street' => 'Woodsong Tr', 'lat' => 32.708631, 'lng' => -97.1994227 },
               { 'number' => 2313, 'street' => 'Woodsong Tr', 'lat' => 32.7085029, 'lng' => -97.1993626 },
               { 'number' => 2314, 'street' => 'Woodsong Tr', 'lat' => 32.7082716, 'lng' => -97.19994899999999 },
               { 'number' => 2315, 'street' => 'Woodsong Tr', 'lat' => 32.7083725, 'lng' => -97.1993385 },
               { 'number' => 2316, 'street' => 'Woodsong Tr', 'lat' => 32.7080083, 'lng' => -97.19994899999999 },
               { 'number' => 2317, 'street' => 'Woodsong Tr', 'lat' => 32.7081068, 'lng' => -97.1993806 },
               { 'number' => 2319, 'street' => 'Woodsong Tr', 'lat' => 32.7078874, 'lng' => -97.1993806 }
             ])

props = { flag: false, rental: false, listed: false, status: 'Occupied' }
House.update_all(props)

