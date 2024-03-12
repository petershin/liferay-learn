package com.acme.s5e6.search;

import com.acme.s5e6.model.S5E6Entry;

import com.liferay.portal.kernel.search.Field;
import com.liferay.portal.search.spi.model.index.contributor.ModelIndexerWriterContributor;
import com.liferay.portal.search.spi.model.registrar.ModelSearchConfigurator;
import com.liferay.portal.search.spi.model.result.contributor.ModelSummaryContributor;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(service = ModelSearchConfigurator.class)
public class S5E6EntryModelSearchConfigurator
	implements ModelSearchConfigurator<S5E6Entry> {

	@Override
	public String getClassName() {
		return S5E6Entry.class.getName();
	}

	@Override
	public String[] getDefaultSelectedFieldNames() {
		return new String[] {
			Field.COMPANY_ID, Field.ENTRY_CLASS_NAME, Field.ENTRY_CLASS_PK,
			Field.SCOPE_GROUP_ID, Field.GROUP_ID, Field.UID
		};
	}

	@Override
	public String[] getDefaultSelectedLocalizedFieldNames() {
		return new String[] {Field.CONTENT, Field.TITLE};
	}

	@Override
	public ModelIndexerWriterContributor<S5E6Entry>
		getModelIndexerWriterContributor() {

		return modelIndexWriterContributor;
	}

	@Override
	public ModelSummaryContributor getModelSummaryContributor() {
		return modelSummaryContributor;
	}

	@Override
	public boolean isSelectAllLocales() {
		return true;
	}

	@Reference(target = "(indexer.class.name=com.acme.s5e6.model.S5E6Entry)")
	protected ModelIndexerWriterContributor<S5E6Entry>
		modelIndexWriterContributor;

	@Reference(target = "(indexer.class.name=com.acme.s5e6.model.S5E6Entry)")
	protected ModelSummaryContributor modelSummaryContributor;

}