import os
from dotenv import load_dotenv
import praw
from pandas import DataFrame

# Load API Keys
load_dotenv()
client_id = os.getenv('CLIENT_ID')
client_secret = os.getenv('CLIENT_SECRET')
user_agent = os.getenv('APP_NAME')
username = os.getenv('REDDIT_USER_NAME')
password = os.getenv('REDDIT_PASSWORD')

reddit = praw.Reddit(client_id = client_id,
                     client_secret = client_secret,
                     username = username,
                     user_agent = user_agent,
                     password = password)

# Retrieve Posts Function
reddit_message_dict = []

def retrieve_posts(subred_input, result_input, limit_input, subred_type):
    subred = reddit.subreddit(subred_input)

    if subred_type == "new":
        subred_test = subred.new(limit=limit_input)

    if subred_type == "top":
        subred_test = subred.top(limit=limit_input)

    if subred_type == "hot":
        subred_test = subred.hot(limit=limit_input)

    for i in subred_test:
        if i.is_self and i.url not in reddit_message_dict:
            pulled_reddit_message = {'url': i.url,
                                     # 'post_ID': i.id_from_url(url=i.url),
                                     'title': i.title,
                                     'author_name': i.author,
                                     'created': i.created,      # in Unix time
                                     'score': i.score,
                                     'upvote_ratio': i.upvote_ratio,
                                     'content': i.selftext,
                                     'result': result_input}
            reddit_message_dict.append(pulled_reddit_message)

# Retrieve Happy/Sad posts
# retrieve_posts("depression", 1)
retrieve_posts("depression", 0, 10, "new")
retrieve_posts("depression", 0, 10, "top")
retrieve_posts("depression", 0, 10, "hot")
retrieve_posts("sad", 0, 10, "new")
retrieve_posts("sad", 0, 10, "top")
retrieve_posts("sad", 0, 10, "hot")


# retrieve_posts("happy", 0, 100000)
# retrieve_posts("depressed", 1, 100000)
# retrieve_posts("depression", 1, 100000)
# retrieve_posts("sad", 1, 100000)
# retrieve_posts("SuicideWatch", 1, 100000)



# Write to excel file

DB_columns = ['url', 'title', 'author_name', 'created', 'score', 'upvote_ratio', 'content', 'result']
df = DataFrame(reddit_message_dict, columns = DB_columns)
df.to_excel('Depression_Reddit_Database2.xlsx')
