### Coding decisions
1. I used the device gem for authentication
2. Users must be logged in to create a new article or edit or delete a current article
3. No login required to view index and show pages
4. When a user searches it filters the result on the index page
5. I used a pagination gem for the index page
6. Only the user that created an article can edit or delete it
7. Articles that are not set as published are only visible to the user that created it
8. Instead of adding a name for the user, I decided to use the username from the email address (before @)
9. Used pundit for authorization

### Difficulties faced
Overall I didn't have too many problems with the challenge, however there were a couple of small logic errors that I had to fix.

1. I had to work out how to still show 5 results on each index page even if one or more of the articles wasn't published.
I fixed this by adding a where query in the articles contoller to remove any articles that shouldn't be displayed before being sent to the articles view
2. The articles count wasn't updating based on the search so I had to update the articles controller to return the correct number based on the query

## Design
I decided to keep the design fairly close to the mockup sketches, although I moved some items around, for example, the navbar to make it easier to navigate.
I also removed the show link from actions and made the article title the link, this seemed more natural when I was testing the site.
Frontend was built using a combination of bootstrap (for the layout and table) and custom CSS for some buttons and forms
I used a JavaScript date picker for the new and edit article form
