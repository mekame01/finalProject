package com.kh.ml.common.util.paging;

public class Paging {

	//입력받을 값
	private String type;	//페이징 처리할 항목
	private int currentPage;	//현재 페이지
	private int total;	//전체 게시물 수
	private int cntPerPage;	//페이지당 게시물 수
	private int blockCnt;	//하단에 표시될 페이지블록 개수
	private String sort;	//정렬 기준 컬럼
	private String direction;	//정렬 방향
	
	//계산할 값
	private int blockStart;	//시작 블록
	private int blockEnd;	//마지막 블록
	private int lastPage;	//마지막 페이지
	private int prev;	//이전 버튼
	private int next;	//다음 버튼
	
	//쿼리 between문에서 사용할 rownum 범위
	private int queryStart;
	private int queryEnd;
	
	public Paging(PagingBuilder pagingBuilder) {
		super();
		this.type = pagingBuilder.type;
		this.currentPage = pagingBuilder.currentPage;
		this.total = pagingBuilder.total;
		this.cntPerPage = pagingBuilder.cntPerPage;
		this.blockCnt = pagingBuilder.blockCnt;
		this.sort = pagingBuilder.sort;
		this.direction = pagingBuilder.direction;
		
		calBlockStartAndEnd();
		calQueryStartAndEnd();
		calPrevAndNext();
	}
	
	public static PagingBuilder builder() {
		return new PagingBuilder();
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public void setBlockCnt(int blockCnt) {
		this.blockCnt = blockCnt;
	}

	private void calLastPage() {
		lastPage = (total - 1)/cntPerPage + 1;
	}
	
	private void calBlockStartAndEnd() {
		calLastPage();	//마지막 페이지 계산
		blockStart = ((currentPage-1) / blockCnt) * blockCnt + 1;
		blockEnd = blockStart + blockCnt - 1;
		
		blockStart = blockStart < 1 ? 1 : blockStart;
		blockEnd = blockEnd > lastPage ? lastPage : blockEnd;
	}
	
	private void calQueryStartAndEnd() {
		queryEnd = currentPage * cntPerPage;
		queryStart = queryEnd - cntPerPage + 1;
	}
	
	private void calPrevAndNext() {
		prev = currentPage == 1 ? 1: currentPage - 1;
		next = currentPage == lastPage ? lastPage: currentPage + 1;
	}
	
	public static class PagingBuilder{
		//입력받을 값
		private String type;	//페이징 처리할 항목
		private int currentPage;	//현재 페이지
		private int total;	//전체 게시물 수
		private int cntPerPage;	//페이지당 게시물 수
		private int blockCnt;	//하단에 표시될 페이지블록 개수
		private String sort;	//정렬 기준 컬럼
		private String direction;	//정렬 방향

		public PagingBuilder type(String type) {
			this.type = type;
			return this;
		}
		
		public PagingBuilder currentPage(int currentPage) {
			this.currentPage = currentPage; 
			return this;
		}
		
		public PagingBuilder total(int total) {
			this.total = total; 
			return this;
		}
		
		public PagingBuilder cntPerPage(int cntPerPage) {
			this.cntPerPage = cntPerPage; 
			return this;
		}
		
		public PagingBuilder blockCnt(int blockCnt) {
			this.blockCnt = blockCnt; 
			return this;
		}
		
		public PagingBuilder sort(String sort) {
			this.sort = sort; 
			return this;
		}
		
		public PagingBuilder direction(String direction) {
			this.direction = direction; 
			return this;
		}
		
		public Paging build() {
			return new Paging(this);
		}

	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getType() {
		return type;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotal() {
		return total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public int getBlockCnt() {
		return blockCnt;
	}

	public int getBlockStart() {
		return blockStart;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getPrev() {
		return prev;
	}

	public int getNext() {
		return next;
	}

	public int getQueryStart() {
		return queryStart;
	}

	public int getQueryEnd() {
		return queryEnd;
	}

	@Override
	public String toString() {
		return "Paging [type=" + type + ", currentPage=" + currentPage + ", total=" + total + ", cntPerPage="
				+ cntPerPage + ", blockCnt=" + blockCnt + ", blockStart=" + blockStart + ", blockEnd=" + blockEnd
				+ ", lastPage=" + lastPage + ", prev=" + prev + ", next=" + next + ", queryStart=" + queryStart
				+ ", queryEnd=" + queryEnd + "]";
	}
	
}
