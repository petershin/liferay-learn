---
toc:
  - ./using-adaptive-media/adding-image-resolutions.md
  - ./using-adaptive-media/managing-image-resolutions.md
  - ./using-adaptive-media/using-adapted-images-in-site-content.md
  - ./using-adaptive-media/migrating-documents-and-media-thumbnails.md
  - ./using-adaptive-media/adaptive-media-configuration-reference.md
---
# 적응형 미디어 사용

{bdg-secondary}`liferay 7.4+`

Liferay Adaptive Media는 문서 라이브러리에 저장된 이미지를 처리하여 다양한 해상도로 복사본을 생성합니다. 일단 생성되면 문서 및 미디어, 블로그, 웹 콘텐츠 및 콘텐츠 페이지에서 조정된 이미지 [적응된 이미지를 사용하세요](./using-adaptive-media/using-adapted-images-in-site-content.md) 사용하여 최종 사용자 장치에 최적의 이미지 해상도를 제공할 수 있습니다. 이렇게 하면 페이지 크기가 줄어들고 로드 시간이 향상되며 대역폭이 절약됩니다.

기본적으로 적응형 미디어에는 미리 보기(1000px 자동) 및 썸네일(300px/300px) 해상도가 포함되어 있지만 추가 해상도를 정의 [수 있습니다](./using-adaptive-media/adding-image-resolutions.md). 그런 다음 Adaptive Media는 사용자가 [지원되는 미디어 유형](./using-adaptive-media/adaptive-media-configuration-reference.md#images) 업로드할 때를 수신하고 대체 이미지 크기를 생성하기 위한 병렬 비동기 프로세스를 시작합니다. 새 이미지는 원본 이미지에 연결되고 동일한 종횡비를 유지하면서 설정된 해상도에 맞게 크기가 조정됩니다.

```{note}
Adaptive Media는 다음 상거래 위젯을 지원합니다. [수색](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/search) , [제품 상세 내역.](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/product-details) , [미니 카트 위젯 사용](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget) 및 구성 요소, [점검](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/checkout) .
```

Adaptive Media를 지원하지 않는 레거시 버전에서 최신 DXP 버전으로 업그레이드한 경우 기존 문서 및 미디어 썸네일을 새로운 Adaptive Media 정의 이미지 해상도로 마이그레이션할 수 있습니다. [문서 및 미디어 축소판 마이그레이션](./using-adaptive-media/migrating-documents-and-media-thumbnails.md) 참조하십시오.

