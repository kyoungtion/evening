package com.kh.evening.member.model.vo;

public class Member {
	
	private String Id;
	private String Name;
	private String Email;
	private String Pwd;
	private String ResidentNumber;
	private String Address;
	private String Phone;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String name, String email, String pwd, String residentNumber, String address,
			String phone) {
		super();
		Id = id;
		Name = name;
		Email = email;
		Pwd = pwd;
		ResidentNumber = residentNumber;
		Address = address;
		Phone = phone;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPwd() {
		return Pwd;
	}
	public void setPwd(String pwd) {
		Pwd = pwd;
	}
	public String getResidentNumber() {
		return ResidentNumber;
	}
	public void setResidentNumber(String residentNumber) {
		ResidentNumber = residentNumber;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	@Override
	public String toString() {
		return "Member [Id=" + Id + ", Name=" + Name + ", Email=" + Email + ", Pwd=" + Pwd + ", ResidentNumber="
				+ ResidentNumber + ", Address=" + Address + ", Phone=" + Phone + "]";
	}
	
	

}
