#!/usr/bin/python3
import requests

r = requests.get('https://www.reddit.com/subreddits', allow_redirects=False)

print(r)
