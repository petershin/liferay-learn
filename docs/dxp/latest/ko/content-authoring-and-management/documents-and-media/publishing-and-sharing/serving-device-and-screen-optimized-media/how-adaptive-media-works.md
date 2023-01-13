# 적응형 미디어 작동 방식
<!--TASK: Use as section intro, Adaptive Media. -->
미디어 제공자는 콘텐츠를 제공할 때 장치(휴대폰, 노트북, 태블릿 등) 간의 차이점을 고려해야 합니다. 화면 크기뿐만 아니라 대역폭과 처리 능력도 마찬가지입니다. Adaptive Media는 이미지 품질을 제어하고 사용 중인 화면에 가장 잘 맞도록 업로드된 미디어를 동적으로 조정할 수 있습니다.

Adaptive Media는 문서 및 미디어, 블로그, 웹 콘텐츠 및 콘텐츠 페이지(Liferay DXP 7.4+부터 시작)와 통합됩니다. 다양한 화면에서 사용할 이미지 세트를 생성합니다. 콘텐츠에 액세스하면 Adaptive Media가 화면 유형과 해상도를 확인하고 적절한 이미지를 선택합니다. Adaptive Media는 DXP에 사전 설치되어 제공됩니다.

```{note}
Adaptive Media는 다음 상거래 위젯에 대해 OOTB를 사용할 수 있습니다. [검색 결과](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/search.html), [ 제품 세부 정보, 제품 게시자](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/product-details.html), [미니 카트 위젯](https: //learn.liferay.com/commerce/latest/en/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget.html) 및 구성 요소, [Checkout](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/checkout.html).
```

여기서는 적응형 미디어에 대해 알아보고 이미지를 처리하도록 준비하는 방법을 알아봅니다. <!--Q: What about other assets? -->

Adaptive Media를 사용하려면 먼저 사용자의 장치에 전달되는 이미지의 해상도를 정의해야 합니다. 그런 다음 Adaptive Media는 원래 종횡비를 유지하면서 해당 해상도에 맞게 조정된 새 이미지를 생성합니다. 새 이미지 해상도 생성에 대한 자세한 내용은 [이미지 해상도 추가](./adding-image-resolutions.md) 을 참조하십시오.

위에서 언급했듯이 다양한 유형의 콘텐츠에서 적응된 이미지를 사용할 수 있습니다. [사이트 콘텐츠](./using-adapted-images-in-site-content.md)에서 적응된 이미지 사용을 참조하십시오.

적응형 미디어 이미지 해상도를 관리하려면 [이미지 해상도 관리](./managing-image-resolutions.md)를 참조하십시오.

최신 DXP 버전으로 업그레이드했고 Adaptive Media를 지원하지 않는 레거시 버전을 사용하고 있었다면 기존 문서 및 미디어 썸네일을 새로운 Adaptive Media 정의 이미지 해상도로 마이그레이션할 수 있습니다. [문서 및 미디어 축소판 마이그레이션](./migrating-documents-and-media-thumbnails.md)을 참조하십시오.

## 추가 정보

* [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md)
* [적응형 미디어 모듈 참조](../../developer-guide/adaptive-media-modules-reference.md)
