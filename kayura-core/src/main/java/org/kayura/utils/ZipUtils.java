/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * ZipUtils
 *
 * @author liangxia@live.com
 */
public class ZipUtils {

	public static final String EXT = ".zip";
	private static final int BUFFER = 1024 * 32;

	public static void compress(List<File> srcFiles, File destFile) throws Exception {

		OutputStream os = new BufferedOutputStream(new FileOutputStream(destFile));
		ZipOutputStream zout = new ZipOutputStream(os);

		byte[] buf = new byte[BUFFER];
		int len;
		for (File file : srcFiles) {

			if (file.isFile() && file.exists()) {

				ZipEntry entry = new ZipEntry(file.getName());
				zout.putNextEntry(entry);

				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
				while ((len = bis.read(buf)) > 0) {
					zout.write(buf, 0, len);
				}
				bis.close();
				zout.closeEntry();
			}
		}

		zout.close();
	}

	public static void compress(String[] srcFileNames, String destFileName) throws Exception {

		File destFile = new File(destFileName);

		List<File> srcFiles = new ArrayList<File>();
		for (String s : srcFileNames) {
			srcFiles.add(new File(s));
		}

		compress(srcFiles, destFile);
	}

}
