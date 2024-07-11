<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<%@ page import="com.liferay.p9z0.model.P9Z0Entry" %><%@
page import="com.liferay.p9z0.service.P9Z0EntryLocalServiceUtil" %>

<%@ page import="java.util.List" %>

<portlet:defineObjects />

<h2>P9Z0 Portlet</h2>

<hr />

<h3>P9Z0 Entries</h3>

<%
List<P9Z0Entry> p9z0Entries = P9Z0EntryLocalServiceUtil.getP9Z0Entries(false);
%>

<c:choose>
	<c:when test="<%= (p9z0Entries != null) && (p9z0Entries.size() > 0) %>">
		<table>
			<tbody>
				<c:forEach items="<%= p9z0Entries %>" var="p9z0Entry">
					<tr>
						<td>${p9z0Entry}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		<em>There are no P9Z0 entries.</em>
	</c:otherwise>
</c:choose>

<hr />

<h3>Add a P9Z0 Entry</h3>

<portlet:actionURL name="addP9Z0Entry" var="addP9Z0EntryURL" />

<aui:form action="<%= addP9Z0EntryURL %>">
	<aui:input name="name" type="text" />
	<aui:input name="description" type="text" />
	<aui:input name="hidden" type="checkbox" />

	<aui:button type="submit" value="add" />
</aui:form>