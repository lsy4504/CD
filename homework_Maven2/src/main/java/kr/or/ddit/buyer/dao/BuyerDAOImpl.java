package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import javax.management.RuntimeErrorException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;

public class BuyerDAOImpl implements IBuyerDAO {
	private static IBuyerDAO buyerDAO;
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
	public String insertBuyer(BuyerVO Buyer) {
		try {
			return (String)sqlMapClient.insert("Buyer.insertBuyer",Buyer);
			 } catch (SQLException e) {
				 throw new RuntimeException(e);
			 }
		
		
	}

	@Override
	public int updateBuyer(BuyerVO Buyer) {
		try {
				return sqlMapClient.update("Buyer.updateBuyer",Buyer);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		try {
			return 
					sqlMapClient.delete("Buyer.deleteBuyer", buyer_id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<BuyerVO> selectBuyerList(PagingInfoVO pagingVO) {
		try {
			return sqlMapClient.queryForList("Buyer.selectBuyerList", pagingVO);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		try {
				return (Long) sqlMapClient.queryForObject("Buyer.selectTotalRecord", pagingVO);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}

}
