/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.uasp.controller;

import org.kayura.core.PostAction;
import org.kayura.core.PostResult;
import org.kayura.web.controllers.UaspController;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author liangxia@live.com
 */
@ControllerAdvice
public class GlobalController extends UaspController {

	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public ModelAndView maxUploadSizeException(Exception ex) {

		ModelAndView view = new ModelAndView("views/file/error");

		postExecute(view.getModel(), new PostAction() {

			@Override
			public void invoke(PostResult r) {

				MaxUploadSizeExceededException e = (MaxUploadSizeExceededException) ex;
				r.setError("上传的文件超过最大限制 %d 。", e.getMaxUploadSize());
			}
		});

		return view;
	}

}
