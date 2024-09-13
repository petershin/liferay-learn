package com.acme.m9a3.internal.servlet.filter;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.BaseFilter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.service.component.annotations.Component;

@Component(
	property = {
		"after-filter=Absolute Redirects Filter",
		"before-filter=Auto Login Filter", "dispatcher=FORWARD",
		"servlet-context-name=", "servlet-filter-name=M9A3 Servlet Filter",
		"url-pattern=/group/*", "url-pattern=/user/*", "url-pattern=/web/*"
	},
	service = Filter.class
)
public class M9A3ServletFilter extends BaseFilter {

	@Override
	protected Log getLog() {
		return _log;
	}

	@Override
	protected void processFilter(
			HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse, FilterChain filterChain)
		throws Exception {

		if (_log.isInfoEnabled()) {
			_log.info(
				"Invoking #processFilter(HttpServletRequest, " +
					"HttpServletResponse, FilterChain)");
		}

		httpServletResponse.addHeader(
			"X-M9A3-Servlet-Filter", httpServletRequest.getRequestURI());

		processFilter(
			M9A3ServletFilter.class.getName(), httpServletRequest,
			httpServletResponse, filterChain);
	}

	private static final Log _log = LogFactoryUtil.getLog(
		M9A3ServletFilter.class);

}