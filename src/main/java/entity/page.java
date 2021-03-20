package entity;

import java.util.List;

public class page {
    private List<donation> donationList;
    private int totalNum;
    private int pageNo;
    private int totalPages;
    private int pageSize=4;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public page() {
    }

    public List<donation> getDonationList() {
        return donationList;
    }

    public void setDonationList(List<donation> donationList) {
        this.donationList = donationList;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getTotalPages() {
        return (totalNum%pageSize)==0?(totalNum/pageSize):(totalNum/pageSize+1);
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getFirstPage(){
        return 1;
    }
    public int getLastPage(){
        return getTotalPages();
    }
    public int getPrePage(){
        return pageNo<=1?1:(pageNo-1);
    }
    public int getNextPage(){
        int total=getTotalPages();
        return pageNo>=total?total:(pageNo+1);
    }
}
