#!/usr/bin/python3
"""
 a function that queries the Reddit API and prints the titles of the
 first 10 hot posts listed for a given subreddit.
"""
import requests


def top_ten(subreddit):
    """
    a function that queries the Reddit API and prints the titles of the
    first 10 hot posts listed for a given subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}/new.json?limit=10"
    try:
        r = requests.get(url, allow_redirects=False)
        if r.status_code == 200:
            data = r.json()
            for i in data['data']['children']:
                print(i['data']['title'])
        else:
            print("None")
    except requests.RequestException:
        print("None")
