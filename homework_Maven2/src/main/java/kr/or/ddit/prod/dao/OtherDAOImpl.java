package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.BuyerVO;

public class OtherDAOImpl  implements IOtherDAO{
	private SqlMapClient sqlMapClient;
	private static IOtherDAO dao;
	private OtherDAOImpl() {
		sqlMapClient=CustomSqlMapClientBuilder.getSqlMapClient();
	}
	public static IOtherDAO getInstance() {
		if(dao==null) {
			dao=new OtherDAOImpl();
		}
		return dao;
	}
	
	
	@Override
	public Map<String, String> selectLprodList() {
		try {
			return 
					sqlMapClient.queryForMap("Other.selectLprodList", null, "LPROD_GU","LPROD_NM");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<BuyerVO> selectBuyerList(String buyer_lug) {
		try {
			return 
					sqlMapClient.queryForList("Other.selectBuyerList",buyer_lug );
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
