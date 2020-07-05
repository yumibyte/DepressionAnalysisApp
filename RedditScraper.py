# Reading API key
import os
from dotenv import load_dotenv
load_dotenv()

PERSONAL_USE_SCRIPT = os.getenv('PERSONAL_USE_SCRIPT_KEY')
SECRET_KEY = os.getenv('SECRET_KEY')
# import praw
# import json

