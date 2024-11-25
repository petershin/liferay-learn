package com.acme.x9k1.internal.commerce.order.rule.entry.type;

import com.acme.x9k1.internal.commerce.order.rule.entry.type.util.X9K1MinimumQuantityUtil;

import com.liferay.commerce.model.CommerceOrder;
import com.liferay.commerce.model.CommerceOrderItem;
import com.liferay.commerce.order.rule.entry.type.COREntryType;
import com.liferay.commerce.order.rule.entry.type.COREntryTypeItem;
import com.liferay.commerce.order.rule.model.COREntry;
import com.liferay.petra.string.StringBundler;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.BigDecimalUtil;

import java.math.BigDecimal;

import java.util.List;
import java.util.Locale;

import org.osgi.service.component.annotations.Component;

@Component(
	property = {
		"commerce.order.rule.entry.type.key=x9k1-minimum-quantity-order-rule",
		"commerce.order.rule.entry.type.order:Integer=1"
	},
	service = COREntryType.class
)
public class X9K1MinimumQuantityCOREntryTypeImpl implements COREntryType {

	@Override
	public boolean evaluate(COREntry corEntry, CommerceOrder commerceOrder)
		throws PortalException {

		if (BigDecimalUtil.gt(
				BigDecimal.valueOf(_getMinimumQuantity(corEntry)),
				_getOrderQuantity(commerceOrder))) {

			return false;
		}

		return true;
	}

	@Override
	public boolean evaluate(
		COREntry corEntry, List<COREntryTypeItem> corEntryTypeItems) {

		throw new UnsupportedOperationException();
	}

	@Override
	public String getErrorMessage(
			COREntry corEntry, CommerceOrder commerceOrder, Locale locale)
		throws PortalException {

		StringBundler sb = new StringBundler();

		sb.append("Order quantity is less than the minimum quantity ");

		Double minimumQuantity = _getMinimumQuantity(corEntry);

		sb.append(minimumQuantity);

		sb.append(". Add ");

		Double delta = BigDecimalUtil.subtract(
			BigDecimal.valueOf(minimumQuantity),
			_getOrderQuantity(commerceOrder));

		sb.append(delta);

		sb.append(" more item");

		if (delta > 1) {
			sb.append("s");
		}

		sb.append(" to continue.");

		return sb.toString();
	}

	@Override
	public String getKey() {
		return "x9k1-minimum-quantity-order-rule";
	}

	@Override
	public String getLabel(Locale locale) {
		return LanguageUtil.get(locale, "x9k1-minimum-order-quantity");
	}

	@Override
	public boolean isActive() {
		return true;
	}

	private Double _getMinimumQuantity(COREntry corEntry) {
		return X9K1MinimumQuantityUtil.getMinimumQuantity(corEntry);
	}

	private BigDecimal _getOrderQuantity(CommerceOrder commerceOrder) {
		BigDecimal orderQuantity = BigDecimal.ZERO;

		List<CommerceOrderItem> commerceOrderItems =
			commerceOrder.getCommerceOrderItems();

		for (CommerceOrderItem commerceOrderItem : commerceOrderItems) {
			orderQuantity = BigDecimal.valueOf(
				BigDecimalUtil.add(
					orderQuantity, commerceOrderItem.getQuantity()));
		}

		return orderQuantity;
	}

}