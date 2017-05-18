/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.provider;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kayura.exceptions.KayuraException;
import org.kayura.utils.DateUtils;

/**
 * @author liangxia@live.com
 */
public class FileUploadProviderImpl implements FileUploadProvider {

	private static final Log logger = LogFactory.getLog(FileUploadProviderImpl.class);
	private static final String FileSeparator;

	private Map<String, String> uploadPaths;
	private String tempPath;
	private Long minSpace;

	static {
		FileSeparator = System.getProperty("file.separator");
	}

	public FileUploadProviderImpl() {
		this.uploadPaths = new HashMap<String, String>();
	}

	private String getUsableDir() {

		try {

			for (String key : uploadPaths.keySet()) {

				String dir = uploadPaths.get(key);
				File f = new File(dir);
				if (!f.exists()) {
					if (!f.mkdirs()) {
						continue;
					}
				}

				Long fg = f.getFreeSpace();
				if (fg > minSpace) {
					return key;
				}
			}

		} catch (Exception e) {
			logger.error("获取存储目录时发生异常。", e);
		}

		throw new KayuraException("上传文件库的存储空间不足。");
	}

	public void setMinSpace(Long minSpace) {
		this.minSpace = minSpace;
	}

	public void setUploadPaths(Map<String, String> uploadPaths) {
		this.uploadPaths = uploadPaths;
	}

	public String convertAbsolutePath(String logicPath) {

		String diskPath = logicPath;
		for (String key : uploadPaths.keySet()) {
			if (logicPath.startsWith(key)) {
				diskPath = logicPath.replace(key, uploadPaths.get(key));
				break;
			}
		}

		File fp = new File(diskPath);
		if (!fp.exists()) {
			fp.mkdirs();
		}

		return diskPath;
	}

	public String getTempPath() {

		File tp = new File(tempPath);
		if (!tp.exists()) {
			tp.mkdirs();
		}

		return tempPath;
	}

	public void setTempPath(String tempPath) {
		this.tempPath = tempPath;
	}

	@Override
	public String getLogicPath() {

		String dirKey = getUsableDir();

		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		String subPath = format.format(DateUtils.now());

		return dirKey + FileSeparator + subPath + FileSeparator;
	}

}
