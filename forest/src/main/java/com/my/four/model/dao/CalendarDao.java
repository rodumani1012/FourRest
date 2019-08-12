package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.CalendarDto;
import com.my.four.model.dto.VolmemberDto;

public interface CalendarDao {
	
	String namespace = "calendar.";

	public List<CalendarDto> selectList();
	public CalendarDto selectOne(String caltitle);
	public int volinsert(String caltitle, String id);
	public int voldelete(String caltitle, String id);
	public List<VolmemberDto> volList(String caltitle);
	public int calinsert(CalendarDto dto);
	public int caldelete(String caltitle, String id);
	public int volupdate(String caltitle, String id);
	public VolmemberDto volselectOne (String caltitle, String id);
	public int noticeupdate (String today);
	public int noticeupdate1 (List list);
	
}
