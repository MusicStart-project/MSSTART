package album;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class albumDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(albumVo vo) {
		return sqlSession.selectOne("album.count", vo);
	}
	
	public List<albumVo> selectList(albumVo vo) {
		return sqlSession.selectList("album.selectList", vo);
	}
	
	public albumVo selectOne(albumVo vo) {
		return sqlSession.selectOne("album.selectOne", vo);
	}
	
	public int insert(albumVo vo) {
		return sqlSession.insert("album.insertalbum",vo);
	}
	
	public int update(albumVo vo) {
		return sqlSession.update("album.updatealbum", vo);
	}
	
	public int delete(albumVo vo) {
		return sqlSession.delete("album.deletealbum", vo);
	}
	
	public void updateReadcount(int no) {
		sqlSession.update("album.updateReadcount",no);

	}
	
	
	
	
	
	
	
	
	
	
	
	
}
