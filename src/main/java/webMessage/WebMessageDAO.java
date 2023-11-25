package webMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.review.ReviewVO;
import common.GetConn;
import pds.PdsVO;

public class WebMessageDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	WebMessageVO vo = null;
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

	// 메세지 리스트(전체메세지(신규/읽은메세지)/새메세지/보낸메세지/휴지통)
	public ArrayList<WebMessageVO> getMessageList(String mid, int mSw) {
		ArrayList<WebMessageVO> vos = new ArrayList<WebMessageVO>();
		try {
			if(mSw == 1) {	// 받은 메세지(전체메세지(새메세지+읽은메세지))
				sql = "select *, timestampdiff(hour,sendDate, now()) as hour_diff from webMessage where receiveId=? and (receiveSw='n' or receiveSw='r') order by idx desc";
			}
			else if(mSw == 2)	{ // 새메세지
				sql = "select *, timestampdiff(hour,sendDate, now()) as hour_diff from webMessage where receiveId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 3)	{ // 보낸 메세지
				sql = "select *, timestampdiff(hour,sendDate, now()) as hour_diff from webMessage where sendId=? and sendSw='s' order by idx desc";
			}
			else if(mSw == 4)	{ // 수신확인
				sql = "select *, timestampdiff(hour,sendDate, now()) as hour_diff from webMessage where sendId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 5)	{ // 휴지통
				sql = "select *, timestampdiff(hour,sendDate, now()) as hour_diff from webMessage where (receiveId=? and receiveSw='g') or (sendId=? and sendSw='g') order by idx desc";
			}
			else {	// mSw 가 0일때는 새로운 메세지 작성처리이다.
				return vos;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			if(mSw == 5) {
				pstmt.setString(2, mid);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new WebMessageVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));
				
				vo.setHour_diff(rs.getShort("hour_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 웹 메세지 작성처리
	public int setWmInputOk(WebMessageVO vo) {
		int res = 0;
		try {
			sql = "insert into webMessage values (default,?,?,?,'s',default,?,'n',default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getSendId());
			pstmt.setString(4, vo.getReceiveId());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

}
