package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.CalendarDao;
import com.my.four.model.dto.CalendarDto;
import com.my.four.model.dto.VolmemberDto;

@Service
public class CalendarBizImpl implements CalendarBiz {
	
	@Autowired
	private CalendarDao dao;

	@Override
	public List<CalendarDto> selectList() {
		return dao.selectList();
	}

	@Override
	public CalendarDto selectOne(String caltitle) {
		return dao.selectOne(caltitle);
	}

	@Override
	public int volinsert(String caltitle, String id) {
		return dao.volinsert(caltitle, id);
	}
	
	@Override
	public int voldelete(String caltitle, String id) {
		return dao.voldelete(caltitle, id);
	}

	@Override
	public List<VolmemberDto> volList(String caltitle) {
		return dao.volList(caltitle);
	}																													

	@Override
	public int calinsert(CalendarDto dto) {
		return dao.calinsert(dto);
	}

	@Override
	public int caldelete(String caltitle, String id) {
		return dao.caldelete(caltitle, id);
	}

	@Override
	public int volupdate(String caltitle, String id) {
		return dao.volupdate(caltitle, id);
	}

}
