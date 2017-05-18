/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.service;

import java.util.List;

import org.kayura.type.GeneralResult;
import org.kayura.type.PageList;
import org.kayura.type.PageParams;
import org.kayura.type.Result;
import org.kayura.uasp.vo.FileDownload;
import org.kayura.uasp.vo.FileListItem;
import org.kayura.uasp.po.FileFolder;
import org.kayura.uasp.po.FileShare;
import org.kayura.uasp.vo.FileContentUpdate;
import org.kayura.uasp.vo.FileUpload;
import org.kayura.uasp.vo.FileUploadResult;

/**
 * @author liangxia@live.com
 */
public interface FileService {

	/**
	 * 文件上传.
	 * 
	 * @param fileUpload 上传的文件信息.
	 * @return 在返回 frid(String), fileid(String), newfile(Boolean).
	 */
	Result<FileUploadResult> upload(FileUpload fileUpload);

	/**
	 * 通过文件关系ID，下载该文件信息或内容.
	 * 
	 * @param frIds 文件关系Id.
	 * @return 返回文件下载数据.
	 */
	Result<List<FileDownload>> download(List<String> frIds);

	/**
	 * 更新文件内容信息.
	 * 
	 * @param fileUpdate 更新后的文件信息.
	 * @return 返回更新结果.
	 */
	GeneralResult updateContent(FileContentUpdate fileUpdate);

	/**
	 * 查找符合条件的目录信息.
	 * 
	 * @param userId 该用户下可用的目录.
	 * @param isRoot 指定用户是否为根管理员.
	 * @return 返回该租户下可用的目录.
	 */
	Result<List<FileFolder>> findFolders(String userId, Boolean isRoot);

	Result<List<FileFolder>> findChildFolders(String folderId);

	Result<FileFolder> getFolderById(String folderId);

	/**
	 * 删除指定文件关系.
	 * 
	 * @param frIds 文件关系Id集合.
	 * @param ownerId 该文件的所有人Id.
	 * @param isBiz 删除时是否包含已经关联业务表单的记录.
	 * @return
	 */
	GeneralResult removeFiles(List<String> frIds, String ownerId, Boolean isBiz);

	/**
	 * 查找别人共享给我的共享文件信息 。
	 * 
	 * @param receiverId 共享文件接收人Id.
	 * @param findType 查找类型: FOLDER 文件夹,FILE 文件, null 查全部.
	 * @return 返回符合条件的文件共享信息.
	 */
	Result<List<FileShare>> findFileShares(String receiverId, String findType);

	/**
	 * 查找我共享给别人的共享文件信息 。
	 * 
	 * @param receiverId 共享人Id.
	 * @param findType 查找类型: FOLDER 文件夹,FILE 文件, null 查全部.
	 * @return 返回符合条件的文件共享信息.
	 */
	Result<List<FileShare>> findMyShares(String sharerId, String findType);

	/**
	 * 根据业务表单信息查询文件关联数据.
	 * 
	 * @param bizId 业务表单Id.
	 * @param category 表单文件分类.
	 * @param tags 自定义标签,使用逗号间隔.
	 * @return
	 */
	Result<List<FileListItem>> findFilesByBiz(String bizId, String category, String tags);

	/**
	 * 根据文件目录查找上传的文件列表.
	 * 
	 * @param folderId 指定的目录Id，值为字符串 NULL时，表示条件为NULL，不指定该值时表示不应该该条件.
	 * @param uploaderId 当不指定目录Id.
	 * @return
	 */
	Result<PageList<FileListItem>> findFilesByFolder(String folderId, String uploaderId, PageParams params);

	/**
	 * 查找共享给我的文件列表（不包括共享文件中的文件）.
	 * 
	 * @param sharerId 文件共享人Id.
	 * @param receiverId 共享接收人Id.
	 * @param params 分页参数.
	 * @return 返回符合条件的文件信息列表.
	 */
	Result<PageList<FileListItem>> findFilesByShare(String sharerId, String receiverId, PageParams params);

	/**
	 * 保存或者更新一个文件夹信息.
	 * 
	 * @param fileFolder 文件夹信息.
	 * @return
	 */
	GeneralResult saveFolder(FileFolder fileFolder);

	/**
	 * 删除一个已经存在的文件夹.
	 * 
	 * @param id 文件夹Id.
	 */
	GeneralResult removeFolder(String folderId);

	/**
	 * 将一个文件移动至目标文件夹.
	 * 
	 * @param frIds 文件Id
	 * @param folderId 目标文件夹Id. 当值为 NULL 时, 表示将文件夹Id置空.
	 * @param ownerId 文件所有者Id.
	 * @return
	 */
	GeneralResult moveToFolder(List<String> frIds, String folderId, String ownerId);

	/**
	 * 将一个文件复制至目标文件夹.
	 * 
	 * @param frIds 文件Id
	 * @param folderId 目标文件夹Id. 当值为 NULL 时, 表示将文件夹Id置空.
	 * @param ownerId 文件所有者Id.
	 * @return
	 */
	GeneralResult copyToFolder(List<String> frIds, String folderId, String ownerId);

}
