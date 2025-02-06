package com.jcm.common.mybatis.controller;

import cn.hutool.http.HttpStatus;
import com.github.pagehelper.PageInfo;
import com.jcm.common.core.web.controller.BaseController;
import com.jcm.common.core.web.page.TableDataInfo;
import com.jcm.common.mybatis.utils.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * web层通用数据处理
 *
 * @author junchenmo
 */
public class PageBaseController extends BaseController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageUtils.startPage();
    }

    /**
     * 清理分页的线程变量
     */
    protected void clearPage() {
        PageUtils.clearPage();
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setRows(list);
        rspData.setMsg("查询成功");
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

}
