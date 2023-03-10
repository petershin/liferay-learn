# 기술 자료 ZIP 파일 요구 사항

기술 자료 가져오기 도구는 문서 계층 구조를 지원하므로 Markdown 파일은 ZIP 파일의 디렉터리 구조 어디에나 지정할 수 있습니다. 여러 폴더에 중첩될 수 있습니다. 이미지 파일은 첨부 파일이 지원되는 유일한 파일입니다.

```{note}
가져온 기사는 워크플로 설정과 무관합니다. 즉, 가져온 문서가 자동으로 승인됩니다.
```

자신의 역할에 기사 가져오기 권한이 할당된 사용자만 기사를 가져올 수 있습니다. 이 권한은 제어판 &rarr; 사용자 &rarr; 역할을 통해 수동으로 할당할 수 있습니다.

ZIP 파일의 기사는 파일 순서(영숫자순)로 가져옵니다. 기사의 우선 순위를 지정하려면 파일 이름에 숫자 접두어를 추가하십시오. 예를 들어 `01-file.markdown` 및 `02-file.markdown` 이라는 기사의 우선순위는 `1.0` 및 `2.0`이 됩니다.

기사를 동일한 소스 폴더에 있는 다른 모든 기사의 상위로 지정하려면 파일 이름 끝에 `-intro.markdown`을 붙입니다. 이렇게 하면 부모-자식 계층이 생성됩니다. 상위 기사에 접두어 `00` 을 사용하여 폴더 파일 순서의 맨 위에 배치할 수 있습니다. 가져오기 도구는 인트로 파일 폴더의 숫자 접두어를 기사 우선 순위로 사용합니다.

다음은 `00` 접두사에 대한 기본 논리입니다.

* 소개 파일이 아닌 파일의 파일 접두어 `00` 은 결과 기사의 우선순위를 `1.0`으로 할당합니다.
* 최상위 소개 파일의 파일 접두어 `00` 은 아티클의 우선 순위를 `1.0` 이상인 발견된 첫 번째 폴더 숫자 접두어로 설정합니다.

이 규칙을 사용하면 계층 구조의 최상위(자식 아님) 기사에 대한 우선 순위를 지정할 수 있습니다.

가져올 때 **기사 파일의 숫자 접두어를 우선순위로 적용** 확인란을 선택한 상태로 유지합니다. 파일에 접두어가 없는 경우 해당 아티클은 사용 가능한 다음 우선 순위(현재 가장 높은 우선 순위에 1을 더함)를 가져옵니다.

다음은 지금까지 언급한 기능을 보여주는 ZIP 파일 구조의 예입니다.

ZIP 파일 구조 예:

* `01-winter-olympics/`
    * `00-winter-events-intro.markdown`
    * `01-speed-skating.markdown`
    * `02-bobsleigh.markdown`
* `02-summer-olympics/`
    * `00-summer-events-intro.markdown`
    * `01-swimming.markdown`
    * `02-gymnastics.markdown`
    * `03-track-and-field/`
        * `00-track-and-field-intro.markdown`
        * `01-marathon.markdown`
* `images/`
    * `some-image.png`
    * `another-image.jpeg`

위의 ZIP 파일은 `00-winter-events-intro.markdown` 을 인접한 Markdown 파일( `01-speed-skating.markdown` 및 `02-bobsleigh.markdown`)의 부모로 지정합니다. 마찬가지로 `00-track-and-field-intro.markdown` 은 `01-marathon.markdown`의 부모입니다. `00-track-and-field-intro.markdown` 은 `01-swimming.markdown` 및 `02-gymnastics.markdown`의 피어이자 `00-summer-events-intro.markdown`의 자식이기도 합니다.

ZIP 예제의 결과 관계 및 우선 순위:

* `01-winter-olympics/00-winter-events-intro.markdown`
    * 기사: 겨울 이벤트
    * 관계: 여름 이벤트의 동료
    * 우선순위: 1.0
* `01-winter-olympics/01-speed-skating.markdown`
    * 기사: 스피드 스케이팅
    * 관계: 겨울의 아이 이벤트
    * 우선순위: 1.0
* `01-winter-olympics/02-bobsleigh.markdown`
    * 기사: 봅슬레이
    * 관계: 겨울의 아이 이벤트
    * 우선순위: 2.0
