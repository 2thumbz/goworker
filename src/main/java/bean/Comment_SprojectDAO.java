package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.DisconnDB;
import oracle.OracleDB;

public class Comment_SprojectDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// ��ü comment �ҷ����� ���
	public int selectComment(Comment_SprojectDTO cdto) throws Exception {
		int result = 0;
		try { 
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_sproject where board_num=?");
			pstmt.setString(1, cdto.getComment_writerid());
			pstmt.setString(2, cdto.getComment_content());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	
	// ��� �Է� �� �� �Է�
	public int insertComment(Comment_SprojectDTO cdto) throws Exception {
		int comment_num = cdto.getComment_num();
		int comment_ref=cdto.getComment_ref(); // �� ���� �ϳ��� �׷��� ������.[�亯�� �޸�, �۰� �亯��  ref�� ����]
		int comment_step=cdto.getComment_step();   // �� �۰� ����� �����ϴ� �뵵(����)
		int comment_level=cdto.getComment_level();    // �׷� ��ۿ��� ����� �ۼ��� ����
		int number=0;
		String sql="";
		int result = 0;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select max(comment_num) from comment_sproject");
			rs=pstmt.executeQuery();
			
			if(rs.next())
					number=rs.getInt(1)+1;
				else
					number=1;
			if (comment_num != 0) {
				sql="update comment_sproject set comment_step=comment_step+1 where comment_ref=? and comment_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, comment_ref);
				pstmt.setInt(2, comment_step);
				pstmt.executeUpdate();
				comment_step=comment_step+1;
				comment_level=comment_level+1;
			} else {
				comment_ref=number;
				comment_step=0;
				comment_level=0;
			}
			
			sql = "insert into comment_sproject(comment_num,board_num,comment_writerid, comment_regdate,";
			sql += "comment_ref,comment_step,comment_level,comment_content) values(comment_smember_seq.NEXTVAL,?,?,sysdate,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cdto.getBoard_num());
			pstmt.setString(2, cdto.getComment_writerid());
			pstmt.setInt(3, comment_ref);
			pstmt.setInt(4, comment_step);
			pstmt.setInt(5, comment_level);
			pstmt.setString(6, cdto.getComment_content());
			result = pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();		
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	
	// ��� ����Ʈ ���
	public List<Comment_SprojectDTO> getComment(int board_num) throws Exception {
		List<Comment_SprojectDTO> list = null;
		try {
			conn = OracleDB.getConnection();
			pstmt = conn.prepareStatement("select * from comment_sproject where board_num=? order by comment_ref desc, comment_step asc");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while (rs.next()) {
				Comment_SprojectDTO cdto = new Comment_SprojectDTO();
				cdto.setComment_writerid(rs.getString("comment_writerid"));
				cdto.setComment_content(rs.getString("comment_content"));
				cdto.setComment_num(rs.getInt("comment_num"));
				cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
				cdto.setComment_ref(rs.getInt("comment_ref"));
				cdto.setComment_step(rs.getInt("comment_step"));
				cdto.setComment_level(rs.getInt("comment_level"));
				list.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisconnDB.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	
	// ����Ʈ ���� 
		public int getCount() {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select count(*) from comment_sproject");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		
		
		
		public Comment_SprojectDTO getComment(Comment_SprojectDTO cdto) {
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select * from comment_sproject where comment_num=?");
				pstmt.setInt(1, cdto.getComment_num());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					cdto.setComment_num(rs.getInt("comment_num"));
					cdto.setComment_writerid(rs.getString("comment_writerid"));
					cdto.setComment_content(rs.getString("comment_content"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return cdto;
		}
		
		
		
		
		// ��� ���� ���
		public int updateComment(Comment_SprojectDTO cdto) {
			int result = 0;
			try {
				conn = OracleDB.getConnection();
				String sql = ("update comment_sproject set comment_writerid=?, comment_content=? where comment_num=?");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cdto.getComment_writerid());
				pstmt.setString(2, cdto.getComment_content());
				pstmt.setInt(3, cdto.getComment_num());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		
		
		
		
		// ��� ���� ���
		public String deleteComment(int comment_num) {
			String result = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement("select comment_writerid from comment_sproject where comment_num=?" );
				pstmt.setInt(1, comment_num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getString("comment_writerid");
				}			
				pstmt = conn.prepareStatement("delete from comment_sproject where comment_num=? ");
				pstmt.setInt(1,comment_num);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				DisconnDB.close(conn, pstmt, rs);
			}
			return result;
		}
		
		
		
		
		
		// ��� ����¡ ó�� ��� (���� ��������� �ʽ��ϴ�.)
		public List getCommentReply(int start, int end) {
			List commentReplyList = null;
			try {
				conn = OracleDB.getConnection();
				pstmt = conn.prepareStatement(
						"select comment_num, board_num, comment_writerid, comment_content,comment_regdate,comment_ref, comment_step,comment_level,r"+
						"from(select comment_num, board_num, comment_writerid, comment_content,comment_regdate,comment_ref, comment_step,comment_level,rownum r"+
						"from(select comment_num, board_num, comment_writerid, comment_content,comment_regdate,comment_ref, comment_step,comment_level"+
						"from comment_sproject order by comment_ref desc, comment_step asc) order by comment_ref desc, comment_step asc) where r >= ? and r <= ? ");
						pstmt.setInt(1, start);
						pstmt.setInt(2, end);					
						rs = pstmt.executeQuery();
						if(rs.next()) {
							commentReplyList = new ArrayList(end);
							do {
								Comment_SprojectDTO cdto = new Comment_SprojectDTO();
								cdto.setComment_num(rs.getInt("comment_num"));
								cdto.setBoard_num(rs.getInt("board_num"));
								cdto.setComment_writerid(rs.getString("comment_writerid"));
								cdto.setComment_content(rs.getString("comment_content"));
								cdto.setComment_regdate(rs.getTimestamp("comment_regdate"));
								cdto.setComment_ref(rs.getInt("comment_ref"));
								cdto.setComment_step(rs.getInt("comment_step"));
								cdto.setComment_level(rs.getInt("comment_level"));
							} while(rs.next());
							
							}	
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					DisconnDB.close(conn, pstmt, rs);
				}
				return commentReplyList;
			}
		}
	
