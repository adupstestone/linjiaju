package com.linjiaju.ocean.sys.utils;

import com.github.miemiedev.mybatis.paginator.support.PropertiesHelper;

/**
 * Created by Administrator on 14-3-25.
 * 系统常量类
 */
public class Constants {
    // 项目参数配置
    public static final PropertiesHelper projectProperties = new PropertiesUtils("ocean.properties");

    // 项目静态资源地址
    public static final String resourceUrl = projectProperties.getProperty("resourceUrl");

    // 项目首页地址
    public static final String indexPage = projectProperties.getProperty("indexPage");
}
