package album;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class likedService {
	
	
	@Autowired
	private likedDao likeddao;

	public likedVo selectOne(likedVo vo) {
	
		return likeddao.likedchecked(vo);
	}
	
	public boolean insert(likedVo vo) {
		int r = likeddao.insertliked(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(likedVo vo) {
		int r = likeddao.updateliked(vo);
		if (r > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}
