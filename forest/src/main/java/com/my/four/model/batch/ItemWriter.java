package com.my.four.model.batch;

import java.util.List;

import com.my.four.model.dto.LoginDto;

public class ItemWriter implements org.springframework.batch.item.ItemWriter<LoginDto>{

	@Override
	public void write(List<? extends LoginDto> items) throws Exception {
		LoginDto dto = new LoginDto();
		System.out.println("id"+dto.getId());
	}

}
