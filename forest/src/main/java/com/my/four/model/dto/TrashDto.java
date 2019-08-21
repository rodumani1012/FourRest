package com.my.four.model.dto;

public class TrashDto {

	private String imgRef;
	private String trashName;
	private String trashLife;
	
	public TrashDto() {
		// TODO Auto-generated constructor stub
	}

	public TrashDto(String imgRef, String trashName, String trashLife) {
		super();
		this.imgRef = imgRef;
		this.trashName = trashName;
		this.trashLife = trashLife;
	}

	public String getImgRef() {
		return imgRef;
	}

	public void setImgRef(String imgRef) {
		this.imgRef = imgRef;
	}

	public String getTrashName() {
		return trashName;
	}

	public void setTrashName(String trashName) {
		this.trashName = trashName;
	}

	public String getTrashLife() {
		return trashLife;
	}

	public void setTrashLife(String trashLife) {
		this.trashLife = trashLife;
	}
	
}
