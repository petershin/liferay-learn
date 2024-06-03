package com.acme.j1c2.internal.service;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.service.ServiceWrapper;
import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.portal.kernel.service.UserLocalServiceWrapper;

import java.util.Map;

import org.osgi.service.component.annotations.Component;

@Component(service = ServiceWrapper.class)
public class J1C2UserLocalServiceWrapper extends UserLocalServiceWrapper {

    @Override
    public int authenticateByEmailAddress(
            long companyId, String emailAddress, String password,
            Map<String, String[]> headerMap, Map<String, String[]> parameterMap,
            Map<String, Object> resultsMap)
        throws PortalException {

        if (_log.isInfoEnabled()) {
            _log.info(
                "Invoking #authenticateByEmailAddress(long, String, String, " +
                    "Map, Map, Map)");
        }

        return super.authenticateByEmailAddress(
            companyId, emailAddress, password, headerMap, parameterMap,
            resultsMap);
    }

    private static final Log _log = LogFactoryUtil.getLog(
        J1C2UserLocalServiceWrapper.class);
}