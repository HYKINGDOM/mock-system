package com.scs.project.scs.spider.utils;

import com.scs.project.scs.spider.mapper.SpiderMapper;
import com.scs.project.scs.spider.domain.BookChapter;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

import static com.scs.common.utils.JsoupUtils.returnUrlRequestHeard;
import static com.scs.common.utils.JsoupUtils.trustEveryone;

/**
 * @author Administrator
 */
public class CrawlSrartService implements Runnable {


    @Autowired
    private SpiderMapper spiderMapper;

    private String bookAddressUrl;

    private String bookChapterAddress;

    private int index;


    public CrawlSrartService(String bookAddressUrl, String bookChapterAddress,int index) {

        this.bookAddressUrl = bookAddressUrl;
        this.bookChapterAddress = bookChapterAddress;
        this.index = index;
    }


    @Override
    public void run() {
        StringBuilder stringBuilder = new StringBuilder();
        BookChapter bookChapter = new BookChapter();

        stringBuilder.append(bookAddressUrl);
        bookChapter.setChapterNameNum(index);
        Document document = getHtmlDocument(stringBuilder.append(bookChapterAddress).toString());
        Element elementById = document.getElementById("contents");
        String textContext = elementById.text();
        bookChapter.setChapterContentNum(textContext.length());
        bookChapter.setChapterContent(textContext);
        System.out.println("第" + index + "章");
        spiderMapper.saveBookChapterOne(bookChapter);
    }


    /**
     * 设置查询的公共方法
     *
     * @param url
     * @return
     */
    private Document getHtmlDocument(String url) {
        Document document = null;
        try {
            trustEveryone();
            Connection connection = Jsoup.connect(url);
            connection.header("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8");
            connection.header("Content-Type", "application/x-www-form-urlencoded");
            connection.header("Accept-Encoding", "gzip, deflate, br");
            connection.header("Accept-Language", "zh-CN,zh;q=0.9");
            connection.header("Cache-Control", "max-age=0");
            connection.header("Connection", "keep-alive");
            connection.header("Host", "blog.maxleap.cn");
            connection.header("Upgrade-Insecure-Requests", "1");
            connection.header("User-Agent", returnUrlRequestHeard());
            document = connection.get();
        } catch (IOException e) {
            e.getMessage();
        }
        return document;
    }
}
