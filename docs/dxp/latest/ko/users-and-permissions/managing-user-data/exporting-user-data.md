# 사용자 데이터 내보내기

일반 데이터 보호 규정(GDPR)의 신조 중 하나는 사용자가 **데이터 이식성에 대한 권리가 있다는 것입니다** .

데이터 이식성은 사용자가 개인 데이터를 기계가 읽을 수 있는 형식으로 받을 권리가 있음을 의미합니다.

제어판의 사용자 관리 시스템은 기본적으로 다운로드를 위해 사용자의 개인 데이터를 ZIP 파일로 내보내는 것을 지원합니다. 형식은 XML 형식입니다.

## 내보내기 및 다운로드

사용자 데이터를 내보내려면

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다.

1. **제어판** &rarr; **사용자** &rarr; **사용자 및 조직** 로 이동합니다.

1. 사용자를 찾고 작업 버튼(![Actions](../../images/icon-actions.png))을 클릭한 다음 **개인 데이터 내보내기** 를 클릭합니다.

   그러면 사용자의 개인 데이터 내보내기 화면이 열립니다.

1. 표시된 기존 내보내기 프로세스가 없으면 **추가** 버튼(![Add](../../images/icon-add.png))을 클릭합니다. 사용자 데이터 내보내기 도구가 나타납니다.

   ![개인 데이터 내보내기 도구를 사용하면 사용자 데이터의 전부 또는 일부를 내보낼 수 있습니다.](./exporting-user-data/images/01.png)

1. 대부분의 경우 사용 가능한 모든 데이터를 내보내려고 합니다. **항목 선택** 을 클릭하면 사용자 데이터가 포함된 모든 애플리케이션이 UI에서 선택됩니다.

1. **내보내기** 을 클릭합니다. 사용자의 개인 데이터 내보내기 화면으로 돌아가지만 이제 목록에 내보내기 프로세스가 있습니다.

   ![사용자 데이터가 성공적으로 내보내지면 사용자의 개인 데이터 내보내기 목록에 내보내기 프로세스가 나타납니다.](./exporting-user-data/images/02.png)

1. 데이터를 다운로드합니다. 프로세스에 대한 작업 버튼(![Actions](../../images/icon-actions.png))을 클릭하고 **다운로드** 를 선택합니다.

## 내보낸 데이터 검토

내보낸 데이터는 다음과 같습니다.

```xml
<?xml 버전="1.0"?>

<model>
    <model-name>com.liferay.message.boards.model.MBMessage</model-name>
    <column>
        <column-name>messageId</column-name>
        <column-value><![CDATA[38099]]></column-value>
    </column>
    <column>
        <column-name>statusByUserId</column-name>
        <column-value><![CDATA[38045]]></column-value>
    </column>
    <column>
        <column-name>statusByUserName</column-name>
        <column-value><![CDATA[Jane Slaughter]]></column-value>
    </column>
    <column>
        <column-name>사용자 ID</column-name>
        <column-value><![CDATA[38045]]></column-value>
    </column>
    <column>
        <column-name></column-name>        <column-value>이름
<![CDATA[Jane Slaughter]]></column-value>
    </column>
    <column>
        <column-name>주제</column-name>
        <column-value><![CDATA[훌륭한 목록. 가족을 데려올 생각이었는데...]]></column-value>
    </column>
    <column>
        <column-name>body</column-name>
        <column-value><![CDATA[<p>훌륭한 목록입니다. 나는 가족을&올 생각을 하고 있었지만, 실제로 인간이 달에 간 적이 있다고는 전혀 믿지 않기 때문에 여행을 예약하는 것은 어리석은

  될 것 같습니다! ㅋㅋㅋ!</p>]]></column-value>
    </column>
</model>
```

이 예에서 사용자 Jane Slaughter는 Message Boards Message 게시물을 작성했고 그녀의 사용자 정보는 `MBMessage` 모델의 데이터베이스 테이블에 기록되었습니다.

이것은 실제로 블로그 항목에 대한 설명과 일치합니다.

![블로그 게시물에 대한 댓글은 사용자 관련 데이터입니다.](./exporting-user-data/images/03.png)

사용자 데이터 내보내기는 사이트 소유자와 사용자에게 사이트에 포함된 개인 데이터의 양을 알려줍니다.
