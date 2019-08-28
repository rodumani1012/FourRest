package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.FundingLoadDto;

@Repository
public class FundingLoadDaoImpl implements FundingLoadDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FundingLoadDto> selectList() {
		
		List<FundingLoadDto> list = new ArrayList<FundingLoadDto>();
		
		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int insert(FundingLoadDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public Map<String, Object> select(String funtitle) {
		
		int funpayRes = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			funpayRes = sqlSession.selectOne(namespace + "select", funtitle);
			returnMap.put("funtitle", funtitle);
			returnMap.put("funpay", funpayRes);
		} catch (Exception e) {
			System.out.println("selecterror");
			e.printStackTrace();
		}
		return returnMap;
	}

	@Override
	public Map<String, Object> select1(String funtitle) {
		
		int funpayRes = 0;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			funpayRes = sqlSession.selectOne(namespace + "select1", funtitle);
			returnMap.put("funtitle", funtitle);
			returnMap.put("funcount", funpayRes);
		} catch (Exception e) {
			System.out.println("selecterror");
			e.printStackTrace();
		}
		return returnMap;
	}

	@Override
	public List<FundingLoadDto> paylist() {
		List<FundingLoadDto> paylist = null;
		try {
			paylist = sqlSession.selectList(namespace+"paylist");
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return paylist;
	}


}
