package com.coffeesazo;

public class Page {

	private int totalListSize;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int startNo;
	private int endNo;
	private int nowPage;
	private int listSize = 5;
	private int blockSize = 5;

	private String findStr;



	public Page() {

	}

	public Page(int totalListSize, int nowPage) {
		this.totalListSize = totalListSize;
		this.nowPage = nowPage;
	}

	public void pageCompute() {
		totalPage = (int)(Math.ceil(totalListSize/(double)listSize));
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;

		if (endNo > totalListSize) {
			endNo = totalListSize;
		}
		
		endPage = (int)(Math.ceil(nowPage/(double)blockSize))*blockSize;
		startPage = endPage - blockSize + 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

	}



	public int getTotalListSize() {
		return totalListSize;
	}

	public void setTotalListSize(int totalListSize) {
		this.totalListSize = totalListSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}


}
