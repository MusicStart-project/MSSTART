package user;

import java.sql.Timestamp;

import util.CommonVo;

public class UserVo extends CommonVo{
	
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Timestamp regdate;
	private int kakao_id;
	private String user_img;
	private String user_img_org;
	
	public String getUser_img_org() {
		return user_img_org;
	}
	public void setUser_img_org(String user_img_org) {
		this.user_img_org = user_img_org;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public int getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(int kakao_id) {
		this.kakao_id = kakao_id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
