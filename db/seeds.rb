# User.destroy_all
# Comicbook.destroy_all

milan=User.create(firstname: "Milan", lastname: "Mody", email: "milanm1120@gmail.com", username: "milan", password:"1234")
bob=User.create(firstname: "Bob", lastname: "Bobby", email: "bob@bob.com", username: "bob", password: "1234")
joe=User.create(firstname: "Joe", lastname: "Bobby", email: "joe@bob.com", username: "joe", password: "1234")

Comicbook.find_or_create_by(user_id: milan.id, title: "Batman", issue_number: 100, publisher: "DC Comics", year: 2020, writer: "James Tynion IV" , artist: "Jorge Jimenez", cover_price: 6.99, description: "Ending to 'The Joker War'")

Comicbook.find_or_create_by(user_id: joe.id, title: "The Amazing Spider-Man", issue_number: 100, publisher: "Marvel", year: 1971, writer: "Stan Lee" , artist: "Gil Kane", cover_price: 0.15, description: "Peter Parker creates a potion to get rid of his powers.")

Comicbook.find_or_create_by(user_id: bob.id, title: "Superman", issue_number: 100, publisher: "DC Comics", year: 1955, writer: "William Woolfolk" , artist: "Wayne Boring", cover_price: 0.10, description: "Floyd Fowler finds a piece of metal from the rocket that brought Superman to Earth.")