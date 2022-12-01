package utils;

/**
 * 分页返回的数据对象
 */
public class PagerResult {
    private int pageIndex; //当前页数
    private int pageCount;//每页显示的数量
    private int dataCount;//总数量
    private int pageNum; //总页数
    private Object data;

    public PagerResult(){

    }

    public PagerResult(int pageIndex, int pageCount, int dataCount, int pageNum, Object data) {
        this.pageIndex = pageIndex;
        this.pageCount = pageCount;
        this.dataCount = dataCount;
        this.pageNum = pageNum;
        this.data = data;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getDataCount() {
        return dataCount;
    }

    public void setDataCount(int dataCount) {
        this.dataCount = dataCount;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "PagerResult{" +
                "pageIndex=" + pageIndex +
                ", pageCount=" + pageCount +
                ", dataCount=" + dataCount +
                ", pageNum=" + pageNum +
                ", data=" + data +
                '}';
    }
}
