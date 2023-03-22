package kr.co.vo;

public class Criteria {

	private int page;//현재 페이지
	private int perPageNum;//페이지당 글 갯수
	private int rowStart;//행 시작
	private int rowEnd;//행 끝
	
	public Criteria() {//기본 생성자
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {//현재 페이지 설정
		if (page <= 0) {//페이지가 0이면 1로 설정
			this.page = 1;
			return;
		}
		this.page = page;//현재 페이지
	}
	
	public void setPerPageNum(int perPageNum) {//페이지당 글 갯수
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {//현재 페이지 가져오기
		return page;
	}
	
	public int getPageStart() {//페이지 시작 가져오기
		return (this.page - 1) * perPageNum;
		// 현재 페이지가 1이면 (1-1) * 10 = 0
		// 현재 페이지가 2이면 (2-1) * 10 = 10
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum);
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = 10;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
	
	
}