- rake db:create_migration NAME=table_name
- rake db:migrate

--------------------------------------------------

- rake console to start up binding.pry
- Comicbook.all to show all the comicbooks in DB
- Filter by specific attribute with Comicbook.where(key: value), Ex. Comicbook.where(publisher: "DC Comics")