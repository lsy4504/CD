package kr.or.ddit.prod.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.prod.dao.IProdDAO;
import kr.or.ddit.prod.dao.ProdDAOImpl;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	private IProdDAO dao;
	public static IProdService service;
	private ProdServiceImpl() {
		dao=ProdDAOImpl.getInstance();
	}
	public static IProdService getInstance() {
		if(service==null) {
			service= new ProdServiceImpl();
		}
		return service;
	}
	@Override
	public ServiceResult createProd(ProdVO prod) {
		String prod_id=dao.insertProd(prod);
		ServiceResult res=null;
		System.out.println(prod_id);
		if(prod_id==null) {
			res=ServiceResult.PKDUPLICATED;
		}else {
			res=ServiceResult.OK;
		}
		System.out.println(res);
		return res;
	}
	@Override
	public ProdVO retriveProd(String pord_id) {
		ProdVO prod=dao.selectProd(pord_id);
		if( prod==null)
		throw new CommonException(pord_id+"해당 상품 없!");
		return prod;
	}
	@Override
	public long retrieveProdCount(PagingInfoVO<ProdVO> pagingVO) {
		return dao.selectTotalRecord(pagingVO);
	}
	@Override
	public List<ProdVO> retrieveProdList(PagingInfoVO<ProdVO> paginVO) {
		return dao.selectProdList(paginVO);
	}
	@Override
	public ServiceResult modifyProd(ProdVO prod) {
		// TODO Auto-generated method stub
		return null;
	}
}
