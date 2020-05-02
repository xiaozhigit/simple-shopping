<table class="table table-sm">
     <thead>
        <tr class="rimproducts">
            <th class="rimproducts rim-col-product{{(@Y_EDITION ? 'Y' : '')}}"><strong> {{@LANG_12}}</strong></th>
            <check if="{{@Y_EDITION == false}}">
                <th class="rimproducts rim-col-tax-price"><strong> {{@LANG_13}} (%)</strong></th>
            </check>
            <th class="rimproducts rim-col-quantity"><strong> {{@LANG_14}} ({{@CURRENCY.currency}})</strong></th>
            <th class="rimproducts rim-col-tax-price"><strong> {{@LANG_15}}</strong></th>
            <th class="rimproducts rim-col-total"><strong> {{@LANG_16}}</strong></th>
            </tr>
        </thead>
        <tbody>
            {{@PLUGIN.PRODUCTS_TBL_TOP | raw}}
            <repeat group="{{@CATEGORIES}}" value="{{@CATEGORY}}">
                <tr class="categories">
                    <td class="categories text-center text-primary" colspan="5">{{@CATEGORY.name}}</td>
                </tr>
                <repeat group="{{@PRODUCTS[@CATEGORY.id] }}" value="{{@PRODUCT}}">
                    <tr class="rimproducts">
                        <td class="rimproducts">
                            <check if="{{@PRODUCT.image}}">
                                <true>
                                    <div class="rimImageBox d-none d-sm-block">
                                        <a href="{{@PRODUCT.image}}" class="rimProductImageLazy" data-lightbox="image-{{@PRODUCT.id}}" data-title="{{ @PRODUCT.name }}"><img src="{{@PRODUCT.thumb}}" class="rimProductImage img-thumbnail rounded" title="{{ @PRODUCT.name}}" alt="{{ @PRODUCT.name }}"></a> 
                                    </div>
                                    
                                    {{ @PRODUCT.name | raw}}
                                </true>
                                <false>
									<div class="rimImageBox d-none d-sm-block">
										<a href="{{@NOIMG}}" data-lightbox="image-{{@PRODUCT.id}}" data-title="{{ @PRODUCT.name }}"><img src="{{@NOIMG}}" class="rimProductImage img-thumbnail rounded" title="{{ @PRODUCT.name}}" alt="{{ @PRODUCT.name }}"></a>
									</div>

									{{ @PRODUCT.name | raw}}
                                </false>
                            </check>
                        </td>
                        <check if="{{@Y_EDITION == false}}">
                            <td class="rimproducts">
                                <input type="number" name="tax-{{@PRODUCT.id}}" readonly="readonly" value="{{@PRODUCT.tax}}" class="quantity form-control form-control-sm text-center">
                            </td>
                        </check>
                        <td class="rimproducts">
                            <input type="number" name="price-{{@PRODUCT.id}}" readonly="readonly" value="{{@PRODUCT.price}}" class="quantity form-control form-control-sm text-center">
                        </td>
                        <td class="rimproducts">
                            <check if="{{@Y_EDITION}}">
                                <true>
                                    <input type="number" name="quantity-{{@PRODUCT.id}}" min="0.00" step="0.01" onkeyup="getPrice( {{ @PRODUCT.id }} )" onchange="getPrice( {{ @PRODUCT.id }} )" class="quantity form-control form-control-sm text-center">
                                </true>
                                <false>
                                    <input type="number" name="quantity-{{@PRODUCT.id}}" min="0" step="1" onkeyup="getPrice( {{ @PRODUCT.id }} )" onchange="getPrice( {{ @PRODUCT.id }} )" class="quantity form-control form-control-sm text-center">
                                </false>
                            </check>
                        </td>
                        <td class="rimproducts">
                            <input type="number" name="total-{{@PRODUCT.id}}" readonly="readonly" value="0.00" class="rimtotal form-control form-control-sm text-center">
                        </td>
				</tr>
                </repeat>
            </repeat>
            {{@PLUGIN.PRODUCTS_TBL_BOTTOM | raw}}

            <tr class="products2">
                <td class="rimproducts">&nbsp;</td>
                <check if="{{@Y_EDITION == false}}">
                    <td class="rimproducts">&nbsp;</td>
                </check>
                <td class="rimproducts">&nbsp;</td>
                <td class="rimproducts rim-col-total"><span class="subtotal-text">{{@LANG_16}}: </span></td>
                <td class="rimproducts rim-col-total"><input type="number" name="subtotal" readonly="readonly" value="0" class="subtotal form-control form-control-sm text-center">
                </td>
            </tr>
        </tbody>
</table>