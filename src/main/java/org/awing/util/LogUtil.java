package org.awing.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogUtil {
    private static final String LOG_TAG = "SSMStudent";
    private static Logger sLogger;
    private static Logger initLoggerIfNeed(String tag) {
        if (sLogger == null) {
            sLogger = LoggerFactory.getLogger(LOG_TAG);
        }
        if (!(tag == null || "".equals(tag))) {
            return LoggerFactory.getLogger(tag);
        }
        return sLogger;
    }
    public static void d(String tag, String msg, Throwable ex) {
        Logger logger = initLoggerIfNeed(tag);
        logger.debug(msg, ex);
    }

    public static void d(String tag, String msg) {
        Logger logger = initLoggerIfNeed(tag);
        logger.debug(msg);
    }

    public static void d(String msg) {
        d(null, msg);
    }
}
