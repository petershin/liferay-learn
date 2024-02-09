# 파일 및 폴더 무시

Liferay Cloud를 사용하면 구독자가 서비스를 배포하기 전에 무시해야 하는 파일과 폴더를 결정할 수 있습니다. 이것은 `.lcpignore` 파일을 생성하고 프로젝트 폴더의 최상위 수준에 배치하여 수행됩니다(예: `/etc/lfrlearn/` 여기서 `lfrlearn` 는 프로젝트 이름임). 여기에 파일을 배치하면 **무시** 규칙을 다른 사용자와 공유할 수 있습니다.

## `.lcpignore` 파일 사용

1. 프로젝트 폴더의 사이트로 이동합니다.
1. `.lcpignore`이라는 파일을 만듭니다.
1. 그에 따라 파일을 수정하십시오.
1. 터미널에서 `lcp deploy` 을 실행하여 새로운 `.lcpignore` 규칙으로 서비스를 배포하십시오.

## LCP 무시 패턴

`.lcpignore` 파일은 글로빙 패턴을 사용하여 파일 이름과 일치시킵니다. (이것은 `.gitignore` 파일에서 사용된 것과 동일한 패턴입니다.) 관리자는 다양한 기호를 사용하여 이러한 패턴을 구성할 수 있습니다.
슬래시가 추가된</em> 이 아닌 *인 경우 패턴은 해당 이름을 가진 파일과 폴더의 내용을 모두 일치시킵니다. 왼쪽의 예제 일치에서 이름이 `txts` 인 폴더와 파일은 모두 무시됩니다.</td> </tr> 

</tbody> </table> 

가장 좋은 방법은 `.lcpignore` 파일을 프로젝트의 최상위 폴더에 보관하는 것입니다. 리포지토리에 `.lcpignore` 파일이 여러 개 있는 경우(권장하지 않음) Liferay Cloud는 파일을 통합 문서로 읽습니다.



```{note}
파일 또는 폴더가 배포되었고 관리자가 나중에 이를 무시하려는 경우 후속 규칙에서 해당 파일 또는 폴더를 포함하려고 하면 Liferay Cloud는 파일을 무시하지 않습니다. 오히려 해당 파일이나 폴더는 업데이트되지 않습니다.
```




## 관련 주제

* [Liferay DXP 서비스 사용](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md)
* [Liferay 서비스 구성](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
