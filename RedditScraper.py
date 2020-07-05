# Reading API key
import os
from dotenv import load_dotenv
load_dotenv()
#
client_id = os.getenv('CLIENT_ID')
client_secret = os.getenv('CLIENT_SECRET')
user_agent = os.getenv('APP_NAME')
username = os.getenv('REDDIT_USER_NAME')
password = os.getenv('REDDIT_PASSWORD')

# Retrieving data from Reddit
import praw

reddit = praw.Reddit(client_id = client_id,
                     client_secret = client_secret,
                     username = username,
                     user_agent = user_agent,
                     password = password)

subred = reddit.subreddit("depression")
hot = subred.hot(limit = 2)
# new = subred.new(limit = 3)
# new = subred.controversial(limit = 3)
# top = subred.top(limit = 3)
# gilded = subred.gilded(limit = 3)
#
x = next(hot)
print(dir(x))

pulled_reddit_message = []
for i in hot:
    print(i.title ,
          i.author,
          i.author_flair_text,
    #       i.author_fullname,
    #       i.category,
    #       i.clicked,
    #       i.comments,
    #       i.created,
    #       i.downs,
    #       i.num_reports,
    #       i.over_18,
    #       i.parent_whitelist_status,
    #       i.quarantine,
    #       i.score,
    #       i.saved,
    #       i.thumbnail,
    #       i.upvote_ratio,
    #       i.view_count,
    #       i.whitelist_status,
          i.url)

# important parameters
# '_comments_by_id'
# 'author'
# 'author_flair_text'
# 'author_flair_type'
# 'author_fullname'
# 'category'
# 'clicked'
# 'comment_sort'
# 'comments'
# 'created'
# 'downs'
# 'id_from_url'
# 'likes'
# 'media'
# 'num_comments'
# 'name'
# 'num_reports'
# 'over_18'
# 'parent_whitelist_status'
# 'quarantine'
# 'saved'
# 'score'
# 'subreddit_id'
# 'title'
# 'thumbnail'
# 'upvote_ratio'
# 'view_count'
# 'whitelist_status'
# 'url'
