package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.ContestListDto;
@Repository
public class ContestListDaoImpl implements ContestListDao {
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public List<ContestListDto> selectList() {
      List<ContestListDto> list = new ArrayList<ContestListDto>();
      try {
         list = sqlSession.selectList(namespace+"selectlist");
      } catch (Exception e) {
         System.out.println("에러");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public int insert(ContestListDto dto) {
      System.out.println("들어왔니?");
      int res =0;
      try {
         res = sqlSession.insert(namespace+"insertlist",dto);
      } catch (Exception e) {
         System.out.println("에러");
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public int delete(int conlistno) {
      int res =0;
      try {
         res = sqlSession.delete(namespace+"delete",conlistno);
      } catch (Exception e) {
         System.out.println("에러");
         e.printStackTrace();
      }
      return res;
   }

   @Override
   public ContestListDto selectOne(int conlistno) {
      ContestListDto dto = null;
      try {
         dto = sqlSession.selectOne(namespace+"selectOne",conlistno);
      } catch (Exception e) {
         System.out.println("에러");
         e.printStackTrace();
      }
      return dto;
   }

   @Override
   public int updatepart(int conlistno) {
      int cnt = 0;
      cnt = sqlSession.update(namespace+"updatepart", conlistno);
      return cnt;
   }

   @Override
   public int concount() {
      int cnt =0;
      try {
         cnt = sqlSession.selectOne(namespace+"concount");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }

}