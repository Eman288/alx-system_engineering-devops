#!/usr/bin/python3
"""
 a function that queries the Reddit API and returns the number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """
        a function to get the number of users for the subreddit
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    header = {
        'User-Agent': 'myapp:subscribers:v1.0'
    }
    try:
        r = requests.get(url, headers=header, allow_redirects=False)

        if r.status_code == 200:
            data = r.json()
            return data['data']['subscribers']
        else:
            return 0
    except requests.RequestException:
        return 0
