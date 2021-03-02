package album;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class likedDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public likedVo likedchecked(likedVo vo) {
		return sqlSession.selectOne("liked.likedchecked", vo);
	}
	
	public int insertliked(likedVo vo) {
		return sqlSession.insert("album.insertalbum",vo);
	}
	
	public int updateliked(likedVo vo) {
		return sqlSession.update("album.updatealbum", vo);
	}
	
}
