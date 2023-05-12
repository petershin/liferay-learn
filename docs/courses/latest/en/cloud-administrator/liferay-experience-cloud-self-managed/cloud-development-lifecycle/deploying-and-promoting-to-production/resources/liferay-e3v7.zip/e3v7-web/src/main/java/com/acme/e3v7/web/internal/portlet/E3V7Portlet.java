package com.acme.e3v7.web.internal.portlet;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

@Component(
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"javax.portlet.display-name=E3V7 Portlet",
		"javax.portlet.init-param.view-template=/view.jsp"
	},
	service = Portlet.class
)
public class E3V7Portlet extends MVCPortlet {
}
