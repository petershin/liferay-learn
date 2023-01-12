# 데이터 소스 관리

Liferay DXP [을 작업 공간에 연결](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) 후 설정 페이지에서 보고 변경할 수 있습니다. *설정* &rarr; *작업 공간 데이터* &rarr; *데이터 소스*로 이동합니다.

![설정에서 연결된 데이터 소스 목록을 확인하세요.](./managing-data-sources/images/01.png)

Liferay DXP 인스턴스를 아직 연결하지 않은 경우 Liferay DXP를 Analytics Cloud</a>에 연결하는

을 참조하십시오.</p> 

Liferay DXP 데이터 소스를 보거나 변경하려면 연결된 데이터 소스의 이름을 클릭하십시오.

![데이터 소스 이름을 클릭하면 새 페이지가 열립니다.](./managing-data-sources/images/02.png)

오른쪽의 현재 상태 패널은 데이터 소스의 상태를 보여줍니다. **활성** 연결 및 동기화 데이터 소스; 사이트 및 연락처가 구성되지 않은 연결된 데이터 원본의 경우 **연결됨** ; **연결 끊김** 더 이상 연결되지 않은 데이터 소스. 

**이름:** 데이터 소스의 이름입니다. 이름을 바꾸려면 수정 아이콘(![Edit](../images/icon-edit.png))을 클릭하고 새 이름을 입력합니다. 저장하려면 확인 표시를 클릭합니다.

**DXP 인스턴스 ID:** DXP 인스턴스의 고유 ID를 표시합니다. 

DXP 인스턴스를 작업 공간에서 연결 해제하도록 선택한 경우 *연결 해제* 버튼을 클릭합니다. 확인하라는 메시지가 표시됩니다. 데이터 소스의 연결을 끊으면 분석 데이터의 모든 동기화가 중지됩니다.

**동기화된 사이트:** DXP 사이트와 Analytics Cloud의 동기화 상태를 표시합니다. 구성하려면 [속성에 사이트 동기화](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-sites-to-a-property)을 참조하십시오.

**동기화된 연락처:** Analytics Cloud와의 DXP 연락처 동기화 상태를 보여줍니다. 구성하려면 [속성에 연락처 동기화 참조](../workspace-settings/scoping-sites-and-individuals-using-properties.md#syncing-contacts-to-a-property)



## 데이터 소스 삭제

데이터 소스를 삭제하려면 페이지 우측 상단의 *데이터 소스 삭제* 버튼을 클릭합니다. 확인하라는 메시지가 표시됩니다. 데이터 소스를 삭제하면 연결이 제거되고 모든 동기화된 데이터가 삭제됩니다.
