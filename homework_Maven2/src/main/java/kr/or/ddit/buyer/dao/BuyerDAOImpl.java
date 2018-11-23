package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.BuyerVO;

public class BuyerDAOImpl implements IBuyerDAO {
	static IBuyerDAO buyerDAO;
	SqlMapClient sqlMapClient;

	private BuyerDAOImpl() {
		sqlMapClient = CustomSqlMapClientBuilder.getSqlMapClient();
	}

	public static IBuyerDAO getInstance() {
		if (buyerDAO == null) {
			buyerDAO = new BuyerDAOImpl();
		}
		return buyerDAO;
	}

	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		try {

			return (BuyerVO) sqlMapClient.queryForObject("Buyer.selectBuyer", buyer_id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public List<BuyerVO> selectBuyerList() {
		try {
			return sqlMapClient.queryForList("Buyer.selectBuyerList");
			 } catch (SQLException e) {
				 throw new RuntimeException(e);
			 }
	}

	@Override
	public int insertBuyer(BuyerVO Buyer) {
		try {
			return sqlMapClient.update("Buyer.insertBuyer",Buyer);
			 } catch (SQLException e) {
				 throw new RuntimeException(e);
			 }
		
		
	}

	@Override
	public int updateBuyer(BuyerVO Buyer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
