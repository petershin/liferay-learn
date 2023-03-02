---
uuid: fb7b68cb-a0a1-4a22-9234-208053f927a7
---

# 구성 분류

구성 인터페이스를 등록하면 애플리케이션의 UI가 *시스템 설정* &rarr; *플랫폼* &rarr; *타사*에 생성됩니다. 애플리케이션의 설정 UI가 표시되는 다른 섹션과 카테고리를 선호하는 경우 쉽게 변경할 수 있습니다.

## 기존 범주 지정

사용 가능한 시스템 설정 섹션은 다음과 같습니다. 범주는 다음 섹션 아래에 중첩됩니다.

* 커머스
* 플랫폼
* 보안
* 컨텐츠 및 데이터
* 기타

구성 인터페이스에 `@ExtendedObjectClassDefinition` 주석을 배치하여 UI에 대한 범주를 지정합니다. 예를 들어 블로그 아래에 UI를 배치하려면 `@Meta.OCD` 주석 위에 다음 줄을 추가합니다.

```java
@ExtendedObjectClassDefinition(category = "blogs")
```

`@ExtendedObjectClassDefinition` 클래스를 가져옵니다.

```java
import com.liferay.portal.configuration.metatype.annotations.ExtendedObjectClassDefinition
```

애플리케이션을 재배포하면 구성 UI가 이제 *Content and Data* &rarr; *Blogs*아래에 있습니다.

## 새 섹션 및 범주 만들기

고유한 섹션과 범주를 선호하는 경우 `ConfigurationCategory` 인터페이스를 구현하여 만들 수 있습니다.

[구성 설정 및 액세스](./setting-and-accessing-configurations.md)의 예제 프로젝트를 따랐다면 이 코드를 애플리케이션의 `구성` 폴더에 추가할 수 있습니다. 이는 구성 인터페이스 Java 파일을 보유하는 동일한 폴더입니다. 아래 코드는 foobar 섹션과 foobar 카테고리를 생성합니다.

```java
package com.acme.n2f3.web.internal.configuration;

import com.liferay.configuration.admin.category.ConfigurationCategory;

import org.osgi.service.component.annotations.Component;

@Component(service = ConfigurationCategory.class)
public class N2F3WebConfigurationCategory implements ConfigurationCategory {

    @Override
    public String getCategoryIcon() {
        return _CATEGORY_ICON;
    }

    @Override
    public String getCategoryKey() {
        return _CATEGORY_KEY;
    }

    @Override
    public String getCategorySection() {
        return _CATEGORY_SECTION;
    }

    private static final String _CATEGORY_ICON = "foobar";

    private static final String _CATEGORY_KEY = "foobar";

    private static final String _CATEGORY_SECTION = "foobar";

}
```

샘플 프로젝트의 구성 인터페이스에서 `@ExtendedObjectClassDefinition` 주석을 `category = "n2f3"` 에서 `category = "foobar"`로 변경합니다.

사용자 지정 섹션 및 범주에 대한 언어 키도 현지화 파일에 지정해야 합니다. 위 예제의 경우 포틀릿의 `src/main/resources/content/` 폴더에 있는 `Language.properties` 파일에 다음 키를 추가합니다.

```properties
category.foobar=Foobar
category-section.foobar=Foobar
```

샘플 프로젝트를 재배포하여 변경 사항을 확인하세요.

![이제 구성 UI가 맞춤 카테고리에 있습니다.](./categorizing-a-configuration/images/01.png)

애플리케이션의 구성 UI는 이제 사용자 정의 섹션 및 사용자 정의 범주에 있습니다.
