package com.my.four.model.dto;

public class EndanimalDto {
	
	private String sort;
	private String classify;
	private String korname;
	private String acaname;
	private String endemic;
	private String redlist;
	private String world;
	
	
	
	public EndanimalDto() {
		super();
	}



	public EndanimalDto(String sort, String classify, String korname, String acaname, String endemic, String redlist,
			String world) {
		super();
		this.sort = sort;
		this.classify = classify;
		this.korname = korname;
		this.acaname = acaname;
		this.endemic = endemic;
		this.redlist = redlist;
		this.world = world;
	}



	public String getSort() {
		return sort;
	}



	public void setSort(String sort) {
		this.sort = sort;
	}



	public String getClassify() {
		return classify;
	}



	public void setClassify(String classify) {
		this.classify = classify;
	}



	public String getKorname() {
		return korname;
	}



	public void setKorname(String korname) {
		this.korname = korname;
	}



	public String getAcaname() {
		return acaname;
	}



	public void setAcaname(String acaname) {
		this.acaname = acaname;
	}



	public String getEndemic() {
		return endemic;
	}



	public void setEndemic(String endemic) {
		this.endemic = endemic;
	}



	public String getRedlist() {
		return redlist;
	}



	public void setRedlist(String redlist) {
		this.redlist = redlist;
	}



	public String getWorld() {
		return world;
	}



	public void setWorld(String world) {
		this.world = world;
	}
	
	
	
}	
