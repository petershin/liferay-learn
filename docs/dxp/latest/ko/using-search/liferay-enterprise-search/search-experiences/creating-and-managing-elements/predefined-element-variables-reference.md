# 미리 정의된 요소 변수 참조

요소 소스 편집기에서 미리 정의된 변수를 요소에 추가하려면 변수가 있을 위치에 커서를 놓은 다음 왼쪽 사이드바에서 변수를 클릭하여 삽입하십시오. Custom JSON Element에서 변수를 편집기에 직접 입력해야 합니다. 각 변수의 구문은 아래 표에 나와 있습니다.

숫자: 날씨 설명</a>에 해당하는 ID 반환</td> 

</tr> 

</tbody> </table> 

**\*** [Liferay Commerce](https://learn.liferay.com/commerce/latest/en/installation-and-upgrades/activating-liferay-commerce-enterprise.html) 를 활성화하여 Commerce 관련 변수에 액세스합니다.

**\*** 먼저 각 서비스를 활성화하여 ipstack 및 OpenWeatherMap 변수에 액세스합니다. 시스템 또는 인스턴스 설정 &rarr; 플랫폼 &rarr; 검색 경험을 방문하십시오. 사용 확인란을 클릭하고 구성 중인 서비스에 대한 구성을 저장합니다. OpenWeatherMap 서비스는 활성화된 ipstack 서비스에 따라 달라집니다. ipstack 서비스를 사용하는 예는 [개인화 검색 경험](../personalizing-the-search-experience.md) 을 참조하십시오.

**\*\*** 이러한 기본 변수 외에도 사용자 엔터티의 [사용자 정의 필드](../../../../system-administration/configuring-liferay/adding-custom-fields.md) 도 요소의 변수로 참조할 수 있습니다. 예를 들어 이름이 _Employee_ 인 사용자 정의 필드는 user.custom.field.employee</code>이 인 요소에서 참조됩니다.</p>

<h2 spaces-before="0">추가 정보</h2>

<ul>
<li><a href="./creating-elements.md">요소 생성</a></li>
<li><a href="../search-blueprints-configuration-reference.md">청사진 구성 참조 검색</a></li>
<li><a href="./managing-elements.md">요소 관리</a></li>
</ul>
