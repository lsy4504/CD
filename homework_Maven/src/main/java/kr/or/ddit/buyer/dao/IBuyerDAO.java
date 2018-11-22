package kr.or.ddit.buyer.dao;

import java.util.List;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDAO {
	public BuyerVO selectBuyer(String buyer_id);
	public List<BuyerVO> selectBuyerList();
	public int insertBuyer(BuyerVO Buyer);
	public int updateBuyer(BuyerVO Buyer);
	public int deleteBuyer(String buyer_id);
}
