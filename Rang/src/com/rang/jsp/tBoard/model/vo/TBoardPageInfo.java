package com.rang.jsp.tBoard.model.vo;

import java.io.Serializable;

public class TBoardPageInfo implements Serializable{
	
	private int startPage; 
	private int endPage; 
	private int maxPage; 
	private int currentPage; 
	private int limitPage; 
	private int listCount;
	
	public TBoardPageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	@Override
	public String toString() {
		return "PageInfo [startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", currentPage="
				+ currentPage + ", limitPage=" + limitPage + ", listCount=" + listCount + "]";
	}



	public TBoardPageInfo(int startPage, int endPage, int maxPage, int currentPage, int limitPage, int listCount) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.currentPage = currentPage;
		this.limitPage = limitPage;
		this.listCount = listCount;
	}

	/**
	 * @return the startPage
	 */
	public int getStartPage() {
		return startPage;
	}

	/**
	 * @param startPage the startPage to set
	 */
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	/**
	 * @return the endPage
	 */
	public int getEndPage() {
		return endPage;
	}

	/**
	 * @param endPage the endPage to set
	 */
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	/**
	 * @return the maxPage
	 */
	public int getMaxPage() {
		return maxPage;
	}

	/**
	 * @param maxPage the maxPage to set
	 */
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the limitPage
	 */
	public int getLimitPage() {
		return limitPage;
	}

	/**
	 * @param limitPage the limitPage to set
	 */
	public void setLimitPage(int limitPage) {
		this.limitPage = limitPage;
	}

	/**
	 * @return the listCount
	 */
	public int getListCount() {
		return listCount;
	}

	/**
	 * @param listCount the listCount to set
	 */
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	
	
	

}
