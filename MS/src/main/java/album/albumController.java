package album;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import user.UserService;
import user.UserVo;

// import album.CommentService;

@Controller
public class albumController {

	@Autowired
	private albumService albumService;
	@Autowired
	private likedService likedService;
	@Autowired
	private UserService userService;
	
	/*
	@Autowired
	private CommentService cService;
	*/
	
	@RequestMapping("/album/index.do")
	public String index(HttpServletRequest req, albumVo vo) {
		// 서비스(로직) 처리(호출)
		int[] rowPageCount = albumService.getRowPageCount(vo);
		List<albumVo> list = albumService.getList(vo);
		
		// 값 저장
		// totalPage, list, reqPage
		req.setAttribute("totalPage", rowPageCount[1]);
		req.setAttribute("startPage", rowPageCount[2]); // 시작페이지
		req.setAttribute("endPage", rowPageCount[3]); // 마지막페이지
		req.setAttribute("list", list);
		// /album/index.do?reqPage=2 -> albumVo에 reqPage 필드에 바인딩 (커맨드객체)
		// /album/index.do
		req.setAttribute("reqPage", vo.getReqPage());
		req.setAttribute("vo", vo);
		
		// jsp 포워딩
		return "album/index";
	}
	
	@RequestMapping("/album/detail.do")
	public String detail(HttpServletRequest req, albumVo vo) {
		
		albumVo uv = albumService.selectOne(vo, true);
		// List<CommentVo> clist = cService.getList(uv.getNo());
		
		req.setAttribute("vo", uv);
		//req.setAttribute("clist", clist);
		
		// jsp 포워딩
		return "album/detail";
	}
	
	@GetMapping("/album/write.do")
	public String write() {
		return "album/write";
	}
	
	@RequestMapping("/album/insert.do")
	public void insert(albumVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		// 등록처리
		//res.getWriter().print(albumService.insert(vo));
		
		// 파일을 저장
		if (!file.isEmpty()) { // 사용자가 첨부한 파일이 있으면
			try {
				String ext = "";
				if (file.getOriginalFilename().indexOf(".") > -1 ) { // 파일명에 . 이 포함되어있는 경우
					ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println(ext);
				}
				String filename = new Date().getTime()+ext;
					
				
				// request.getRealPath() -> 실제 경로를 리턴
				String path = req.getRealPath("/upload/");
				System.out.println(path);
				path = "C:\\git\\MS\\MS\\src\\main\\webapp\\upload\\";
				file.transferTo(new File(path+filename));
				// 파일명을 vo에 저장
				vo.setfilename(filename);
				vo.setfilename_org(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (albumService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/MS/album/index.do';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@RequestMapping("/album/edit.do")
	public String edit(HttpServletRequest req, albumVo vo) {
		
		albumVo uv = albumService.selectOne(vo,false);
		
		req.setAttribute("vo", uv);
		
		// jsp 포워딩
		return "album/edit";
	}
	
	@PostMapping("/album/update.do")
	public void update(albumVo vo, HttpServletResponse res, HttpServletRequest req, MultipartFile file) throws IOException {
		//res.getWriter().print(albumService.update(vo));
		// 파일을 저장
		if (!file.isEmpty()) { // 사용자가 첨부한 파일이 있으면
			try {
				String ext = "";
				if (file.getOriginalFilename().indexOf(".") > -1 ) { // 파일명에 . 이 포함되어있는 경우
					ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					System.out.println(ext);
				}
				String filename = new Date().getTime()+ext;
				// request.getRealPath() -> 실제 경로를 리턴
				String path = req.getRealPath("/upload/");
				System.out.println(path);
				//path = "D:\\AI\\workspace\\user\\src\\main\\webapp\\upload\\";
				file.transferTo(new File(path+filename));
				// 파일명을 vo에 저장
				vo.setfilename(filename);
				vo.setfilename_org(file.getOriginalFilename());
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (albumService.update(vo)) {
			out.print("alert('정상적으로 수정되었습니다.');");
			out.print("location.href='/user/album/detail.do?no="+vo.getNo()+"';");
		} else {
			out.print("alert('수정실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@GetMapping("/album/delete.do")
	public void delete(albumVo vo, HttpServletResponse res) throws IOException {
		res.getWriter().print(albumService.delete(vo));
	}
	
	@RequestMapping("/main.do")
	public String webgl(HttpServletRequest req, albumVo vo, likedVo lvo, HttpServletResponse res, HttpSession sess) throws IOException{
		UserVo uv = (UserVo)sess.getAttribute("authUser");
		if (uv != null) lvo.setUser_no(uv.getNo());
		List<albumVo> list = albumService.albumList(lvo);
		
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		req.setAttribute("lvo", lvo);

		
		return "album/main";
	}
	@RequestMapping("/main2.do")
	public String webgl2(HttpServletRequest req, albumVo vo, HttpServletResponse res, HttpSession sess, likedVo lvo) {
		
		UserVo uv = (UserVo)sess.getAttribute("authUser");
		if (uv != null) lvo.setUser_no(uv.getNo());
		List<albumVo> list = albumService.albumList(lvo);
		
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		req.setAttribute("lvo", lvo);
		
		return "album/main2";
	}
	
	@RequestMapping("/like.do")
	public void likedinsert(HttpServletRequest req, HttpServletResponse res) throws IOException{
			Map map = new HashMap();
			int music_no = Integer.parseInt(req.getParameter("music_no"));
			int user_no = Integer.parseInt(req.getParameter("user_no"));
			System.out.println("회원번호: "+user_no);
			System.out.println("음악번호: "+music_no);
			
			map.put("user_no", user_no);
			map.put("music_no", music_no);
			
			likedService.insert(map);
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req, albumVo vo, likedVo lvo, UserVo muvo, HttpServletResponse res, HttpSession sess) throws IOException{
		UserVo uv = (UserVo)sess.getAttribute("authUser");
		if (uv != null) lvo.setUser_no(uv.getNo());
		List<albumVo> list = albumService.mypageList(lvo);
		
		UserVo uservo = userService.selectOne(muvo);
		
		req.setAttribute("list", list);
		req.setAttribute("vo", vo);
		req.setAttribute("lvo", lvo);
		req.setAttribute("uv", uservo);
		
		return "album/mypage";
	}
/*	
	@RequestMapping("/album/commentInsert.do")
	public void commentInsert(CommentVo vo, HttpServletRequest req, HttpServletResponse res, MultipartFile file) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (cService.insert(vo)) {
			out.print("alert('정상적으로 등록되었습니다.');");
			out.print("location.href='/user/album/detail.do?no="+vo.getalbum_no()+"';");
		} else {
			out.print("alert('등록실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	@GetMapping("/album/commentDelete.do")
	public void commentDelete(CommentVo vo, HttpServletResponse res) throws IOException {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		if (cService.delete(vo.getNo())) {
			out.print("alert('정상적으로 삭제되었습니다.');");
			out.print("location.href='/user/album/detail.do?no="+vo.getalbum_no()+"';");
		} else {
			out.print("alert('삭제실패.');");
			out.print("history.back();");
		}
		out.print("</script>");
		out.flush();
	}
	
	*/
	
	
	
}
