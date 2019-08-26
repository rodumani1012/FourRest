package com.my.four.model.biz;

import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FreecommentDto;

public interface FreeboardBiz {
	
	public List<FreeboardDto> freeboardList();
	public FreeboardDto freedetail(int free_seq);
	public int freeupdate(int free_seq, String title, String content);
	public int freedelete(int free_seq);
	public int freeinsert(FreeboardDto dto);
	public List<FreecommentDto> freecommentList(int free_seq);
	public int commentinsert(int free_seq, String user_id, String content);
	public int commdelete(int comm_seq);

}
