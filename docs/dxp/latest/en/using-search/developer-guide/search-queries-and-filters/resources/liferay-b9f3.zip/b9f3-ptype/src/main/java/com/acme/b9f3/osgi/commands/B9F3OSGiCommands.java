package com.acme.b9f3.osgi.commands;

import com.liferay.petra.string.StringBundler;
import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.Role;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.search.Field;
import com.liferay.portal.kernel.security.permission.PermissionChecker;
import com.liferay.portal.kernel.security.permission.PermissionCheckerFactoryUtil;
import com.liferay.portal.kernel.security.permission.PermissionThreadLocal;
import com.liferay.portal.kernel.service.RoleLocalServiceUtil;
import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.search.document.Document;
import com.liferay.portal.search.hits.SearchHit;
import com.liferay.portal.search.hits.SearchHits;
import com.liferay.portal.search.query.BooleanQuery;
import com.liferay.portal.search.query.MatchQuery;
import com.liferay.portal.search.query.Queries;
import com.liferay.portal.search.query.TermQuery;
import com.liferay.portal.search.searcher.SearchRequest;
import com.liferay.portal.search.searcher.SearchRequestBuilder;
import com.liferay.portal.search.searcher.SearchRequestBuilderFactory;
import com.liferay.portal.search.searcher.SearchResponse;
import com.liferay.portal.search.searcher.Searcher;

import java.util.ArrayList;
import java.util.List;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
	property = {"osgi.command.function=search", "osgi.command.scope=b9f3"},
	service = B9F3OSGiCommands.class
)
public class B9F3OSGiCommands {

	public void search(String keywords) throws PortalException {
		MatchQuery titleQuery = _queries.match(
			StringBundler.concat(
				"localized_", Field.TITLE, StringPool.UNDERLINE, LocaleUtil.US),
			keywords);

		TermQuery rootFolderQuery = _queries.term(Field.FOLDER_ID, "0");

		BooleanQuery booleanQuery = _queries.booleanQuery();

		booleanQuery.addMustQueryClauses(rootFolderQuery, titleQuery);

		SearchRequestBuilder searchRequestBuilder =
			_searchRequestBuilderFactory.builder();

		Role adminRole = RoleLocalServiceUtil.getRole(
			_portal.getDefaultCompanyId(), "Administrator");

		List<User> adminUsers = _userLocalService.getRoleUsers(
			adminRole.getRoleId());

		PermissionChecker permissionChecker =
			PermissionCheckerFactoryUtil.create(
				_userLocalService.getUser(adminUsers.get(0).getUserId()));

		PermissionThreadLocal.setPermissionChecker(permissionChecker);

		searchRequestBuilder.withSearchContext(
			searchContext -> {
				searchContext.setCompanyId(permissionChecker.getCompanyId());
				searchContext.setKeywords(keywords);
			});

		SearchRequest searchRequest = searchRequestBuilder.query(
			booleanQuery
		).build();

		SearchResponse searchResponse = _searcher.search(searchRequest);

		SearchHits searchHits = searchResponse.getSearchHits();

		List<SearchHit> searchHitsList = searchHits.getSearchHits();

		List<String> resultsList = new ArrayList<>(searchHitsList.size());

		searchHitsList.forEach(
			searchHit -> {
				Document doc = searchHit.getDocument();

				String uid = doc.getString(Field.UID);

				System.out.println(
					StringBundler.concat(
						"Document ", uid, " had a score of ",
						searchHit.getScore()));

				resultsList.add(uid);
			});
	}

	@Reference
	private Portal _portal;

	@Reference
	private Queries _queries;

	@Reference
	private Searcher _searcher;

	@Reference
	private SearchRequestBuilderFactory _searchRequestBuilderFactory;

	@Reference
	private UserLocalService _userLocalService;

}