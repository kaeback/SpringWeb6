package com.spring.web6.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web6.vo.*;
/**
 * 게시판 관련 DAO
 */
@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 게시글 저장
	 * @param board 저장할 게시글 정바
	 */
	public int insert(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param boardnum 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null
	 */
	public Board get(int boardnum) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		// 해당 번호의 글 정보 읽기
		Board board = mapper.getBoard(boardnum);
		
		// 조회수 1 증가
		mapper.addHits(boardnum);
		
		return board;
	}
	
	/**
	 * 검색 결과 레코드 수
	 */
	public int getTotal(String searchText) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int total = mapper.getTotal(searchText);
		
		return total;
	}
	
	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param searchText 검색어
	 * @param startRecord 전체 결과 중 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 (한 페이지 당 글 개수)
	 * @return 글 목록
	 */
	public ArrayList<Board> listBoard(String searchText, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		// 전체 검색 결과 중 시작 위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		// 검색어와 읽을 범위를 전달
		ArrayList<Board> boardlist = mapper.listBoard(searchText, rb);
		
		return boardlist;
	}
	
	/**
	 * 글 번호로 해당 게시글 삭제
	 * @param 삭제할 글 번호와 로그인 아이디가 포함된 정보
	 * @return 삭제된 글 개수
	 */
	public int deleteBoard(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = mapper.deleteBoard(board);
		
		return result;
	}
	
	/**
	 * 게시글 수정
	 * @param board 수정할 글 정보
	 * @return 수정된 글 개수
	 */
	public int updateBoard(Board board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = mapper.updateBoard(board);
		
		return result;
	}
	
	/**
	 * 리플 저장
	 */
	public int insertReply(Reply reply) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 한 게시글의 리플 목록 읽기
	 * @param boardnum 본문 글 번호
	 * @return 리플 목록
	 */
	public ArrayList<Reply> listReply(int boardnum) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		ArrayList<Reply> replylist = mapper.listReply(boardnum);
		
		return replylist;
	}
	
	/**
	 * 리플 번호로 해당 리플 삭제
	 * @param reply 삭제할 리플 번호와 로그인 아이디가 포함된 정보
	 * @return 삭제된 리플 개수
	 */
	public int deleteReply(Reply reply) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = mapper.deleteReply(reply);
		
		return result;
	}
	
	/**
	 * 리플 수정
	 * @param reply 수정할 리플 정보
	 * @return 수정된 리플 개수
	 */
	public int updateReply(Reply reply) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int result = mapper.updateReply(reply);
		
		return result;
	}
}
