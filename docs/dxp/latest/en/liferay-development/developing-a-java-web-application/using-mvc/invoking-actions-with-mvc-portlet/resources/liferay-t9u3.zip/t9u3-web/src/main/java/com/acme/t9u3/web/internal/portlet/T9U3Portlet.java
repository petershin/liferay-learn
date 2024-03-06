package com.acme.t9u3.web.internal.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.ProcessAction;

import org.osgi.service.component.annotations.Component;

@Component(
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"javax.portlet.display-name=T9U3 Portlet",
		"javax.portlet.init-param.view-template=/view.jsp"
	},
	service = Portlet.class
)
public class T9U3Portlet extends MVCPortlet {

	public void doSomething(
		ActionRequest actionRequest, ActionResponse actionResponse) {

		if (_log.isInfoEnabled()) {
			_log.info("Invoking #doSomething(ActionRequest, ActionResponse)");
		}
	}

	public void doSomethingElse(
		ActionRequest actionRequest, ActionResponse actionResponse) {

		if (_log.isInfoEnabled()) {
			_log.info(
				"Invoking #doSomethingElse(ActionRequest, ActionResponse)");
		}
	}

	@ProcessAction(name = "nameForTheDoSomethingMoreMethod")
	public void doSomethingMore(
		ActionRequest actionRequest, ActionResponse actionResponse) {

		if (_log.isInfoEnabled()) {
			_log.info(
				"Invoking #doSomethingMore(ActionRequest, ActionResponse)");
		}
	}

	private static final Log _log = LogFactoryUtil.getLog(T9U3Portlet.class);

}