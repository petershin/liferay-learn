# 포털 개발자 속성

개발을 용이하게 하는 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 이 있습니다. Liferay의 [`Portal-developer.properties`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-impl/src/portal-developer.properties) 파일에는 모두 포함되어 있습니다. `portal-developer.properties` 파일은 이 설정을 `portal-ext.properties` 파일의 맨 위에 추가하여 활성화됩니다.

```properties
include-and-override=portal-developer.properties
```

## 개발자 설정

| 개발자 설정                                                        | 묘사                                                                                                                                                                        |
|:------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 스키마.모듈.빌드.자동.업그레이드=참                                          | 마지막 배포 이후 모듈의 빌드 번호가 증가하면 데이터베이스를 자동으로 업그레이드합니다.                                                                                                                          |
| 업그레이드.데이터베이스.자동.실행=참                                          | 포털이 시작되고 모듈이 활성화되면 업그레이드 프로세스를 실행합니다.                                                                                                                                     |
| theme.css.fast.load=false                                     | 디버깅을 용이하게 하기 위해 테마의 CSS 파일 병합을 비활성화합니다.                                                                                                                                   |
| theme.images.fast.load=false                                  | 디버깅을 용이하게 하기 위해 테마의 이미지 파일 병합을 비활성화합니다.                                                                                                                                   |
| javascript.fast.load=참                                        | OSGi 번들 매니페스트 파일의 속성 `Liferay-JS-Resources-Top-Head` 및/또는 `Liferay-JS-Resources-Top-Head-Authenticated` 에 나열된 파일의 압축 버전 로드를 비활성화합니다.                                      |
| javascript.log.enabled=거짓                                     | JavaScript 로깅 표시를 비활성화합니다.                                                                                                                                                |
| layout.template.cache.enabled=false                           | 캐싱 레이아웃 템플릿 콘텐츠를 비활성화합니다.                                                                                                                                                 |
| 콤보.체크.타임스탬프=참                                                 | 콤보 서블릿을 비활성화하여 디버깅을 용이하게 합니다. 자세한 내용은 [`combo.check.timestamp`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Combo) 정의를 참조하십시오. |
| json.service.serialize.throwable=참                            | JSON 응답에서 서버 오류에 대한 정보를 반환합니다.                                                                                                                                            |
| 축소기.활성화=거짓                                                    | CSS 및 JavaScript 리소스 축소를 활성화합니다.                                                                                                                                          |
| module.framework.properties.initial.system.check.enabled=true | 서버 시작 중에 모듈을 확인합니다.                                                                                                                                                       |
| module.framework.properties.osgi.console=localhost:11311      | 디버깅 모듈에 대한 콘솔 액세스를 활성화합니다.                                                                                                                                                |
| work.dir.override.enabled=true                                | Liferay 작업 디렉토리를 사용하여 배포된 OSGi 번들 내에서 JSP 파일을 재정의할 수 있습니다.                                                                                                                |

## 관련 주제

* [문맥 재산](../../installation-and-upgrades/reference/portal-properties.md)