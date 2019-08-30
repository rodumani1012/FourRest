package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FreecommentDto;

public interface FreeboardDao {
	
	String namespace = "freeboard.";
	
	public List<FreeboardDto> freeboardList(int firstIndex,int recordCountPerPage, String category, String txt_search);
	public int freeboardGetTotalCount(String category, String txt_search);
	public FreeboardDto freedetail(int free_seq);
	public int freeupdate(int free_seq, String title, String content);
	public int freedelete(int free_seq);
	public int freeinsert(FreeboardDto dto);
	public List<FreecommentDto> freecommentList(int free_seq);
	public int commentinsert(int free_seq, String user_id, String content);
	public int commdelete(int comm_seq);
	
}
