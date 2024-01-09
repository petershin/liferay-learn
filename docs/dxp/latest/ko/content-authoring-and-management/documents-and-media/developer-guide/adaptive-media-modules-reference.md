# 적응형 미디어 모듈 참조

## Adaptive Media의 모듈

Adaptive Media 앱의 일부 모듈은 필수이며 Adaptive Media가 작동하려면 활성화해야 하지만 다른 모듈은 비활성화할 수 있습니다. 다른 모듈이 사용할 패키지를 내보내는 Adaptive Media API 모듈은 필수입니다. 하나를 비활성화하면 이에 의존하는 다른 모듈도 비활성화됩니다. Adaptive Media API 모듈 목록은 다음과 같습니다.

* Liferay 적응형 미디어 API
* Liferay 적응형 미디어 콘텐츠 변환기 API
* Liferay 적응형 미디어 이미지 API
* Liferay 적응형 미디어 이미지 항목 선택기 API

Adaptive Media 핵심 모듈도 필수이며 Adaptive Media가 예상대로 작동하도록 활성화해야 합니다.

* Liferay 적응형 미디어 문서 라이브러리
* Liferay 적응형 미디어 문서 라이브러리 항목 선택기 웹
* Liferay 적응형 미디어 문서 라이브러리 웹
* Liferay 적응형 미디어 이미지 콘텐츠 변환기
* Liferay 적응형 미디어 이미지 구현
* Liferay 적응형 미디어 이미지 항목 선택기 구현
* Liferay 적응형 미디어 이미지 JS 웹
* Liferay 적응형 미디어 이미지 서비스
* Liferay 적응형 미디어 이미지 Taglib
* Liferay 적응형 미디어 이미지 웹
* Liferay 적응형 미디어 항목 선택기 웹 업로드
* Liferay 적응형 미디어 웹

블로그 항목에 업로드된 이미지를 처리하고 조정할 수 있도록 하는 적응형 미디어 블로그 모듈은 선택 사항입니다. 다음은 이러한 모듈의 목록입니다.

* Liferay 적응형 미디어 블로그 편집기 구성
* Liferay 적응형 미디어 블로그 항목 선택기 웹
* Liferay 적응형 미디어 블로그 웹
* Liferay 적응형 미디어 블로그 웹 조각

적응형 미디어 저널 모듈은 선택 사항입니다. 이 모듈은 웹 콘텐츠 기사에 Adaptive Media를 적용합니다.

* Liferay 적응형 미디어 저널 편집기 구성
* Liferay 적응형 미디어 저널 웹

Adaptive Media에는 두 가지 선택적 모듈이 더 포함되어 있습니다.

**Liferay Adaptive Media Image Content Transformer 이전 버전과의 호환성:** Adaptive Media 설치 전에 생성된 콘텐츠가 해당 콘텐츠를 수동으로 편집할 필요 없이 적응된 이미지를 사용할 수 있도록 보장합니다. 시작 시와 사용자가 콘텐츠를 볼 때 이미지를 변환하므로 성능에 부정적인 영향을 미칠 수 있습니다. 따라서 프로덕션에서 이 모듈을 사용하기 전에 몇 가지 성능 테스트를 실행하는 것이 좋습니다. 이전 콘텐츠가 없거나, 성능 문제가 있거나, 이전 콘텐츠에 조정된 이미지가 필요하지 않은 경우 이 모듈을 비활성화할 수 있습니다.

**Liferay 적응형 미디어 문서 라이브러리 썸네일:** 문서 및 미디어의 썸네일에 적응된 이미지를 사용할 수 있습니다. 이 작업을 수행하려면 먼저 원본 축소판을 적합한 이미지로 [해야 합니다](../publishing-and-sharing/using-adaptive-media/migrating-documents-and-media-thumbnails.md).
