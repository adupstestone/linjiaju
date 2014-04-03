package com.linjiaju.ocean.sys.utils;

import com.github.miemiedev.mybatis.paginator.support.PropertiesHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Administrator on 14-3-25.
 */
public class PropertiesUtils extends PropertiesHelper {
    private static final Logger logger = LoggerFactory.getLogger(PropertiesUtils.class);

    public PropertiesUtils(Properties p) {
        super(p);
    }

    public PropertiesUtils(Properties p, int systemPropertiesMode) {
        super(p, systemPropertiesMode);
    }

    public PropertiesUtils(String fileName) {
        super(PropertiesUtils.getPropertiesByFileName(fileName));
    }

    public PropertiesUtils(String fileName, int systemPropertiesMode) {
        super(PropertiesUtils.getPropertiesByFileName(fileName), systemPropertiesMode);
    }

    private static Properties getPropertiesByFileName(String fileName) {
        Properties p = new Properties();
        InputStream in = PropertiesUtils.class.getClassLoader().getResourceAsStream(fileName);
        try {
            p.load(in);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return p;
    }
}
