package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeCount {
	
	private static final long ONE_MINUTE = 60000L;
    private static final long ONE_HOUR = 3600000L;
    private static final long ONE_DAY = 86400000L;
    private static final long ONE_WEEK = 604800000L;
 
    private static final String ONE_SECOND_AGO = "秒前";
    private static final String ONE_MINUTE_AGO = "分鐘前";
    private static final String ONE_HOUR_AGO = "小時前";
    private static final String ONE_DAY_AGO = "天前";
    private static final String ONE_MONTH_AGO = "月前";
    private static final String ONE_YEAR_AGO = "年前";
 
   public static void main(String[] args) throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = format.parse("2018-10-27 14:10:35");
        System.out.println(format(date));
        System.out.println(format("2020-02-27 01:10:35"));
    }
 
    public static String format(String dateTxt) throws Exception {
    	 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         Date date = format.parse(dateTxt);
        long delta = new Date().getTime() - date.getTime();
        if (delta < 1L * ONE_MINUTE) {
            long seconds = toSeconds(delta);
            return (seconds <= 0 ? 1 : seconds) + ONE_SECOND_AGO;
        }
        if (delta < 45L * ONE_MINUTE) {
            long minutes = toMinutes(delta);
            return (minutes <= 0 ? 1 : minutes) + ONE_MINUTE_AGO;
        }
        if (delta < 24L * ONE_HOUR) {
            long hours = toHours(delta);
            return (hours <= 0 ? 1 : hours) + ONE_HOUR_AGO;
        }
        if (delta < 48L * ONE_HOUR) {
            return "昨天";
        }
        if (delta < 30L * ONE_DAY) {
            long days = toDays(delta);
            return (days <= 0 ? 1 : days) + ONE_DAY_AGO;
        }
        if (delta < 12L * 4L * ONE_WEEK) {
            long months = toMonths(delta);
            return (months <= 0 ? 1 : months) + ONE_MONTH_AGO;
        } else {
            long years = toYears(delta);
            return (years <= 0 ? 1 : years) + ONE_YEAR_AGO;
        }
    }
    
    public static String format(Date date) {
    	long delta = new Date().getTime() - date.getTime();
    	if (delta < 1L * ONE_MINUTE) {
    		long seconds = toSeconds(delta);
    		return (seconds <= 0 ? 1 : seconds) + ONE_SECOND_AGO;
    	}
    	if (delta < 45L * ONE_MINUTE) {
    		long minutes = toMinutes(delta);
    		return (minutes <= 0 ? 1 : minutes) + ONE_MINUTE_AGO;
    	}
    	if (delta < 24L * ONE_HOUR) {
    		long hours = toHours(delta);
    		return (hours <= 0 ? 1 : hours) + ONE_HOUR_AGO;
    	}
    	if (delta < 48L * ONE_HOUR) {
    		return "昨天";
    	}
    	if (delta < 30L * ONE_DAY) {
    		long days = toDays(delta);
    		return (days <= 0 ? 1 : days) + ONE_DAY_AGO;
    	}
    	if (delta < 12L * 4L * ONE_WEEK) {
    		long months = toMonths(delta);
    		return (months <= 0 ? 1 : months) + ONE_MONTH_AGO;
    	} else {
    		long years = toYears(delta);
    		return (years <= 0 ? 1 : years) + ONE_YEAR_AGO;
    	}
    }
 
    private static long toSeconds(long date) {
        return date / 1000L;
    }
 
    private static long toMinutes(long date) {
        return toSeconds(date) / 60L;
    }
 
    private static long toHours(long date) {
        return toMinutes(date) / 60L;
    }
 
    private static long toDays(long date) {
        return toHours(date) / 24L;
    }
 
    private static long toMonths(long date) {
        return toDays(date) / 30L;
    }
 
    private static long toYears(long date) {
        return toMonths(date) / 365L;
    }
}