package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import kr.or.ddit.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl implements IMemeberDAO {
	static IMemeberDAO memeberDAO;
	private SqlSessionFactory sqlSessionFactory;

	private MemberDAOImpl() {
		sqlSessionFactory=CustomSqlSessionFactoryBuilder.getSqlSessionFactory();
	}

	public static IMemeberDAO getInstance() {
		if (memeberDAO == null) {
			memeberDAO = new MemberDAOImpl();
		}
		return memeberDAO;
	}

	@Override
	public MemberVO selectMember(String mem_id) {
		try(
				SqlSession session= sqlSessionFactory.openSession();
		) {
			IMemeberDAO mapper= session.getMapper(IMemeberDAO.class);
			return mapper.selectMember(mem_id);
		} 
	}

	@Override
	public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
		try(
				SqlSession session= sqlSessionFactory.openSession();
		){
//			return 
//			session.selectList("kr.or.ddit.member.dao.IMemeberDAO.selectMemberList",pagingVO);
			IMemeberDAO mapper=session.getMapper(IMemeberDAO.class);
			return mapper.selectMemberList(pagingVO);
		}
	}

	@Override
	public int insertMember(MemberVO member) {
		try(
				SqlSession session= sqlSessionFactory.openSession();
				){
			IMemeberDAO mapper= session.getMapper(IMemeberDAO.class);
			int cnt =mapper.insertMember(member);
			if(cnt>0)
			session.commit();
			return cnt;
		}
	}

	@Override
	public int updateMember(MemberVO member) {
		try(
			SqlSession session = sqlSessionFactory.openSession();
				){
			
			IMemeberDAO mapper= session.getMapper(IMemeberDAO.class);
			int cnt=mapper.updateMember(member);
			if(cnt>0)session.commit();
			return cnt;
		}
	}

	@Override
	public int deleteMember(String mem_id) {
		try(
				SqlSession session = sqlSessionFactory.openSession();
				){
			
			IMemeberDAO mapper= session.getMapper(IMemeberDAO.class);
			int cnt=mapper.deleteMember(mem_id);
			if(cnt>0)session.commit();
			return  cnt;
		}
	}

	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		try (
				SqlSession session= sqlSessionFactory.openSession();
				
			){
//			return 
//			session.selectOne("kr.or.ddit.member.dao.IMemeberDAO.selectTotalRecord",pagingVO);
			IMemeberDAO mapper=	session.getMapper(IMemeberDAO.class);
			return mapper.selectTotalRecord(pagingVO);
					
		} 
	}

	
}
