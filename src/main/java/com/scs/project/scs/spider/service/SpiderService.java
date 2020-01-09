package com.scs.project.scs.spider.service;

import com.github.pagehelper.PageInfo;
import com.scs.project.scs.spider.domain.BookChapter;
import com.scs.project.scs.spider.domain.BookInfo;

import java.util.List;

/**
 *
 * @author Administrator
 */
public interface SpiderService {

    /**
     * 查询书籍信息
     * @param bookInfo
     * @return
     */
    List<BookChapter> getBookContentInfoByBookIdAndChapter(BookInfo bookInfo);

    /**
     * 查询测试
     * @param bookInfo
     * @return
     */
    List<BookChapter> getTestBookContentInfoByBookIdAndChapter(BookInfo bookInfo);

    /**
     * 首页展示书籍信息
     * @param pageNum
     * @param pageSize
     * @param bookInfo
     * @return
     */
    PageInfo<BookInfo> getBookInfoHomePage(int pageNum, int pageSize, BookInfo bookInfo);

    /**
     * 定时任务方法
     * 查询网站首页推荐书籍入库
     */
    void getBookInfoUrl();

}
