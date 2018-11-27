package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ProdVO;

public class ProdDAOImpl implements IProdDAO {
	private static IProdDAO dao;
	SqlMapClient sqlMapClient=null;
	private ProdDAOImpl() {
		sqlMapClient= CustomSqlMapClientBuilder.getSqlMapClient();
	}
	public static IProdDAO getInstance() {
		if(dao==null) {
			dao= new ProdDAOImpl();
		}
		return dao;
	}
	@Override
	public String insertProd(ProdVO prod) {
		try {
			return 
					(String) sqlMapClient.insert("Prod.insertProd",prod);
			//selectKet 엘리먼트에서 생성된 키값이 리턴값으로 돌아옴
			//다운 캐스팅시 셀렉트키의 리절트클래스타입으로 해줘야함
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public ProdVO selectProd(String prod_id) {
		try {
			return 
					(ProdVO) sqlMapClient.queryForObject("Prod.selectProd", prod_id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public long selectTotalRecord(PagingInfoVO<ProdVO> pagingVO) {
		try {
			return  (Long)sqlMapClient.queryForObject("Prod.selectTotalRecord",pagingVO); 
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	@Override
	public List<ProdVO> selectProdList(PagingInfoVO<ProdVO> pagingVO) {
		try {
			return sqlMapClient.queryForList("Prod.selectProdList", pagingVO);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public int updatePord(ProdVO prod) {
		// TODO Auto-generated method stub
		return 0;
	}
	
			
}
