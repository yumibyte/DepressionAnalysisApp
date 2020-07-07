import os
from typing import List

from dotenv import load_dotenv
import praw
from pandas import DataFrame
import pandas as pd
from openpyxl import load_workbook

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
                                     'subreddit': subred_input,
                                     'title': i.title,
                                     'author_name': i.author,
                                     'created': i.created,      # in Unix time
                                     'score': i.score,
                                     'upvote_ratio': i.upvote_ratio,
                                     'content': i.selftext,
                                     'result': result_input}
            reddit_message_dict.append(pulled_reddit_message)

# Write to excel file

DB_columns = ['url', 'subreddit', 'title', 'author_name', 'created', 'score', 'upvote_ratio', 'content', 'result']

def Write_xlsx(file_name, reddit_dict):
    df = DataFrame(reddit_dict, columns=DB_columns)
    df.to_excel(file_name, index=False)


def Append_xlsx(file_name, reddit_dict):

    final_dict = []
    # check if post is already in DB
    df = pd.ExcelFile(file_name).parse('Sheet1')
    for x in reddit_dict:
        # print(x['url'])
        if x['url'] in df['url'].to_list():
            # del reddit_dict[reddit_dict.index(x)]
            continue
        final_dict.append(x)
    print("-------------------->>> RES")

    df_new = pd.DataFrame(final_dict, columns=DB_columns)

    writer = pd.ExcelWriter(file_name, engine='openpyxl')
    # try to open an existing workbook
    writer.book = load_workbook(file_name)
    # copy existing sheets
    writer.sheets = dict((ws.title, ws) for ws in writer.book.worksheets)
    # read existing file
    reader = pd.read_excel(file_name)
    # write out the new sheet
    df_new.to_excel(writer, index=False, header=False, startrow=len(reader) + 1)

    writer.close()




# Retrieve Happy/Sad posts
retrieve_posts("depression", 1, 1000, "new")
# retrieve_posts("depression", 1, 100, "top")
retrieve_posts("depression", 1, 1000, "hot")

# retrieve_posts("SuicideWatch", 1, 2, "new")
# retrieve_posts("SuicideWatch", 1, 2, "top")
# retrieve_posts("SuicideWatch", 1, 2, "hot")
#
# retrieve_posts("happy", 0, 2, "new")
# retrieve_posts("happy", 0, 2, "top")
# retrieve_posts("happy", 0, 2, "hot")
#
# retrieve_posts("neutraltalk", 0, 2, "new")
# retrieve_posts("neutraltalk", 0, 2, "top")
# retrieve_posts("neutraltalk", 0, 2, "hot")
#
# retrieve_posts("unpopularopinion", 0, 2, "new")
# retrieve_posts("unpopularopinion", 0, 2, "top")
# retrieve_posts("unpopularopinion", 0, 2, "hot")
#
# retrieve_posts("applyingtocollege", 0, 2, "new")
# retrieve_posts("applyingtocollege", 0, 2, "top")
# retrieve_posts("applyingtocollege", 0, 2, "hot")
#
# retrieve_posts("CasualConversation", 0, 2, "new")
# retrieve_posts("CasualConversation", 0, 2, "top")
# retrieve_posts("CasualConversation", 0, 2, "hot")
#
# retrieve_posts("CongratsLikeImFive", 0, 2, "new")
# retrieve_posts("CongratsLikeImFive", 0, 2, "top")
# retrieve_posts("CongratsLikeImFive", 0, 2, "hot")



Append_xlsx('Depression_Reddit_Database_Final.xlsx', reddit_message_dict)
