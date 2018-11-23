package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.db.ConnetionFactory;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl_Simple implements IMemeberDAO {

	static {

	}

	@Override
	public MemberVO selectMember(String mem_id) {
		MemberVO memberVO = null;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT                                              ");
		sql.append("MEM_ID, MEM_PASS, MEM_NAME, MEM_REGNO1,MEM_REGNO2,  ");
		sql.append("TO_CHAR(MEM_BIR,'YYYY-MM-DD') MEM_BIR, MEM_ZIP, MEM_ADD1,MEM_ADD2,MEM_HOMETEL,    ");
		sql.append("MEM_COMTEL,MEM_HP,MEM_MAIL,MEM_JOB,MEM_LIKE,        ");
		sql.append("MEM_MEMORIAL,TO_CHAR(MEM_MEMORIALDAY, 'YYYY-MM-DD') MEM_MEMORIALDAY ,MEM_MILEAGE,           ");
		sql.append("MEM_DELETE                                          ");
		sql.append("FROM   MEMBER                                          ");

		sql.append("WHERE  MEM_ID=?   ");
		try (Connection conn = ConnetionFactory.getConnetion();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) 
		{
			pstmt.setString(1, mem_id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVO= new MemberVO();
				memberVO.setMem_id(rs.getString ("MEM_ID"));
				memberVO.setMem_pass(rs.getString ("MEM_PASS"));
				memberVO.setMem_name(rs.getString ("MEM_NAME"));
				memberVO.setMem_regno1(rs.getString ("MEM_REGNO1"));
				memberVO.setMem_regno2(rs.getString ("MEM_REGNO2"));
				memberVO.setMem_bir(rs.getString ("MEM_BIR"));
				memberVO.setMem_zip(rs.getString ("MEM_ZIP"));
				memberVO.setMem_add1(rs.getString ("MEM_ADD1"));
				memberVO.setMem_add2(rs.getString ("MEM_ADD2"));
				memberVO.setMem_hometel(rs.getString ("MEM_HOMETEL"));
				memberVO.setMem_comtel(rs.getString ("MEM_COMTEL"));
				memberVO.setMem_hp(rs.getString ("MEM_HP"));
				memberVO.setMem_mail(rs.getString ("MEM_MAIL"));
				memberVO.setMem_job(rs.getString ("MEM_JOB"));
				memberVO.setMem_like(rs.getString ("MEM_LIKE"));
				memberVO.setMem_memorial(rs.getString ("MEM_MEMORIAL"));
				memberVO.setMem_memorialday(rs.getString ("MEM_MEMORIALDAY"));
				memberVO.setMem_mileage(rs.getLong ("MEM_MILEAGE"));
			}
			return memberVO;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertMeber(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteMember(String mem_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return 0;
	}
}
