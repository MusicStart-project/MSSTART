package album;



import util.CommonVo;

public class albumVo extends CommonVo {

	private int no;					// 노래 번호
	private String title;			// 노래 제목
	private String Lyrics;			// 가사
	private String Musicname; 		// 서버에 저장될 파일명
	private String Musicname_org;
	private int A_no;// 사용자가 업로드한 원본파일명
	
	public albumVo() {
		// 부모에서 초기값으로 10을 대입했지만, 자식에서 5로 변경
		// 부모객체가 먼저 생성되고 나서, 자식 객체가 생성되기 때문에
		//this.setPageRow(5);
	}
	public int getA_no() {
		return A_no;
	}

	public void setA_no(int a_no) {
		A_no = a_no;
	}

	public String getMusicname_org() {
		return Musicname_org;
	}

	public void setMusicname_org(String Musicname_org) {
		this.Musicname_org = Musicname_org;
	}

	public String getMusicname() {
		return Musicname;
	}

	public void setMusicname(String Musicname) {
		this.Musicname = Musicname;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLyrics() {
		return Lyrics;
	}
	// contentLine -> getContentLine()
	public String getLyricsLine() {
		return Lyrics.replace("\n", "<br>");
	}
	public void setLyrics(String Lyrics) {
		this.Lyrics = Lyrics;
	}
	
}
