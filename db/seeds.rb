Deck.delete_all
Card.delete_all
User.delete_all
Guess.delete_all
Round.delete_all

STATES = [
  {state: "Alabama", capital: "Montgomery"},
  {state: "Alaska", capital:  "Juneau"},
  {state: "Arizona", capital: "Phoenix"},
  {state: "Arkansas", capital:  "Little Rock"},
  {state: "California", capital:  "Sacramento"},
  {state: "Colorado", capital:  "Denver"},
  {state: "Connecticut", capital: "Hartford"},
  {state: "Delaware", capital:  "Dover"},
  {state: "Florida", capital: "Tallahassee"},
  {state: "Georgia", capital: "Atlanta"},
  {state: "Hawaii", capital:  "Honolulu"},
  {state: "Idaho", capital: "Boise"},
  {state: "Illinois", capital:  "Springfield"},
  {state: "Indiana", capital: "Indianapolis"},
  {state: "Iowa", capital:  "Des Moines"},
  {state: "Kansas", capital:  "Topeka"},
  {state: "Kentucky", capital:  "Frankfort"},
  {state: "State", capital: "Capital"},
  {state: "Louisiana", capital: "Baton Rouge"},
  {state: "Maine", capital: "Augusta"},
  {state: "Maryland", capital:  "Annapolis"},
  {state: "Massachusetts", capital: "Boston"},
  {state: "Michigan",  capital: "Lansing"},
  {state: "Minnesota", capital: "Saint Paul"},
  {state: "Mississippi", capital: "Jackson"},
  {state: "Missouri", capital: "Jefferson City"},
  {state: "Montana", capital: "Helena"},
  {state: "Nebraska", capital: "Lincoln"},
  {state: "Nevada", capital: "Carson City"},
  {state: "New Hampshire", capital: "Concord"},
  {state: "New Jersey",  capital: "Trenton"},
  {state: "New Mexico", capital: "Santa Fe"},
  {state: "New York",  capital: "Albany"},
  {state: "North Carolina",  capital: "Raleigh"},
  {state: "North Dakota",  capital: "Bismarck"},
  {state: "Ohio", capital: "Columbus"},
  {state: "Oklahoma", capital: "Oklahoma City"},
  {state: "Oregon",  capital: "Salem"},
  {state: "Pennsylvania",  capital: "Harrisburg"},
  {state: "Rhode Island",  capital: "Providence"},
  {state: "South Carolina",  capital: "Columbia"},
  {state: "South Dakota",  capital: "Pierre"},
  {state: "Tennessee", capital: "Nashville"},
  {state: "Texas", capital: "Austin"},
  {state: "Utah", capital: "Salt Lake City"},
  {state: "Vermont", capital: "Montpelier"},
  {state: "Virginia",  capital: "Richmond"},
  {state: "Washington",  capital: "Olympia"},
  {state: "West Virginia", capital: "Charleston"},
  {state: "Wisconsin", capital: "Madison"},
  {state: "Wyoming", capital: "Cheyenne"}
]

deck = Deck.create!(name: "State Capitals and shit")
STATES.each do |state_hash|
  deck.cards.create!(question: state_hash[:state], answer: state_hash[:capital])
end

deck_mario = Deck.create!(name: "Super Mario Characters")
# Dir[APP_ROOT.join('public', 'imgs', '*')].each { |file| puts file.split('/').last.split('.').first }
Dir[APP_ROOT.join('public', 'imgs', '*')].each do |file|
  deck_mario.cards.create!(
    question: "Name that character!",
    question_image_url: "/imgs/" + File.basename(file),
    answer: File.basename(file, ".*").split('_').join(' ')
  )
end

# deck = Deck.create!(name: "Favorite colors")
# deck.cards.create!(
#   question: "What is your favorite color?",
#   answer: "Magenta"
# )
# deck.cards.create!(
#   question: "What is my favorite color?",
#   answer: "Coop Himmelblau"
# )


user = User.create!(email: "bruce@gmail.com", password: "password")
user.played_rounds.create(deck_id: deck.id)





