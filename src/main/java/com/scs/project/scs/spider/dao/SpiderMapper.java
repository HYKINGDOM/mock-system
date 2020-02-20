package com.scs.project.scs.spider.dao;

import com.scs.project.scs.spider.domain.BookChapter;
import com.scs.project.scs.spider.domain.BookInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Administrator
 */
@Mapper
public interface SpiderMapper {


    /**
     * 保存书籍信息
     * @param bookInfo
     * @return
     */
    void saveBookInfoData(BookInfo bookInfo);

    /**
     * 批量保存书籍信息
     * @param bookInfos
     */
    void saveBookInfoDataLists(List<BookInfo> bookInfos);

    /**
     * 保存书籍内容
     * @param bookChapter
     */
    void saveBookChapter(List<BookChapter> bookChapter);

    /**
     * 保存书籍内容
     * @param bookChapter
     */
    void saveBookChapterOne(BookChapter bookChapter);


    /**
     * 根据书籍章节内容信息查询
     * @param bookInfo
     * @return
     */
    List<BookChapter> getBookContentInfoByBookIdAndChapter(BookInfo bookInfo);

    /**
     * 查询书籍信息
     * @param bookInfo
     * @return
     */
    List<BookInfo> selectBookInfoData(BookInfo bookInfo);

}
