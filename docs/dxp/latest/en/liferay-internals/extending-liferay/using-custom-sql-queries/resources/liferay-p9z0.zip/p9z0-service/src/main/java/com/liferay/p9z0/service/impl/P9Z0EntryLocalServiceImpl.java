/**
 * SPDX-FileCopyrightText: (c) 2024 Liferay, Inc. https://liferay.com
 * SPDX-License-Identifier: LGPL-2.1-or-later OR LicenseRef-Liferay-DXP-EULA-2.0.0-2023-06
 */

package com.liferay.p9z0.service.impl;

import com.liferay.p9z0.model.P9Z0Entry;
import com.liferay.p9z0.model.impl.P9Z0EntryImpl;
import com.liferay.p9z0.service.base.P9Z0EntryLocalServiceBaseImpl;
import com.liferay.portal.aop.AopService;
import com.liferay.portal.kernel.dao.orm.QueryPos;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.dao.orm.SQLQuery;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;

import java.util.List;

import org.osgi.service.component.annotations.Component;

/**
 * @author Brian Wing Shun Chan
 */
@Component(
	property = "model.class.name=com.liferay.p9z0.model.P9Z0Entry",
	service = AopService.class
)
public class P9Z0EntryLocalServiceImpl extends P9Z0EntryLocalServiceBaseImpl {

	public P9Z0Entry addP9Z0Entry(
			String description, String name, boolean hidden)
		throws PortalException {

		P9Z0Entry p9z0Entry = p9z0EntryPersistence.create(
			counterLocalService.increment());

		p9z0Entry.setDescription(description);
		p9z0Entry.setName(name);
		p9z0Entry.setHidden(hidden);

		return p9z0EntryPersistence.update(p9z0Entry);
	}

	public List<P9Z0Entry> getP9Z0Entries(boolean hidden) {
		Session session = null;

		try {
			session = p9z0EntryPersistence.openSession();

			String sql = "SELECT * FROM P9Z0_P9Z0Entry WHERE hidden_ = ?";

			SQLQuery sqlQuery = session.createSynchronizedSQLQuery(sql);

			sqlQuery.addEntity("P9Z0_P9Z0Entry", P9Z0EntryImpl.class);

			QueryPos queryPos = QueryPos.getInstance(sqlQuery);

			queryPos.add(hidden);

			return (List<P9Z0Entry>)QueryUtil.list(
				sqlQuery, p9z0EntryPersistence.getDialect(), QueryUtil.ALL_POS,
				QueryUtil.ALL_POS);
		}
		catch (Exception exception) {
			throw new SystemException(exception);
		}
		finally {
			p9z0EntryPersistence.closeSession(session);
		}
	}

}