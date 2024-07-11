package com.liferay.p9z0.web.internal.portlet;

import com.liferay.p9z0.service.P9Z0EntryLocalService;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"javax.portlet.display-name=P9Z0 Portlet",
		"javax.portlet.init-param.view-template=/view.jsp"
	},
	service = Portlet.class
)
public class P9Z0Portlet extends MVCPortlet {

	public void addP9Z0Entry(
			ActionRequest actionRequest, ActionResponse actionResponse)
		throws PortalException {

		_p9z0EntryLocalService.addP9Z0Entry(
			ParamUtil.getString(actionRequest, "description"),
			ParamUtil.getString(actionRequest, "name"),
			ParamUtil.getBoolean(actionRequest, "hidden"));
	}

	@Reference
	private P9Z0EntryLocalService _p9z0EntryLocalService;

}