# 익명 사용자 구성

인터넷 사용자는 자신이 사용하는 시스템에서 자신의 개인 데이터가 처리되는 방식에 대해 점점 더 많은 관심을 기울이고 있습니다. Liferay는 사용자 데이터 관리를 처리하기 위한 기능의 필요성을 인식하고 있습니다. [사용자 데이터 삭제](./sanitizing-user-data.md#the-personal-data-erasure-screen) 은 **잊혀질 권리** 요청을 존중하는 가장 안전한 방법입니다.

사용자 데이터를 보존해야 하는 경우 데이터의 자동 익명화가 필요합니다. 익명화된 사용자는 상호 작용한 콘텐츠에서 식별자(예: 사용자 ID 및 사용자 이름)를 제거해야 합니다. 일반적으로 포털 콘텐츠가 해당 응용 프로그램이 제대로 작동하려면 이 정보가 필요하므로 사용자의 식별자는 무언가 또는 누군가로 대체되어야 합니다. 그 사람은 **Anonymous Anonymous** 입니다. 이 비활성화된 사용자는 익명 콘텐츠에 식별자가 할당된 사용자가 됩니다. 이 신원 교환은 익명화 프로세스에서 중요한 단계이지만 실제로 익명화를 달성하려면 추가적인 수동 개입이 필요할 수 있습니다.

![익명화된 콘텐츠는 User Anonymous Anonymous의 식별 정보와 함께 제공됩니다.](./configuring-the-anonymous-user/images/01.png)

새 사용자를 익명 사용자로 설정하는 가장 쉬운 방법은 기존 익명 사용자 구성을 편집하여 다른 사용자 ID를 전달하는 것입니다.

기존 구성을 편집하려면

1. 제어판 &rarr; 구성 &rarr; 인스턴스 설정 &rarr; 사용자 &rarr; 익명 사용자로 이동합니다.

1. 다른 사용자 ID를 제공하여 기존 구성을 편집하십시오.

   제어판 &rarr; 사용자 &rarr; 사용자 및 조직에서 사용자 ID를 가져옵니다. 사용자를 클릭하고 사용자 편집 화면의 사용자 표시 데이터 섹션에서 사용자 ID를 찾습니다.

1. **업데이트** 을 클릭합니다.

완전히 새로운 익명 사용자를 생성하려면 먼저 데이터 익명화에 사용할 사용자 [을 생성](../users/adding-and-managing-users.md) 다음 위에서 설명한 것과 동일한 단계를 따릅니다.

각 인스턴스에 대해 구성된 익명 사용자는 하나만 있을 수 있습니다.

![제어판의 인스턴스 설정에서 자신의 익명 사용자를 할당하십시오.](./configuring-the-anonymous-user/images/02.png)

## 구성 파일 사용

모든 시스템 설정 및 인스턴스 설정과 마찬가지로 제어판 UI에서 작업하는 대신 `.config` [파일](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) 을 `[Liferay Home]/osgi/configs/` 에 배포할 수 있습니다. 이렇게 하려면 [개의 공장 구성](../../system-administration/configuring-liferay/configuration-files-and-factories/using-factory-configuration.md) 파일을 활용합니다. 패턴을 따르는 파일을 사용하여 각 가상 인스턴스에 대한 익명 사용자를 생성합니다.

```bash
com.liferay.user.associated.data.web.internal.configuration.AnonymousUserConfiguration.scoped-[uniqueId].config
```

```{tip}
구성 파일의 `-subname`으로 각 가상 인스턴스에 대한 웹 ID 또는 인스턴스 ID(회사 ID와 동일)를 사용하면 파일을 한눈에 구별할 수 있습니다.
```

다음과 같은 내용을 제공하십시오.

```properties
companyId=20098
userId=36059
```

[가상 인스턴스](../../system-administration/configuring-liferay/virtual-instances.md)에 대해 `개의 companyId` 을 찾으려면 제어판 &rarr; 시스템 &rarr; 가상 인스턴스로 이동합니다. 테이블에 표시된 인스턴스 ID는 구성 파일에서 사용할 `companyId` 입니다.

```{note}
`구성 파일에 추가 필드가 있는 이유는 무엇입니까?`

구성 파일로 익명 사용자를 구성할 때 인스턴스의 회사 ID를 제공해야 합니다. 인스턴스 설정에서 구성은 구성 중인 인스턴스에 이미 연결되어 있지만 구성 파일은 시스템 범위에 배포되므로 적용되는 인스턴스의 ID를 포함해야 합니다.
```
