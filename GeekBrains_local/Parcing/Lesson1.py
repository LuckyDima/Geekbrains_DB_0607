#import requests
#from pprint import pprint

#headers = {'User-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36',
          # 'Autorization':''
#    };

#myrepo = '/orgs/LuckyDima/repos'

#link = 'https://api.github.com'

#req = requests.get(link+myrepo,headers = headers)
#pprint(req.text)

#print (link+myrepo)

#req.close()

from github import Github


ACCESS_TOKEN =


#res=requests.get(url,headers={"Authorization": git_token})
repos=r.json()
#while 'next' in res.links.keys():
#  res=requests.get(res.links['next']['url'],headers={"Authorization": git_token})
r.json()
