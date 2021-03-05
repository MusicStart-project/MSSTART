package album;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class likedService {
	
	
	@Autowired
	private likedDao likeddao;
	
	
	
	public boolean insert(Map map) {
		
		int isliked = likeddao.likedchecked(map);
		
		if (isliked == 0) {
			
			int r = likeddao.insertliked(map);
		
			if (r > 0) {
				return true;
			} else {
				return false;
			}
		}
		else{
			int r = likeddao.delete(map);
			if (r > 0) {
				return true;
			} else {
				return false;
			}
		}
	}
}
