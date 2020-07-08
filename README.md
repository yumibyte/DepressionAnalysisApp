# Reddit Scraper
- Will scrape from a given subreddit using PRAW and output the results to a xlsx spreadshet

### Scraping Function
- Call retrieve posts function with the subreddit (ex.: "happy"), output (0 or 1), limit (# of posts retrieved), and type of post (hot, top, or new)
```
retrieve_posts("your_subreddit", output, limit, "type")
```
### Writing to a xlsx file
- Write_xlsx() will overwrite any data in the database.
- Append_xlsx() will add to the end of a current xlsx file and will also check for duplicates to make sure it doesn't append a post already in the database
- To call either, input the file name (including .xlsx file type on the end!!) and the array containing the posts' dictionaries.

```
Write_xlsx('file_name.xlsx', input_posts)
```
or
```
Append.xlsx('file_name.xlsx', input_posts)
```

### Known Issues
- When retrieving posts the scraping function (retrieve_posts()) may crash! Do not try to exceed 100 requests at once but the absolute max is 1,000 (and it may crash for certain subreddits at 1,000)
- If you scrape 100 posts and attempt to scrape another 100 posts by calling the same function with the same parameters, PRAW will pull essentially the same posts (unless you're using "new" as ur type or waiting long periods of time, the posts being pulled will not be any different from before)
- DO NOT call retrieve_posts() multiple times in a row without appending it to the database!!! Since append_posts() only compares the values in the database to the current dictionary of posts, current duplicates in the dictionary will not be accomodated for. Here is an example of how to call this function without getting duplicates:
```
retrieve_posts("depression", 1, 100, "hot")
Append_xlsx('Depression_Reddit_Database.xlsx', reddit_message_dict)
retrieve_posts("depression", 1, 1000, "hot")
Append_xlsx('Depression_Reddit_Database.xlsx', reddit_message_dict)
```
- The first 100 posts of the second call would have been duplicates since PRAW pulls the same first posts between short intervals of time. Now there won't be any duplicates in your database :)
