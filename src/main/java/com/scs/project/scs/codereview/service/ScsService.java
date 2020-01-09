package com.scs.project.scs.codereview.service;

import com.github.pagehelper.PageInfo;
import com.scs.project.scs.codereview.domain.ScsHome;


import java.util.Map;

/**
 * @author Administrator
 */
public interface ScsService {


    PageInfo<ScsHome> getScsHomePageInfoPage(int pageNum, int pageSize, Map<String, String> scsHome);
}
