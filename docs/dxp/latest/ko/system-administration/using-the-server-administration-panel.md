---
toc:
  - using-the-server-administration-panel/managing-system-resources.md
  - using-the-server-administration-panel/configuring-logging.md
  - using-the-server-administration-panel/configuring-external-services.md
  - using-the-server-administration-panel/configuring-a-shutdown-event.md
---
# 서버 관리 패널 사용

서버 관리는 다양한 저수준 Liferay DXP 구성을 포함하는 시스템 범위 관리 패널입니다. 서버 관리에서 시스템 메모리 사용량, 하위 수준 속성, 일부 타사 통합, 문서 리포지토리 마이그레이션, 로깅, 스크립팅, 메일 서버 구성 및 포털 종료를 관리하고 모니터링할 수 있습니다.

**제어판** &rarr; **구성** &rarr; **서버 관리** 클릭하여 서버 관리에 액세스할 수 있습니다.

![서버 관리의 리소스 탭에는 서버의 메모리 사용량 그래프가 표시됩니다.](using-the-server-administration-panel/images/01.png)

Server Administration의 기능은 탭으로 구분됩니다.

| 서버 관리 탭      | 묘사                                                                                                                                                                                                                                                                     | 문서 링크                                                                                 |
|:------------ |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------------- |
| 자원           | 시스템 모니터링 및 관리 작업 수행(가비지 수집기 실행, 데이터베이스 캐시 지우기 등)                                                                                                                                                                                                                       | [시스템 리소스 관리](./using-the-server-administration-panel/managing-system-resources.md)    |
| 통나무는 수평하게 한다 | 로깅 수준을 보고 설정합니다. Liferay DXP 클래스 및 패키지에 대한 로그 수준을 수정합니다. 로깅 구성에 사용자 지정 개체를 추가합니다.                                                                                                                                                                                      | [로깅 구성](./using-the-server-administration-panel/configuring-logging.md)               |
| 재산           | 시스템 및 포털 속성을 봅니다. 시스템 속성은 JVM 및 Liferay DXP에 대한 시스템 속성을 보여주며 실행 중인 구성을 디버깅하거나 확인할 때 사용됩니다. 포털 속성은 현재 포털 속성 값을 보여줍니다. 자세한 내용은 [포털 속성 참조 문서](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 참조하세요.                              | [문맥 재산](../installation-and-upgrades/reference/portal-properties.md)                  |
| 자료 이동        | 한 리포지토리에서 다른 리포지토리로 문서를 마이그레이션합니다. 예를 들어 문서를 다른 디스크의 새 저장소나 새 형식으로 마이그레이션할 수 있습니다.                                                                                                                                                                                     | [파일 스토리지 마이그레이션](file-storage/file-store-migration.md)                                |
| 메일           | [포털 속성 파일](../installation-and-upgrades/setting-up-liferay/configuring-mail/alternative-email-configuration-methods.md#configuring-the-built-in-mail-session-using-portal-properties) 대신 이 탭에서 메일 서버를 구성할 수 있습니다. 이러한 설정은 `Portal-ext.properties` 파일의 메일 서버 설정을 재정의합니다. | [메일 구성](../installation-and-upgrades/setting-up-liferay/configuring-mail.md)          |
| 외부 서비스       | 이미지, 오디오 파일 및 비디오 파일에 대한 파일 미리 보기를 생성하기 위한 외부 서비스를 구성합니다.                                                                                                                                                                                                              | [외부 서비스 구성](./using-the-server-administration-panel/configuring-external-services.md) |
| 원본           | 마이그레이션 또는 관리 코드를 실행하기 위해 스크립팅 콘솔에서 Groovy 스크립트를 작성합니다.                                                                                                                                                                                                                 | [스크립트 엔진 사용](./using-the-script-engine.md)                                            |
| 폐쇄           | 로그인한 사용자에게 임박한 종료를 경고하는 종료를 예약합니다(지금부터 **x** 분 후).                                                                                                                                                                                                                       | [종료 이벤트 구성](./using-the-server-administration-panel/configuring-a-shutdown-event.md)  |
