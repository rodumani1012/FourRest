package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.CalendarDto;
import com.my.four.model.dto.VolmemberDto;

public interface CalendarBiz {

	public List<CalendarDto> selectList();
	public CalendarDto selectOne(String caltitle);
	public List<VolmemberDto> volList(String caltitle);
	public int volinsert(String caltitle, String id);
	public int voldelete(String caltitle, String id);
	public int calinsert(CalendarDto dto);
	public int caldelete(String caltitle, String id);
	public int volupdate(String caltitle, String id);
	
}
