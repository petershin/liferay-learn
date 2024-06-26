# 시스템 리소스 관리

서버 관리 패널의 리소스 탭에는 시스템 리소스의 낮은 수준 모니터링 및 관리와 관련된 여러 기능이 포함되어 있습니다.

| 기능      | 목적                                                               |
|:------- |:---------------------------------------------------------------- |
| 시스템 정보  | Liferay DXP 버전 및 가동 시간 데이터 얻기                                    |
| 메모리 모니터 | 총 메모리 및 최대 메모리에 대해 사용된 메모리 모니터링                                  |
| 시스템 작업  | 가비지 수집기 실행 및 스레드 덤프 생성                                           |
| 캐시 액션   | 다양한 수준에서 캐시된 콘텐츠 지우기                                             |
| 확인 조치   | 데이터베이스 정확성 및 멤버십 정책 확인                                           |
| 정리 작업   | 문서 및 미디어 미리보기와 축소판을 재설정합니다. 테마 및 페이지 개정에 대한 권한 및 고아 포틀릿 환경 설정 정리 |

![서버 관리의 리소스 탭에서 여러 서버 유지 관리 작업을 실행할 수 있습니다.](./managing-system-resources/images/01.png)

## 서버 관리: 리소스 참조

**가비지 수집기 실행:** 가비지 수집기를 실행하여 메모리를 해제하도록 JVM에 지시합니다.

**스레드 덤프 생성:** 교착 상태의 존재와 사이트를 확인하기 위해 나중에 조사할 스레드 덤프를 생성합니다. 이는 성능 테스트 중에 먼저 `com.liferay.server.admin.web.internal.portlet.action.EditServerMVCActionCommand` 에 대한 로거 범주를 추가하고 `INFO`으로 설정하는 경우 유용할 수 있습니다.

**이 VM에서 캐시한 콘텐츠 지우기:** 로컬 캐시에 저장된 콘텐츠를 지웁니다. 클러스터된 Ehcache가 아닌 로컬 JVM 범위 Ehcache 콘텐츠만 지워집니다. [1](#one)

**클러스터 전체에 캐시된 콘텐츠 지우기:** 클러스터된 전체 Ehcache의 콘텐츠를 지웁니다. [1](#one)

**데이터베이스 캐시 지우기:** 데이터베이스 캐시를 지웁니다. 이는 지속성 계층의 데이터베이스 결과를 제외하고 Ehcache 콘텐츠를 지우지 않습니다. [1](#one)

**직접 서블릿 캐시 지우기:** 직접 서블릿 캐시를 지웁니다. 긴급 수정 사항을 적용해야 하는 경우 이 작업은 캐시를 수동으로 지우고 JSP를 강제로 다시 로드합니다.

직접 서블릿 컨텍스트는 애플리케이션 서버의 디스패처 체인을 통해 액세스하는 대신 생성된 서블릿을 직접 캐싱하고 액세스하여 JSP 서비스 성능을 최적화합니다. 이 기능은 JSP에 필터가 필요하지 않은 경우에만 적합합니다. 성능을 향상시키려면 프로덕션 모드에서 활성화해야 하지만 JSP 서블릿을 즉시 다시 로드할 수 있도록 개발 모드에서는 비활성화해야 합니다. 자세한 내용은 `portal.properties` 파일의 직접 서블릿 컨텍스트 섹션을 참조하십시오. [1](#one)

**회원 정책 확인:** 기존 사이트 회원 정책이 올바르게 적용되었는지 확인하고 업데이트를 자동으로 적용합니다. 데이터베이스가 수동으로 변경되거나 해킹된 경우(사이트 구성원 정책을 위반하여 사용자가 사이트에 할당됨) 이 작업은 구현된 모든 사이트 구성원 정책의 확인 방법을 트리거합니다. 위반한 멤버십은 자동으로 변경됩니다.

**문서 및 미디어에 대한 미리보기 및 썸네일 파일 재설정:** 문서 및 미디어 라이브러리에서 각 항목의 미리보기를 재생성합니다.

**정리 권한:** 게스트, 사용자 및 고급 사용자 역할에 대한 권한을 제거하여 사용자 정의 가능 페이지의 관리를 단순화합니다. 페이지에 추가 권한은 모든 포틀릿의 게스트 및 사용자 역할에서 제거되고 포털 전체에서 사용자 개인 사이트로 고급 사용자의 범위가 축소됩니다.

**고아 페이지 개정 포틀릿 환경 설정 정리:** 페이지 개정에 속하는 고아 포틀릿 환경 설정을 모두 제거합니다. 페이지 개정에 속하지 않는 포틀릿에 속하는 포틀릿 환경 설정은 제거됩니다. 런타임 포틀릿에 속하는 포틀릿 환경 설정이 제거됩니다.

**고아 테마 포틀릿 환경 설정 정리:** 테마에 의해 추가된 모든 고아 포틀릿 환경 설정을 제거합니다. 포틀릿 환경 설정이 데이터베이스에서 고립된 경우 데이터베이스 항목을 정리하십시오.

[<a name="one">1</a>] 캐싱은 여러 수준에서 발생합니다. 일부 상위 캐싱 계층은 하위 캐싱 계층을 인식하지 못합니다. 더 높은 수준의 캐시를 이미 지운 경우에도 가능한 가장 낮은(가장 세분화된) 계층에서 항상 캐시를 지웁니다.
