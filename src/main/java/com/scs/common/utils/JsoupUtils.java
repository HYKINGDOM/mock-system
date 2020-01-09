package com.scs.common.utils;

import com.google.common.base.Charsets;
import com.google.common.base.Splitter;
import com.google.common.io.Files;
import com.google.common.io.Resources;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.X509TrustManager;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.List;
import java.util.Random;

/**
 * @author yihur
 */
public class JsoupUtils {



    /**
     * UTF8 转换成 GB2312 用于拼接查询
     *
     * @param name
     * @return
     */
    public static String encodingSwitchToGbk(String name) {
        String str = null;
        StringBuilder stringBuilder = new StringBuilder();
        try {
            byte[] bytes = name.getBytes("GB2312");
            for (byte b : bytes) {
                String toHexString = Integer.toHexString(b);
                str = toHexString.substring(6, 8);
                stringBuilder.append("%").append(str.toUpperCase());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stringBuilder.toString();
    }


    /**
     * 设置查询的公共方法
     *
     * @param url
     * @return
     */
    public static Document getHtmlDocumentPost(String url) {
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


    /**
     * 截取网页URL后部的章节编码
     *
     * @param indexUrl
     * @return
     */
    public static String returnUrlSwitch(String indexUrl) {
        List<String> list = Splitter.on("/").omitEmptyStrings().trimResults().splitToList(indexUrl);
        return list.get(list.size() - 1).replace(".html", "");
    }


    /**
     * 中文章节名转换成int
     *
     * @param chineseNumber
     * @return
     */
    public static int chineseNumberSwitchInt(String chineseNumber) {
        chineseNumber = chineseNumber.substring(0, chineseNumber.indexOf("章"));
        int result = 0;
        //存放一个单位的数字如：十万
        int temp = 1;
        //判断是否有chArr
        int count = 0;
        char[] cnArr = new char[]{'零', '一', '二', '三', '四', '五', '六', '七', '八', '九'};
        char[] chArr = new char[]{'十', '百', '千', '万', '亿'};
        for (int i = 0; i < chineseNumber.length(); i++) {
            //判断是否是chArr
            boolean b = true;
            char c = chineseNumber.charAt(i);
            //非单位，即数字
            for (int j = 0; j < cnArr.length; j++) {
                if (c == cnArr[j]) {
                    //添加下一个单位之前，先把上一个单位值添加到结果中
                    if (0 != count) {
                        result += temp;
                        temp = 1;
                        count = 0;
                    }
                    // 下标+1，就是对应的值,加上零之后
                    temp = j;
                    b = false;
                    break;
                }
            }
            //单位{'十','百','千','万','亿'}
            if (b) {
                for (int j = 0; j < chArr.length; j++) {
                    if (c == chArr[j]) {
                        switch (j) {
                            case 0:
                                temp *= 10;
                                break;
                            case 1:
                                temp *= 100;
                                break;
                            case 2:
                                temp *= 1000;
                                break;
                            case 3:
                                temp *= 10000;
                                break;
                            case 4:
                                temp *= 100000000;
                                break;
                            default:
                                break;
                        }
                        count++;
                    }
                }
            }
            //遍历到最后一个字符
            if (i == chineseNumber.length() - 1) {
                result += temp;
            }
        }
        return result;
    }


    /**
     * 生成指定长度的随机数
     *
     * @param strLength
     * @return
     */
    public static Integer returnRadomInt(int strLength) {
        Random rm = new Random();
        // 获得随机数
        int press = (int) ((1 + rm.nextDouble()) * Math.pow(10, strLength));
        // 将获得的获得随机数转化为字符串
        String fixLengthString = String.valueOf(press);
        // 返回固定的长度的随机数
        String substring = fixLengthString.substring(1, strLength + 1);
        return Integer.valueOf(substring);
    }


    /**
     * 返回随机一个请求头
     *
     * @return
     */
    public static String returnUrlRequestHeard() {
        String requestUrlHeard = null;
        try {
            Random random = new Random();
            URL url = Resources.getResource("userAgents");
            File file = new File(url.getPath());
            List<String> strings = Files.readLines(file, Charsets.UTF_8);
            int size = strings.size();
            int i = random.nextInt(size) % (size + 1);
            requestUrlHeard = strings.get(i);
        } catch (IOException e) {
            e.getMessage();
        }
        return requestUrlHeard;
    }


    /**
     * 信任任何站点，实现https页面的正常访问
     */
    public static void trustEveryone() {
        try {
            HttpsURLConnection.setDefaultHostnameVerifier((hostname, session) -> true);
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, new X509TrustManager[]{new X509TrustManager() {
                @Override
                public void checkClientTrusted(X509Certificate[] chain, String authType) {
                }
                @Override
                public void checkServerTrusted(X509Certificate[] chain, String authType) {
                }
                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }
            }}, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(context.getSocketFactory());
        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            e.getMessage();
        }
    }
}
