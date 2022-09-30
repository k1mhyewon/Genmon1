package minji.model;

import java.sql.SQLException;
import java.util.List;

import common.model.AddImgVO;

public interface InterImageDAO {
	
	// pnum을 가지고 상품 추가이미지들을 가져오는 메소드
	List<AddImgVO> selectAllImages(String pnum) throws SQLException;

}
