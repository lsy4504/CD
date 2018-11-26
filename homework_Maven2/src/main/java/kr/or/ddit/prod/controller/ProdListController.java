package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.prod.dao.IOtherDAO;
import kr.or.ddit.prod.dao.OtherDAOImpl;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ProdVO;

public class ProdListController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ProdVO searchVO= new ProdVO();
		searchVO.setProd_lgu(req.getParameter("prod_lug"));
		searchVO.setProd_buyer(req.getParameter("prod_buyer"));
		searchVO.setProd_name(req.getParameter("prod_name"));
		
		int currentPage=1;
		PagingInfoVO<ProdVO> pagingVO=new PagingInfoVO<ProdVO>(7,4);
		String page=req.getParameter("page");
		if(StringUtils.isNumeric(page)) {
			currentPage=Integer.parseInt(page) ;
		}
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSearchVO(searchVO);
		IProdService service= ProdServiceImpl.getInstance();
		IOtherDAO dao=OtherDAOImpl.getInstance();
		Map<String, String> lprodList= dao.selectLprodList();
		List<BuyerVO> buyerList= dao.selectBuyerList(null);
		req.setAttribute("lprodList", lprodList);
		req.setAttribute("buyerList", buyerList);
		pagingVO.setTotalRecord(service.retrieveProdCount(pagingVO));
		List<ProdVO> prodList=service.retrieveProdList(pagingVO);
		pagingVO.setDataList(prodList);
		req.setAttribute("pagingVO", pagingVO);
		
		String view = "prod/prodList";
		return view;
	}

}
