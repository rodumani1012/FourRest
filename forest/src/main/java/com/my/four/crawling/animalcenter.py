# -*- coding:utf-8 -*-

# pip install beautifulsoup4
# pip install pymongo
from bs4 import BeautifulSoup # 긁어온걸 파싱해주는 역할
import urllib.request # 긁어오는 역할.
from builtins import str
import json
from pymongo import MongoClient # 파이썬을 몽고db에 연결해주는 역할

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
print('저장 시작')
# # 클래스 객체 할당
# connection = MongoClient('mongodb://192.168.110.104', 27017)
connection = MongoClient('192.168.110.104', 27017)
 
db = connection.animal
collection = db.shelter
 
collection.insert_many(tmplist)

print('저장 완료')




    

