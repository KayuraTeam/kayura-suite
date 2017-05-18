/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kayura.mybatis.type.PageBounds;
import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.dao.FileMapper;
import org.kayura.uasp.dao.UserMapper;
import org.kayura.uasp.po.FileFolder;
import org.kayura.uasp.po.FileInfo;
import org.kayura.uasp.po.FileRelation;
import org.kayura.uasp.po.FileShare;
import org.kayura.uasp.po.User;
import org.kayura.uasp.service.FileService;
import org.kayura.uasp.vo.FileDownload;
import org.kayura.uasp.vo.FileListItem;
import org.kayura.uasp.vo.FileContentUpdate;
import org.kayura.uasp.vo.FileUpload;
import org.kayura.uasp.vo.FileUploadResult;
import org.kayura.utils.DateUtils;
import org.kayura.utils.KeyUtils;
import org.kayura.utils.MapUtils;
import org.kayura.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author liangxia@live.com
 */
@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public Result<FileUploadResult> upload(FileUpload fu) {

		FileRelation fr = new FileRelation();
		fr.setFrId(KeyUtils.newId());
		fr.setTenantId(fu.getTenantId());
		fr.setBizId(fu.getBizId());
		fr.setCategory(fu.getCategory());
		fr.setFileName(fu.getFileName());
		fr.setPostfix(fu.getPostfix());
		fr.setUploaderId(fu.getUploaderId());
		fr.setUploaderName(fu.getUploaderName());
		fr.setUploadTime(DateUtils.now());
		fr.setSerial(fu.getSerial());
		fr.setTags(fu.getTags());

		if (!StringUtils.isEmpty(fu.getFolderId())) {
			if (fileMapper.existsFolderById(fu.getFolderId())) {
				fr.setFolderId(fu.getFolderId());
			}
		}

		// 在不允许修改文件内容时,可引用相同文件,以减少磁盘存储.
		String fileId = null;
		Boolean isNewFile = false;
		if (!fu.getAllowChange()) {
			fileId = fileMapper.getFileInfoKeyByMd5(fu.getMd5());
		}

		// 若没有相同的文件内容,将创建新文件.
		if (fileId == null) {
			fileId = KeyUtils.newId();

			FileInfo fi = new FileInfo();
			fi.setFileId(fileId);
			fi.setContentType(fu.getContentType());
			fi.setFileSize(fu.getFileSize());
			fi.setLogicPath(fu.getLogicPath());
			fi.setMd5(fu.getMd5());
			fi.setIsEncrypted(fu.getIsEncrypt());
			fi.setSalt(fu.getSalt());
			fi.setAllowChange(fu.getAllowChange());

			// 将文件信息添加至数据库.
			fileMapper.insertFileInfo(fi);
			isNewFile = true;
		}

		// 记录文件信息Id, 将文件关联保存至数据库.
		fr.setFileId(fileId);
		fileMapper.insertFileRelation(fr);

		// 创建返回值对象.
		Result<FileUploadResult> r = new Result<FileUploadResult>();

		FileUploadResult ur = new FileUploadResult();
		ur.setFrId(fr.getFrId());
		ur.setFileId(fr.getFileId());
		ur.setNewFile(isNewFile);

		r.setData(ur);

		return r;
	}

	@Override
	public Result<List<FileDownload>> download(List<String> frIds) {

		List<FileDownload> resultList = new ArrayList<FileDownload>();

		List<FileRelation> list = fileMapper.getFileRelationByIds(frIds);
		for (FileRelation fr : list) {

			FileInfo fi = fileMapper.getFileInfoById(fr.getFileId());
			if (fi != null) {

				if (!resultList.stream().anyMatch(
						c -> c.getFileName().equals(fr.getFileName()) && c.getMd5().equals(fi.getMd5()))) {

					FileDownload fd = new FileDownload();
					fd.setFrId(fr.getFrId());
					fd.setLogicPath(fi.getLogicPath());
					fd.setFileId(fr.getFileId());
					fd.setFileName(fr.getFileName());
					fd.setContentType(fi.getContentType());
					fd.setMd5(fi.getMd5());
					fd.setIsEncrypted(fi.getIsEncrypted());
					fd.setSalt(fi.getSalt());
					fd.setAllowChange(fi.getAllowChange());

					resultList.add(fd);
				}
			}
		}

		fileMapper.updateFileDownloads(frIds);

		return new Result<List<FileDownload>>(Result.SUCCEED, resultList);
	}

	@Override
	public GeneralResult updateContent(FileContentUpdate fu) {

		// 更新文件信息.
		if (!StringUtils.isEmpty(fu.getFileId())) {

			Map<String, Object> fileArgs = new HashMap<String, Object>();
			fileArgs.put("fileSize", fu.getFileSize());
			fileArgs.put("contentType", fu.getContentType());
			// fileArgs.put("md5", fu.getMd5());
			fileArgs.put("fileId", fu.getFileId());

			fileMapper.updateFileInfo(fileArgs);
		}

		return Result.succeed();
	}

	@Override
	public Result<List<FileFolder>> findFolders(String userId, Boolean isRoot) {

		// 添加所属用户的.
		if (isRoot == null) {

			User user = userMapper.getUserByMap(MapUtils.make("userId", userId));
			if (user != null) {
				isRoot = user.getTenantId() == null;
			} else {
				return new Result<List<FileFolder>>(Result.FAILED, "传入的用户ID不存在。");
			}
		}

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("isRoot", isRoot);
		if (!StringUtils.isEmpty(userId)) {
			args.put("userId", userId);
		}

		List<FileFolder> folders = fileMapper.getFolders(args);

		// 返回结果.
		return new Result<List<FileFolder>>(Result.SUCCEED, folders);
	}

	public Result<List<FileFolder>> findChildFolders(String folderId) {

		List<FileFolder> list = fileMapper.getFolders(MapUtils.make("parentId", folderId));
		return new Result<List<FileFolder>>(Result.SUCCEED, list);
	}

	public Result<FileFolder> getFolderById(String folderId) {

		FileFolder folder = fileMapper.getFolderById(folderId);
		return new Result<FileFolder>(Result.SUCCEED, folder);
	}

	/**
	 * 查找别人共享给我的共享文件信息 。
	 * 
	 * @param receiverId 共享文件接收人Id.
	 * @param findType 查找类型: FOLDER 文件夹,FILE 文件, null 查全部.
	 * @return 返回符合条件的文件共享信息.
	 */
	public Result<List<FileShare>> findFileShares(String receiverId, String findType) {

		Map<String, Object> args = MapUtils.make("receiverId", receiverId);

		if (!StringUtils.isEmpty(findType)) {
			args.put("findType", findType);
		}

		List<FileShare> list = fileMapper.getFileShares(args);

		return new Result<List<FileShare>>(Result.SUCCEED, list);
	}

	/**
	 * 查找我共享给别人的共享文件信息 。
	 * 
	 * @param receiverId 共享人Id.
	 * @param findType 查找类型: FOLDER 文件夹,FILE 文件, null 查全部.
	 * @return 返回符合条件的文件共享信息.
	 */
	public Result<List<FileShare>> findMyShares(String sharerId, String findType) {

		Map<String, Object> args = MapUtils.make("sharerId", sharerId);

		if (!StringUtils.isEmpty(findType)) {
			args.put("findType", findType);
		}

		List<FileShare> list = fileMapper.getFileShares(args);

		return new Result<List<FileShare>>(Result.SUCCEED, list);
	}

	@Override
	public Result<List<FileListItem>> findFilesByBiz(String bizId, String category, String tags) {

		Map<String, Object> args = MapUtils.make("bizId", bizId);

		if (!StringUtils.isEmpty(category)) {
			args.put("category", category);
		}

		if (!StringUtils.isEmpty(tags)) {
			args.put("tags", tags.split(","));
		}

		List<FileListItem> list = fileMapper.findFiles(args);

		return new Result<List<FileListItem>>(Result.SUCCEED, list);
	}

	@Override
	public Result<PageList<FileListItem>> findFilesByFolder(String folderId, String uploaderId, PageParams params) {

		Map<String, Object> args = MapUtils.make("folderId", folderId);

		if (!StringUtils.isEmpty(uploaderId)) {
			args.put("uploaderId", uploaderId);
		}

		PageList<FileListItem> list = fileMapper.findFilesPage(args, new PageBounds(params));

		return new Result<PageList<FileListItem>>(Result.SUCCEED, list);
	}

	@Override
	public Result<PageList<FileListItem>> findFilesByShare(String sharerId, String receiverId, PageParams params) {

		Map<String, Object> args = new HashMap<String, Object>();

		if (!StringUtils.isEmpty(sharerId)) {
			args.put("sharerId", sharerId);
		}

		if (!StringUtils.isEmpty(receiverId)) {
			args.put("receiverId", receiverId);
		}

		PageList<FileListItem> list = fileMapper.findFilesPage(args, new PageBounds(params));
		return new Result<PageList<FileListItem>>(Result.SUCCEED, list);
	}

	@Override
	public GeneralResult saveFolder(FileFolder folder) {

		String id = folder.getFolderId();

		if (StringUtils.isEmpty(id)) {

			folder.setFolderId(KeyUtils.newId());
			fileMapper.insertFolder(folder);
		} else {

			if (fileMapper.existsFolderById(id)) {

				Map<String, Object> args = new HashMap<String, Object>();
				args.put("folderId", id);
				args.put("name", folder.getName());
				args.put("hidden", folder.getHidden());

				fileMapper.updateFolder(args);
			} else {

				fileMapper.insertFolder(folder);
			}
		}

		GeneralResult r = Result.succeed();
		r.add("folderId", folder.getFolderId());

		return r;
	}

	@Override
	public GeneralResult removeFolder(String id) {

		if (fileMapper.existsFileRelationByMap(MapUtils.make("folderId", id))) {
			return Result.falied("文件夹下存在文件，不允许被删除。");
		} else if (fileMapper.getFolderChildsById(id) > 0) {
			return Result.falied("存在子文件夹，不允许被删除。");
		} else {
			fileMapper.deleteFolder(id);
		}

		return Result.succeed();
	}

	@Override
	public GeneralResult moveToFolder(List<String> frIds, String folderId, String ownerId) {

		String fid = folderId;
		FileFolder folder = null;

		if (fid == null || fid == "NULL" || FileFolder.NOTCLASSIFIED.equals(fid)) {
			fid = "NULL";
		} else {
			folder = fileMapper.getFolderById(fid);
			if (folder == null) {
				return Result.falied("目标文件夹不存在.");
			}
		}

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("folderId", fid);
		args.put("frIds", frIds);
		args.put("uploaderId", ownerId);

		fileMapper.updateFileRelation(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult copyToFolder(List<String> frIds, String folderId, String ownerId) {

		String fid = folderId;

		if (FileFolder.NOTCLASSIFIED.equals(fid)) {
			fid = null;
		}

		if (!StringUtils.isEmpty(fid)) {
			if (!fileMapper.existsFolderById(fid)) {
				return Result.falied("目标文件夹不存在.");
			}
		}

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("folderId", fid);
		args.put("frIds", frIds);
		args.put("uploaderId", ownerId);
		args.put("uploadTime", DateUtils.now());

		fileMapper.copyToFolder(args);

		return Result.succeed();
	}

	@Override
	public GeneralResult removeFiles(List<String> frIds, String ownerId, Boolean isBiz) {

		Map<String, Object> args = new HashMap<String, Object>();
		args.put("isBiz", isBiz);
		args.put("frIds", frIds);
		args.put("uploaderId", ownerId);

		fileMapper.removeFiles(args);

		return Result.succeed();
	}

}
