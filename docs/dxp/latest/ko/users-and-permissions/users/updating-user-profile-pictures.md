# 사용자 프로필 사진 업데이트

사용자는 프로필 사진을 가지고 있습니다. 관리 사용자는 사용자 편집 양식에서 이미지를 업로드할 수 있으며 사용자는 프로필 이미지를 포함한 자신의 계정 정보를 업데이트할 수 있습니다.

## 프로필 사진 업데이트

사용자 프로필 사진을 업데이트하려면 다음 단계를 따르십시오.

1. 사용자 메뉴에서 **내 프로필** 클릭하거나 관리자인 경우 **제어판** &rarr; **사용자 및 조직** 으로 이동하여 프로필 사진이 필요한 사용자를 찾습니다.
1. 일반 프로필 사진 아래의 **변경** 버튼을 클릭합니다.
1. 컴퓨터에서 이미지를 선택하고 잘라낸 다음(필요한 경우)**완료** 클릭합니다.

![사용자 편집 양식에서 사용자 아바타용 이미지를 업로드합니다.](./updating-user-profile-pictures/images/01.png)

이제 프로필 이미지가 업데이트되었습니다.

## 기본 사용자 프로필 사진 이미지 변경

사용자의 프로필 사진에 대해 명시적으로 이미지가 업로드되지 않은 경우 임의의 색상 위에 사용자의 이니셜(이름 다음에 성)로 구성된 사용자 아바타로 기본 사용자 아이콘이 할당됩니다.

![기본 사용자 프로필 사진은 임의 색상의 거품 위에 사용자 이니셜이 있는 아이콘입니다.](./updating-user-profile-pictures/images/02.png)

### 기본 사용자 프로필 이미지에 대한 이니셜 사용 비활성화

1. **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다.
1. 플랫폼 섹션에서 **사용자** &rarr; **사용자 이미지** 클릭합니다.
1. **기본 사용자 초상화에 이니셜 사용** 을 선택 취소합니다.

![기본 이니셜 기반 프로필 사진을 비활성화하면 이 아이콘이 대신 사용됩니다.](./updating-user-profile-pictures/images/03.png)

이제 기본 아이콘 대신 아이콘이 일반적인 실루엣입니다.

### 기본 사용자 프로필 이미지의 이니셜 순서 변경

기본 사용자 아이콘(사용자 이니셜 포함)은 해당 로케일에서 작동하도록 구성할 수 있습니다. 이러한 설정은 [언어 설정 모듈](../../liferay-internals/extending-liferay/customizing-localization/adding-a-language.md)에서 구성됩니다.

`lang.user.default.portrait=initials` 은 아바타에 사용할 아이콘 유형을 설정합니다. 기본값은 **이니셜** 입니다. initials로 설정하면 다음 속성은 표시할 이니셜과 순서를 구성합니다. 또는 위에 표시된 것과 동일한 이니셜이 아닌 기본 이미지를 제공하는 **image** 을 지정합니다.

`lang.user.initials.fields=first-name,last-name` 은 사용자 초상화에 나타나는 이니셜과 순서를 결정합니다. 여기서 설정은 `lang.user.default.portrait` **initials** 으로 설정된 경우에만 중요합니다.  유효한 값은 `이름`, `중간 이름`, `성`이며 이름과 성이 기본값입니다.

### 사용자 지정 기본 프로필 이미지 사용

자신의 기본 프로필 이미지를 사용할 수 있습니다.

1. .png 또는 .jpg 형식의 100x100px 정사각형 이미지를 하나 이상 만듭니다.

1. 애플리케이션 서버의 클래스 경로 어딘가에 배치하십시오. 예를 들어 Tomcat에서는 `tomcat/webapps/ROOT/WEB-INF/classes` 폴더에 배치할 수 있습니다.

1. [`Portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 파일에서 다음 속성을 설정합니다.

    ```properties
    image.default.user.portrait=image-filename-here.png
    ```

    이것은 이 포털 속성의 값을 재정의합니다.

    ```properties
    image.default.user.portrait=com/liferay/portal/dependencies/user_portrait.png
    ```

    ```{tip}
    바이너리 성별 필드를 사용하여 사용자의 성별에 대한 정보를 수집하는 경우 재정의할 두 개의 기본 이미지가 있습니다. 대신 다음 속성을 설정합니다.
    ::
    image.default.user.female.portrait=image-filename.png
    image.default.user.male.portrait=image-filename.png
    ```

1. 애플리케이션 서버를 다시 시작하십시오.

<!-- ## Related Information

* link
* link -->
