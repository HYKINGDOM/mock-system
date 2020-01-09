package com.scs.project.scs.codereview.service.serviceimpl;

import com.github.pagehelper.PageInfo;
import com.scs.project.scs.codereview.domain.ScsHome;
import com.scs.project.scs.codereview.service.ScsService;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * @author Administrator
 */
@Service
public class ScsServiceImpl implements ScsService {
    @Override
    public PageInfo<ScsHome> getScsHomePageInfoPage(int pageNum, int pageSize, Map<String, String> scsHome) {

        if (!scsHome.containsKey("data")){
            throw new RuntimeException("参数为空");
        }
        return null;
    }
}
