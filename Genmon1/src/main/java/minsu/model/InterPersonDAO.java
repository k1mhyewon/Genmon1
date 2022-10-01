package minsu.model;

import java.sql.SQLException;
import common.model.MemberVO;

public interface InterPersonDAO {

	// 회원가입을 해주는 매소드(tbl_member 테이블 insert)
	int registerMember(MemberVO member)throws SQLException;

	// 아이디가 중복되었는지 알아오는 메소드
	boolean idDuplicateCheck(String userid)throws SQLException;
	
	
	

}
