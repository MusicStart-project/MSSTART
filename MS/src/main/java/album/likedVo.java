package album;

import util.CommonVo;

public class likedVo extends CommonVo {

	private int no;
	private int music_no;
	private int user_no;
	private int likedchecked;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMusic_no() {
		return music_no;
	}
	public void setMusic_no(int music_no) {
		this.music_no = music_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getLikedchecked() {
		return likedchecked;
	}
	public void setLikedchecked(int likedchecked) {
		this.likedchecked = likedchecked;
	}
	
}
