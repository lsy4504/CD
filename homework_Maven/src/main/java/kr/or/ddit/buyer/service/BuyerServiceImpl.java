package kr.or.ddit.buyer.service;

import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;

public class BuyerServiceImpl implements IBuyerService{
	IBuyerDAO buyerDAO;
	static IBuyerService service;
	
	private BuyerServiceImpl() {
		buyerDAO=BuyerDAOImpl.getInstance();
	}
	
	public static IBuyerService getInstance() {
		if(service==null) {
			service=new BuyerServiceImpl();
		}
		return service;
	}
	
}