* `02-summer-events/00-summer-events-intro.markdown`
    * 기사: 여름 이벤트
    * 관계: 여름 이벤트의 동료
    * 우선순위: 2.0
* `02-summer-events/01-swimming.markdown`
    * 기사: 수영
    * 관계: 여름 이벤트의 자식
    * 우선순위: 1.0
* `02-summer-events/02-gymnastics.markdown`
    * 기사: 체조
    * 관계: 여름 이벤트의 자식
    * 우선순위: 2.0
* `02-summer-events/03-summer-olympics/00-track-and-field-intro.markdown`
    * 기사: 육상
    * 관계: 여름 이벤트의 자식
    * 우선순위: 3.0
* `02-summer-events/03-summer-olympics/01-marathon.markdown`
    * 기사: 마라톤
    * 관계: 여름 이벤트의 손자
    * 관계: 육상의 자식
    * 우선순위: 1.0

ZIP 파일은 다음 요구 사항을 충족해야 합니다.

* 각 ZIP 파일은 접미사 `.zip`로 끝나야 합니다.
* 각 ZIP 파일에는 하나 이상의 마크다운 소스 파일이 포함되어야 하며 선택적으로 폴더로 구성됩니다.
* 참조된 모든 이미지 파일은 ZIP 파일의 루트에 있는 `images` 폴더에 있어야 합니다.
* 이미지 파일은 지원되는 형식이어야 하며 적절한 파일 확장자를 사용해야 합니다. 지원되는 확장자는 `.bmp`, `.gif`, `.jpeg`, `.jpg`및 `.png`입니다. 앱 시스템 설정을 통해 지정됩니다. 자세한 내용은 [지식 베이스 시스템 설정](knowledge-base-system-settings.md)을 참조하십시오.

기사 ZIP 파일이 있으면 가져올 차례입니다. ZIP 파일을 가져오려면

1. 메뉴 아이콘(![Menu icon](../../images/icon-menu.png))을 클릭하고 콘텐츠 및 데이터 &rarr; 지식 베이스 &rarr; 기사로 이동합니다.

1. 추가 아이콘(![Add icon](../../images/icon-add.png))을 클릭하고 **가져오기** 를 클릭합니다.

    ![이 새 페이지에 ZIP 파일을 업로드하세요.](./knowledge-base-zip-file-requirements/images/01.png)

1. **파일** 선택을 클릭하고 가져올 ZIP 파일을 찾습니다. 그런 다음 **저장** 을 클릭합니다.

파일이 업로드되고 가져오기 도구가 각 소스 파일의 Markdown 텍스트를 HTML로 변환하여 결과 문서에 HTML을 적용합니다. 기사에서 참조되고 ZIP 파일에 포함된 모든 이미지 파일은 기사에 대한 첨부 파일로 가져옵니다.

소스 파일 및 이미지 외에도 소스 파일의 리포지토리 사이트를 지정하는 가져오기 도구에 대한 기본 소스 URL 시스템 설정을 구성할 수 있습니다. 각 기사의 **GitHub에서 편집** 버튼(활성화된 경우)은 사용자를 소스 사이트로 이동시킵니다. 임포터는 각 파일의 경로에 기본 소스 URL을 붙입니다. 이것은 기사의 저장소 소스 사이트에 대한 URL을 구성합니다. `[기본 URL]/[기사 파일 경로]`처럼 보입니다. 다음은 기본 소스 URL의 예입니다.

    https://github.com/liferay/liferay-docs/blob/master/develop/tutorials

이 기본 URL과 기사 소스 파일 `folder-1/some-article.markdown` 에서 구성된 소스 URL은 다음과 같습니다.

    https://github.com/liferay/liferay-docs/blob/master/develop/tutorials/folder-1/some-article.markdown

ZIP 파일의 루트 폴더에 있는 `.METADATA` 이라는 파일에 기본 소스 URL을 지정합니다. 임포터는 `.METADATA` 파일을 표준 Java 속성 파일로 취급하고 기본 소스 URL을 사용하여 모든 ZIP 파일의 결과 기사에 대한 소스 URL을 구성합니다.

소스 URL 기능을 사용하려면 관리자가 [기술 자료 시스템 설정](knowledge-base-system-settings.md)을 통해 활성화해야 합니다.
