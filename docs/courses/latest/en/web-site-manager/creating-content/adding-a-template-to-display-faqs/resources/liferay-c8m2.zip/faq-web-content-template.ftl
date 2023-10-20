<#assign
	articleId = .vars['reserved-article-id'].data
	panelGroupId = "panelGroup-${articleId}"
/>

<#if FAQ.getSiblings()?has_content>
	<div class="panel-group" id="${panelGroupId}">
		<#list FAQ.getSiblings() as cur_FAQ>
			<#assign panelCollapseId = "collapsePanel${cur_FAQ?index}-${articleId}" />

			<div class="panel panel-secondary">
				<button
					class="btn btn-unstyled panel-header panel-header-link collapse-icon collapse-icon-middle collapsed"
					data-parent="#${panelGroupId}"
					data-target="#${panelCollapseId}"
					data-toggle="liferay-collapse"
					type="button"
				>
					<#if (cur_FAQ.QuestionText.getData())??>
						<span class="panel-title">
							${cur_FAQ.QuestionText.getData()}
						</span>
					</#if>

					<span class="collapse-icon-closed">
						<@clay.icon symbol="angle-right" />
					</span>
					<span class="collapse-icon-open">
						<@clay.icon symbol="angle-down" />
					</span>
				</button>

				<div class="panel-collapse collapse" id="${panelCollapseId}">
					<div class="panel-body">
						<#if (cur_FAQ.AnswerText.getData())??>
							${cur_FAQ.AnswerText.getData()}
						</#if>
					</div>
				</div>
			</div>
		</#list>
	</div>
</#if>