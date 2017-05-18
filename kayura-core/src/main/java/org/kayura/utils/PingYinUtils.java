/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 * @author liangxia@live.com
 */
public class PingYinUtils {
    
    private static Map<String, List<String>> pinyinMap = new HashMap<String, List<String>>();
    private static Boolean initialized = false;
    
    private static synchronized void init() {
	
	if (!initialized) {
	    
	    // 读取多音字的全部拼音表;
	    String fileName = "duoyindic.txt";
	    
	    InputStream file = PingYinUtils.class.getResourceAsStream(fileName);
	    BufferedReader br = new BufferedReader(new InputStreamReader(file));
	    
	    String s = null;
	    try {
		while ((s = br.readLine()) != null) {
		    if (s != null) {
			String[] arr = s.split("#");
			String pinyin = arr[0];
			String chinese = arr[1];
			
			if (chinese != null) {
			    String[] strs = chinese.split(" ");
			    List<String> list = Arrays.asList(strs);
			    pinyinMap.put(pinyin, list);
			}
		    }
		}
	    } catch (IOException e) {
		e.printStackTrace();
	    } finally {
		try {
		    br.close();
		} catch (IOException e) {
		    e.printStackTrace();
		}
	    }
	    
	    initialized = true;
	}
    }
    
    private static String convertInitialToUpperCase(String str) {
	if (str == null) {
	    return null;
	}
	StringBuffer sb = new StringBuffer();
	char[] arr = str.toCharArray();
	for (int i = 0; i < arr.length; i++) {
	    char ch = arr[i];
	    if (i == 0) {
		sb.append(String.valueOf(ch).toUpperCase());
	    } else {
		sb.append(ch);
	    }
	}
	
	return sb.toString();
    }
    
    /**
     * 将一组汉字字符串转换成首字母大写的全拼字符串,若需要拼音首字母请使用方法getUpperCase获取.
     * 
     * @param chinese 汉字字符串.
     * @return 首字母大写的全拼字符串.
     */
    public static String convert(String chinese) {
	
	// 初始化多音字资源.
	if (!initialized) {
	    init();
	}
	
	StringBuffer pinyin = new StringBuffer();
	
	HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
	defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
	defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
	
	char[] arr = chinese.toCharArray();
	for (int i = 0; i < arr.length; i++) {
	    char ch = arr[i];
	    if (ch > 128) {
		try {
		    String[] results = PinyinHelper.toHanyuPinyinStringArray(ch, defaultFormat);
		    if (results == null) {
			return "";
		    } else {
			int len = results.length;
			if (len == 1) {
			    String py = results[0];
			    if (py.contains("u:")) {
				py = py.replace("u:", "v");
			    }
			    pinyin.append(convertInitialToUpperCase(py));
			} else if (results[0].equals(results[1])) {
			    pinyin.append(convertInitialToUpperCase(results[0]));
			} else {
			    int length = chinese.length();
			    boolean flag = false;
			    String s = null;
			    List<String> keyList = null;
			    for (int x = 0; x < len; x++) {
				String py = results[x];
				if (py.contains("u:")) {
				    py = py.replace("u:", "v");
				}
				keyList = pinyinMap.get(py);
				if (i + 3 <= length) {
				    s = chinese.substring(i, i + 3);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					flag = true;
					break;
				    }
				}
				
				if (i + 2 <= length) {
				    s = chinese.substring(i, i + 2);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					flag = true;
					break;
				    }
				}
				
				if ((i - 2 >= 0) && (i + 1 <= length)) {
				    s = chinese.substring(i - 2, i + 1);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					flag = true;
					break;
				    }
				}
				
				if ((i - 1 >= 0) && (i + 1 <= length)) {
				    s = chinese.substring(i - 1, i + 1);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					flag = true;
					break;
				    }
				}
				
				if ((i - 1 >= 0) && (i + 2 <= length)) {
				    s = chinese.substring(i - 1, i + 2);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					flag = true;
					break;
				    }
				}
			    }
			    
			    if (!flag) {
				s = String.valueOf(ch);
				for (int x = 0; x < len; x++) {
				    String py = results[x];
				    if (py.contains("u:")) {
					py = py.replace("u:", "v");
				    }
				    keyList = pinyinMap.get(py);
				    if (keyList != null && (keyList.contains(s))) {
					pinyin.append(convertInitialToUpperCase(py));
					break;
				    }
				}
			    }
			}
		    }
		    
		} catch (BadHanyuPinyinOutputFormatCombination e) {
		    e.printStackTrace();
		}
	    } else {
		pinyin.append(arr[i]);
	    }
	}
	return pinyin.toString();
    }
    
    /**
     * 获取拼音字母中所有的大写字母.
     * 
     * @param source 原始全拼字母.
     * @return 返回所有大写字母.
     */
    public static String getUpperCase(String source) {
	
	StringBuffer sb = new StringBuffer();
	char[] arr = source.toCharArray();
	for (int i = 0; i < arr.length; i++) {
	    char ch = arr[i];
	    if (Character.isUpperCase(ch)) {
		sb.append(ch);
	    }
	}
	
	return sb.toString();
    }
    
}
