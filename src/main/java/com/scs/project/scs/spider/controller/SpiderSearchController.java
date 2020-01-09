package com.scs.project.scs.spider.controller;


import com.scs.common.utils.JsonUtils;
import com.scs.framework.web.controller.BaseController;
import com.scs.framework.web.domain.AjaxResult;
import com.scs.project.scs.spider.domain.BookChapter;
import com.scs.project.scs.spider.domain.BookInfo;
import com.scs.project.scs.spider.service.SpiderSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

/**
 * 爬虫模块的请求接口
 *
 * @author yihur
 */
@RestController
@RequestMapping(value = "/prod-api/search")
public class SpiderSearchController extends BaseController {

    @Autowired
    private SpiderSearchService spiderService;

    @PostMapping(value = "/getbookinfo")
    public AjaxResult getBookInfo(@RequestBody String bookName) {
        Map<String, String> map = JsonUtils.readValue(bookName, Map.class);
        List<BookInfo> bookChaptersList = null;
        try {
            if (map == null) {
                return AjaxResult.error("请出输入查询的书籍名");
            }
            bookChaptersList = spiderService.getBookContentInfoByBookIdAndChapter(map.get("bookName"));
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("==========getBookInfo error===========" + e.getMessage());
            return AjaxResult.error(e.getMessage());
        }
        return AjaxResult.success(bookChaptersList);
    }


    @PostMapping(value = "/testbookinfo")
    public Callable<List<BookInfo>> testBookInfo(@RequestBody String bookName) {
        Map<String, String> map = JsonUtils.readValue(bookName, Map.class);
        return () -> spiderService.getBookContentInfoByBookIdAndChapter(map.get("bookName"));
    }


    /**
     * 根据书籍信息查询 返回首章内容
     *
     * @param param
     * @return bookInfoCallable
     */
    @PostMapping(value = "/searchBookInfoReturnFirstChapterInfo")
    public Callable<BookChapter> searchBookInfoReturnFirstChapterInfo(@RequestBody String param) {
        BookInfo bookInfo = JsonUtils.readValue(param, BookInfo.class);
        return () -> spiderService.searchBookInfoReturnFirstChapterInfo(bookInfo);
    }

    /**
     * 根据书籍信息返回书籍章节目录返回
     *
     * @param param
     * @return Callable<List < Map < String, Object>>>
     */
    @PostMapping(value = "/searchBookInfoReturnChapterIndex")
    public Callable<List<Map<String, Object>>> searchBookInfoReturnChapterIndex(@RequestBody String param) {
        BookInfo bookInfo = JsonUtils.readValue(param, BookInfo.class);
        return () -> spiderService.searchBookInfoReturnChapterIndex(bookInfo);
    }

    /**
     * 根据书籍信息和章节内容返回
     *
     * @param param
     * @return bookInfoCallable
     */
    @PostMapping(value = "/searchBookInfoReturnAnyChapterInfo")
    public Callable<BookChapter> searchBookInfoReturnAnyChapterInfo(@RequestBody String param) {
        Map<String, Object> prams = JsonUtils.readValue(param, Map.class);
        if (param == null) {
            return null;
        }
        BookInfo bookInfo = JsonUtils.readValue(JsonUtils.toJSON(prams.get("data")), BookInfo.class);
        String chapterIndex = JsonUtils.readValue(JsonUtils.toJSON(prams.get("indexUrl")), String.class);
        return () -> spiderService.searchBookInfoReturnAnyChapterInfo(bookInfo, chapterIndex);
    }

}
