package com.circular;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="trx_circulars")
public class CircularBean {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int circularId;
	
    private String circularNo,subject,category,fileLanguage,fileDescription,issuedOn,issuedBy;
    private String file;
    private Integer status = 1;
    private Date createdOn = new Date();
	public int getCircularId() {
		return circularId;
	}
	public void setCircularId(Integer circularId) {
		this.circularId = circularId;
	}
	
	public String getCircularNo() {
		return circularNo;
	}
	public void setCircularNo(String circularNo) {
		this.circularNo = circularNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFileLanguage() {
		return fileLanguage;
	}
	public void setFileLanguage(String fileLanguage) {
		this.fileLanguage = fileLanguage;
	}
	public String getFileDescription() {
		return fileDescription;
	}
	public void setFileDescription(String fileDescription) {
		this.fileDescription = fileDescription;
	}
	public String getIssuedOn() {
		return issuedOn;
	}
	public void setIssuedOn(String issuedOn) {
		this.issuedOn = issuedOn;
	}
	public String getIssuedBy() {
		return issuedBy;
	}
	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public CircularBean(String circularNo, String subject, String category, String fileLanguage,
			String fileDescription, String issuedOn, String issuedBy, String file, Integer status,
			Date createdOn) {
		super();
		this.circularNo = circularNo;
		this.subject = subject;
		this.category = category;
		this.fileLanguage = fileLanguage;
		this.fileDescription = fileDescription;
		this.issuedOn = issuedOn;
		this.issuedBy = issuedBy;
		this.file = file;
		this.status = status;
		this.createdOn = createdOn;
	}
	
	
	@Override
	public String toString() {
		return "CircularBean [circularId=" + circularId + ", circularNo=" + circularNo + ", subject=" + subject
				+ ", category=" + category + ", fileLanguage=" + fileLanguage + ", fileDescription=" + fileDescription
				+ ", issuedOn=" + issuedOn + ", issuedBy=" + issuedBy + ", file=" + file + ", status=" + status
				+ ", createdOn=" + createdOn + "]";
	}
	
	public CircularBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
    
    

}
