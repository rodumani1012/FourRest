# -*- coding:utf-8 -*-

from bs4 import BeautifulSoup # 긁어온걸 파싱해주는 역할
import urllib.request # 긁어오는 역할.
from builtins import str
import json
from pymongo import MongoClient

tmplist = []

for i in range(1,31):
    resp = urllib.request.urlopen('http://www.animal.go.kr/portal_rnl/map/mapInfo2.jsp?s_date=&e_date=&s_upr_cd=&s_org_cd=&s_up_kind_cd=&s_kind_cd=&s_name=&pagecnt=' + str(i))
        
    soup = BeautifulSoup(resp, 'html.parser')
    
    
    temp = soup.find_all('tr')

    for i in range(0, len(temp)-1):
        if i%2 == 0:
            continue
        else:
            tmp = temp[i].find_all('td')
            tmpdict = {'area':tmp[0].get_text(), 'centerName':tmp[1].get_text(), 'phoneNumber':tmp[2].get_text(),
                        'centerAddr':tmp[3].get_text().strip().replace("\n\t\t\t\t\xa0\xa0","")}
            tmplist.append(tmpdict)
            
# json 형태로 변환. ensure_ascii=False는 유니코드를 한글로 변환함
json_val = json.dumps(tmplist, ensure_ascii=False)
print(json_val)

# # 클래스 객체 할당
# connection = MongoClient('localhost', 27017)
# 
# db = connection.shelter
# collection = db.testCollection
# 
# collection.insert(json_val)






    
