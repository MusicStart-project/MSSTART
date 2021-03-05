package album;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class likedDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int likedchecked(Map map) {
		return sqlSession.selectOne("liked.likedcheck", map);
	}

	
	public int insertliked(Map map ) {
		return sqlSession.insert("liked.insertliked",map);
	}
	
	public int delete(Map map) {
		return sqlSession.delete("liked.deleteliked", map);
	}
	
}
