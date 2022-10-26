package jieun.model;

import java.sql.SQLException;
import java.util.*;


public interface InterProductDAO {

	
	// 전체 상품갯수 
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 한 페이지마다 나오는 상품들 select 
	List<ChildProductVO> selectPagingProduct(Map<String, String> paraMap) throws SQLException;

	// 등록된 컬러네임들 뿌려주기 
	List<HashMap<String, String>> selectAllColors() throws SQLException;

	// 등록된 재질명들 뿌려주기 
	List<HashMap<String, String>> selectAllMaterials() throws SQLException;

	// 제품 부모테이블 pid, 제품 자식테이블 pnum 채번해오기 
	String getPidParentProduct() throws SQLException;
	int getPnumChildProduct() throws SQLException;

	// 부모제품 insert
	int insertParentProduct(ParentProductVO ppvo) throws SQLException;
	
	// 자식제품 insert
	int insertChildProduct(ChildProductVO cpvo) throws SQLException;

	// 상품상세이미지 insert
	int insetProdDetailimage(String imgfilename, int pnum) throws SQLException;

	// pname 뿌려주기 
	List<String> isExistPname() throws SQLException;

	// pname 으로 pid 찾기
	String findPidParentProduct(String pname) throws SQLException;

	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
	ChildProductVO selectOneProductByPnum(String pnum) throws SQLException;

	// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
	List<String> getImagesByPnum(String pnum) throws SQLException;

	// 상품 판매상태 중지로 변경 update
	int updateProdStopState(String pnum)throws SQLException;

	// pname 으로 부모상품테이블에서 정보 select 
	ParentProductVO selectPnameInfo(String pname) throws SQLException;



}
