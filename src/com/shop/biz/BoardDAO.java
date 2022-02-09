package com.shop.biz;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.shop.model.BoardVO;
import com.shop.model.DBConn;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	
	public ArrayList<BoardVO> getBoardList() { 
		ArrayList<BoardVO> boardList = null;
		
        String sql = null;
		try {
			conn = DBConn.getConnection();			
            sql = "select * from  BOARD order by board_num desc";  
            stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			boardList = new ArrayList<BoardVO>();
			while(rs.next()) {
				//데이터베이스 테이블에서 반환된 결과세트를 각 컬럼별로 지역변수에 담기
				int board_num = rs.getInt("board_num");
				String board_id = rs.getString("board_id");
				String board_subject = rs.getString("board_subject");
				String board_content = rs.getString("board_content");
				String board_file = rs.getString("board_file");
				int board_re_ref = rs.getInt("board_re_ref");
				int board_re_lev = rs.getInt("board_re_lev");
				int board_re_seq = rs.getInt("board_re_seq");
				int board_count = rs.getInt("board_count");
				Date board_date = rs.getDate("board_date");
				
				//각 지역변수에 담긴 필드값을 VO에 담기
				BoardVO board = new BoardVO();
				board.setNum(board_num);
				board.setId(board_id);
				board.setSubject(board_subject);
				board.setContent(board_content);
				board.setFile(board_file);
				board.setRe_ref(board_re_ref);
				board.setRe_lev(board_re_lev);
				board.setRe_seq(board_re_seq);
				board.setCount(board_count);
				board.setDate(board_date);
				//VO에 담긴 데이터를 LIST에 담기
				boardList.add(board);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 되지 않았습니다.");
			e.printStackTrace();
		}  catch(SQLException e) {
			System.out.println("SQL 구문 또는 열이름, 변수명 등이 서로 맞지 않습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, conn);
		}
		//VO의 값을 LIST에 담은 결과를 반환
		return boardList;
	}
	
	public BoardVO getBoard(BoardVO vo) {
		BoardVO board = null;
		try {
			conn = DBConn.getConnection();
			String sql = "update board set board_count=board_count+1 where board_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getNum());
			int cnt = stmt.executeUpdate();
			stmt.close();
			if(cnt>0) {
				sql = "select * from board where board_num = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, vo.getNum());
				rs = stmt.executeQuery();
				if(rs.next()) {
					board = new BoardVO();
					board.setNum(rs.getInt("board_num"));
					board.setId(rs.getString("board_id"));
					board.setSubject(rs.getString("board_subject"));
					board.setContent(rs.getString("board_content"));
					board.setFile(rs.getString("board_file"));
					board.setRe_ref(rs.getInt("board_re_ref"));
					board.setRe_lev(rs.getInt("board_re_lev"));
					board.setRe_seq(rs.getInt("board_re_seq"));
					board.setCount(rs.getInt("board_count"));
					board.setDate(rs.getDate("board_date"));
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, conn);
		}
		return board;
	}
	
	public int insertBoard(BoardVO vo) {
		int cnt = 0;
		try {
			int num = this.getSeq();
			conn = DBConn.getConnection();
			String sql = "insert into board values (?,?,?,?,?,?,?,?,?,sysdate)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setString(2, vo.getId());
			stmt.setString(3, vo.getSubject());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getFile());
			stmt.setInt(6, num);
			stmt.setInt(7, 0);
			stmt.setInt(8, 0);
			stmt.setInt(9, 0);
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, conn);
		}
		return cnt;
	}
	
	public int updateBoard(BoardVO vo) {
		int cnt = 0;
		try {
			conn = DBConn.getConnection();
			String sql = "update board set board_subject=?, board_content=?, board_file=? where board_num=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getSubject());
			stmt.setString(2, vo.getContent());
			stmt.setString(3, vo.getFile());
			stmt.setInt(4, vo.getNum());

			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, conn);
		}
		return cnt;
	}
	
	public int deleteBoard(BoardVO vo) {
		int r = 0;
		try {
			conn = DBConn.getConnection();
			String sql = "delete from board where board_num=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getNum());
			r = stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 연결 오류");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 오류");
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, conn);
		}
		return r;
		
	}
	public int getSeq() {
        int result = 1;
        
        try {
        	conn = DBConn.getConnection();
            
            // 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT BOARD_NUM.NEXTVAL FROM DUAL");
            
            stmt = conn.prepareStatement(sql.toString());
            // 쿼리 실행
            rs = stmt.executeQuery();
            if(rs.next())    
            result = rs.getInt(1); 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        DBConn.close(stmt, conn);
        return result;    
    }

	 public int boardReplyInsert(BoardVO board) {
	      int cnt;
	      try {
	          conn = DBConn.getConnection();
	          String sql = "insert into board(board_num, board_id, board_subject, board_content, board_file, "
	          		+ "board_re_ref, board_re_lev, board_re_seq, board_count, board_date)"
	          		+ " values (?,?,?,?,?,?,?,?,?,sysdate)";
	          // 시퀀스 값을 글번호와 그룹번호로 사용
	          int num = board.getNum();
	          stmt = conn.prepareStatement(sql.toString());
	          stmt.setInt(1, num);
	          stmt.setString(2, board.getId());
	          stmt.setString(3, board.getSubject());
	          stmt.setString(4, board.getContent());
	          stmt.setString(5, board.getFile());
	          
	          if(board.getRe_seq()==0) {// re_seq==0 은 답변글이 없는경우, 즉 부모글일경우    
	              stmt.setInt(6, num);    
	          } else {
	              stmt.setInt(6, board.getRe_ref());
	          }
	          stmt.setInt(7, board.getRe_lev());
	          stmt.setInt(8, board.getRe_seq());
	          stmt.setInt(9, 0);
	          cnt = stmt.executeUpdate();          
	      } catch (Exception e) {
	          throw new RuntimeException(e.getMessage());
	      } finally {
	    	  DBConn.close(stmt, conn);
	      }
	      return cnt;    
	  }
	 
	 //게시글 수정 페이지를 불러오기
	 public BoardVO getDetail(BoardVO vo)  {    
	        BoardVO board = null;
	        String sql;
	        try {
	            conn = DBConn.getConnection();         
	            sql = "select * from board where board_num = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, vo.getNum());  
	            rs = stmt.executeQuery();
	            if(rs.next()) {
	                board = new BoardVO();
	                board.setNum(rs.getInt("board_num"));
					board.setId(rs.getString("board_id"));
					board.setSubject(rs.getString("board_subject"));
					board.setContent(rs.getString("board_content"));
					board.setFile(rs.getString("board_file"));
					board.setRe_ref(rs.getInt("board_re_ref"));
					board.setRe_lev(rs.getInt("board_re_lev"));
					board.setRe_seq(rs.getInt("board_re_seq"));
					board.setCount(rs.getInt("board_count"));
					board.setDate(rs.getDate("board_date"));
	            }       
	        } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	        } finally {
				DBConn.close(rs, stmt, conn);
			}
	        
	        return board;
	 }
	 
	 public String getFileName(int boardNum) {
	        String fileName = null;
	        String sql;
	        try {
	            conn = DBConn.getConnection();
	            
	            sql = "SELECT BOARD_FILE from BOARD where BOARD_NUM=?";
	            
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, boardNum);
	            
	            rs = stmt.executeQuery();
	            if(rs.next()) fileName = rs.getString("BOARD_FILE");
	            
	        } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	        } finally {
				DBConn.close(rs, stmt, conn);
			}        
	        return fileName;
	    } 

		public int deleteBoard(int boardNum) {
			int cnt=0;
			try {
				conn = DBConn.getConnection();
				String sql = "delete from board where board_num=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, boardNum);
				cnt = stmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				DBConn.close(stmt, conn);
			}
			return cnt;
		}
}
