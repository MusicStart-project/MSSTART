package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	// 총갯수와 총페이지수를 구하는 메서드
	public int[] getRowPageCount(UserVo vo) {
		int totCount = userDao.count(vo); // 총갯수
		// 총페이지 수 = 총갯수/페이지당갯수, 만약 총갯수에서 페이지당갯수로 나눈 나머지가 있으면 +1
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		
		// 목록하단에 노출되는 페이지 범위 구하기
		// 시작페이지값 = (사용자가요청한페이지-1)/페이지당갯수*페이지당갯수+1
		int startpage = (vo.getReqPage()-1)/vo.getPageRow()*vo.getPageRow()+1;
		// 마지막페이지값 = 시작페이지-1+페이지당갯수
		int endpage = startpage-1+vo.getPageRow();
		if (endpage > totPage) endpage = totPage;
		
		int[] rowPageCount = new int[4];
		rowPageCount[0] = totCount;
		rowPageCount[1] = totPage;
		rowPageCount[2] = startpage;
		rowPageCount[3] = endpage;
		return rowPageCount;
	}
	
	// 목록을 구하는 메서드
	public List<UserVo> getList(UserVo vo) {
		// limit 시작값 = (사용자가 요청한 페이지번호 - 1) * 페이지당갯수
		//int startIdx = (vo.getReqPage() - 1) * vo.getPageRow();
		vo.setStartIdx((vo.getReqPage() - 1) * vo.getPageRow());
		return userDao.selectList(vo);
	}
	
	public UserVo selectOne(UserVo uv) {
		return userDao.selectOne(uv);
	}
	
	public boolean isDuplicateId(String id) {
		int cnt = userDao.isDuplicateId(id);
		if (cnt == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean insert(UserVo vo) {
		int r = userDao.insert(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean insertKakao(UserVo vo) {
		int r = userDao.insertKakao(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(UserVo vo) {
		int r = userDao.update(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(UserVo vo) {
		int r = userDao.delete(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public UserVo login(UserVo vo) {
		return userDao.login(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
}
