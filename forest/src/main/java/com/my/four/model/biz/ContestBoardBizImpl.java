package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.ContestBoardDao;
import com.my.four.model.dto.ContestBoardDto;
import com.my.four.model.dto.StarRecordDto;

@Service
public class ContestBoardBizImpl implements ContestBoardBiz {

   @Autowired
   private ContestBoardDao dao;

   @Override
   public StarRecordDto amialready(int usernum, int boardno) {
      // TODO Auto-generated method stub
      return dao.amialready(usernum, boardno);
   }

   @Override
   public int boardInsert(ContestBoardDto dto) {
      // TODO Auto-generated method stub
      return dao.boardInsert(dto);
   }

   @Override
   public int boardUpdate(ContestBoardDto dto) {
      // TODO Auto-generated method stub
      return dao.boardUpdate(dto);
   }

   @Override
   public int boardDelete(int groupno) {
      // TODO Auto-generated method stub
      return dao.boardDelete(groupno);
   }

   @Override
   public int boardDel(int boardno) {
      // TODO Auto-generated method stub
      return dao.boardDel(boardno);
   }

   @Override
   public int boardDeleteReply(int boardno) {
      // TODO Auto-generated method stub
      return dao.boardDeleteReply(boardno);
   }

   @Override
   public int getCount(int conlistno) {
      // TODO Auto-generated method stub
      return dao.getCount(conlistno);
   }

   @Override
   public int getTotalCount() {
      // TODO Auto-generated method stub
      return dao.getTotalCount();
   }

   @Override
   public int insertstarboard(StarRecordDto starDto) {
      // TODO Auto-generated method stub
      return dao.insertstarboard(starDto);
   }

   @Override
   public int insertAns(ContestBoardDto dto) {
      // TODO Auto-generated method stub
      return dao.insertAns(dto);
   }

   @Override
   public int likeCntup(int boardno) {
      // TODO Auto-generated method stub
      return dao.likeCntup(boardno);
   }

   @Override
   public int replyCntup(int boardno) {
      // TODO Auto-generated method stub
      return dao.replyCntup(boardno);
   }

   @Override
   public ContestBoardDto selectOne(int boardno) {
      // TODO Auto-generated method stub
      return dao.selectOne(boardno);
   }

   @Override
   public List<ContestBoardDto> selectThree(int conlistno) {
      // TODO Auto-generated method stub
      return dao.selectThree(conlistno);
   }

   @Override
   public List<ContestBoardDto> selectListReply(int groupno) {
      // TODO Auto-generated method stub
      return dao.selectListReply(groupno);
   }

   @Override
   public List<ContestBoardDto> selectList(int begin, int end) {
      // TODO Auto-generated method stub
      return dao.selectList(begin, end);
   }

   @Override
   public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end) {
      // TODO Auto-generated method stub
      return dao.selectListOption(conlistno, begin, end);
   }

   @Override
   public int updateStar(int boardno, int star) {
      ContestBoardDto dto = dao.selectOne(boardno);
      int cnt = dto.getLikecnt();
      double rate = dto.getLikerate();
      double newrate = (double)((cnt*rate)+star)/(cnt+1);
      return dao.updateStar(boardno, newrate);
   }

   @Override
   public int starProc(int usernum, int boardno, int newstar) {
      StarRecordDto starDto = null;
      int res =0;
      int result = 0;
      starDto = dao.amialready(usernum, boardno);
      if(starDto==null) {
         StarRecordDto inStarDto = new StarRecordDto(usernum,boardno,newstar); 
         res = dao.insertstarboard(inStarDto);
         result = updateStar(boardno,newstar);
      }else {
         int gustar = starDto.getStarrate();
         res = dao.updateStarboard(starDto);
         result = reupdateStar(boardno, newstar, gustar);
      }
      return res+result;
   }

   @Override
   public int reupdateStar(int boardno, int newstar, int gustar) {
      ContestBoardDto dto = dao.selectOne(boardno);
      int cnt = dto.getLikecnt();
      double rate = dto.getLikerate();
      double newrate = (cnt*rate-gustar+newstar)/(double)cnt;
            
      return dao.reupdateStar(boardno, newrate);
   }

   @Override
   public int ansProc(ContestBoardDto dto) {
      int parentno = dto.getBoardno();
      int res1 = dao.updateAns(parentno);
      int res2 = dao.insertAns(dto);
      return res1+res2;
   }

   @Override
   public int ansdel(int boardno) {
      return dao.ansdel(boardno);
   }

   @Override
   public int replyCntDown(int pboardno) {
      return dao.replyCntDown(pboardno);
   }



}