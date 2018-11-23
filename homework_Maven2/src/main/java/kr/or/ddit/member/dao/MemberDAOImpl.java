package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl implements IMemeberDAO {
	SqlMapClient sqlMapClinet;
	static IMemeberDAO memeberDAO;

	private MemberDAOImpl() {
		sqlMapClinet = CustomSqlMapClientBuilder.getSqlMapClient();
	}

	public static IMemeberDAO getInstance() {
		if (memeberDAO == null) {
			memeberDAO = new MemberDAOImpl();
		}
		return memeberDAO;
	}

	@Override
	public MemberVO selectMember(String mem_id) {
		try {
			MemberVO member = (MemberVO) sqlMapClinet.queryForObject("Member.selectMember", mem_id);
			return member;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
		try {
			List<MemberVO> memberList = sqlMapClinet.queryForList("Member.selectMemberList",pagingVO);
			return memberList;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int insertMeber(MemberVO member) {
		try {

			return sqlMapClinet.update("Member.insertMember", member);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateMember(MemberVO member) {
		try {
			return 
				 sqlMapClinet.update("Member.updateMember", member);
			 } catch (SQLException e) {
				 throw new RuntimeException(e);
			 }
	}

	@Override
	public int deleteMember(String mem_id) {
		try {
				 
				 return sqlMapClinet.delete("Member.deleteMember", mem_id);
			 } catch (SQLException e) {
				 throw new RuntimeException(e);
			 }
	}
	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		try {
			return (Long)sqlMapClinet.queryForObject("Member.selectTotalRecord",pagingVO);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
