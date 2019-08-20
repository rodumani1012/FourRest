# -*- coding:utf-8 -*-

from bs4 import BeautifulSoup
import urllib.request
from builtins import str

for i in range(1,2):
    resp = urllib.request.urlopen('http://www.animal.go.kr/portal_rnl/map/mapInfo2.jsp?s_date=&e_date=&s_upr_cd=&s_org_cd=&s_up_kind_cd=&s_kind_cd=&s_name=&pagecnt=' + str(i))
        
    soup = BeautifulSoup(resp, 'html.parser')
        
    centerList = soup.findAll('td')
        
    for centerOne in centerList:
        if len(centerOne.get_text()) < 1:
            continue
        else:
            print(centerOne.get_text())