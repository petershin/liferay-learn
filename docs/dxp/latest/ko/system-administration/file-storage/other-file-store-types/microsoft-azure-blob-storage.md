# Microsoft Azure Blob 스토리지 서비스

> 7.4+ 및 7.3 FP2+에서 사용 가능

Microsoft Azure Blob Storage는 DXP의 Azure Blob Storage Store에서 파일을 클라우드에 원활하게 저장하는 데 사용하는 클라우드 기반 스토리지 솔루션입니다. 내부적으로는 엄청난 양의 구조화되지 않은 데이터를 처리하도록 최적화된 Microsoft의 Blob Storage API를 사용합니다.

이 연결을 활성화하기 전에 활성 [Azure Blob Store 계정](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal), 구성된 [연결 문자열](https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string)및 [Azure Blob 컨테이너](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-container-create?tabs=dotnet)가 있어야 합니다.

그런 다음 다음을 수행하여 Liferay 인스턴스에 대한 연결을 활성화하십시오.

* [제어판을 통해 파일 저장 방법 구성](#configuring-the-store)
* Azure Blog Storage</a> 을 기본 스토리지 방법으로 사용하도록
`dl.store.impl` 포털 속성을 설정합니다.</li> </ul> 
  
  

```{warning}
문서 라이브러리에서 데이터베이스 트랜잭션 롤백이 발생하면 트랜잭션의 파일 시스템 변경 사항이 취소되지 않습니다. 문서 라이브러리 파일과 파일 시스템 저장소의 파일 간에 불일치가 발생할 수 있으며 수동 동기화가 필요할 수 있습니다. DBStore를 제외한 모든 DXP 스토어는 이 제한에 취약합니다.
```




## 상점 구성

상점을 구성하려면 다음 단계를 따르십시오.

1. *전역 메뉴 열기* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *제어판* &rarr; *시스템 설정* &rarr; *파일 저장소* &rarr; *Azure Blob 저장소*.
   
   ![연결 문자열 및 컨테이너 이름으로 빈칸을 채우십시오.](./microsoft-azure-blob-storage/images/01.png)

1. Azure Blob 저장소 저장소에 대해 [연결 문자열](https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string) 을 입력합니다.

1. 파일을 저장하는 데 사용할 [Azure Blob 컨테이너](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-container-create?tabs=dotnet) 의 이름을 입력합니다.

1. 필요에 따라 파일 저장을 위해 [암호화 범위](https://docs.microsoft.com/en-us/azure/storage/blobs/encryption-scope-overview) 을 입력합니다.

1. 선택적으로 HTTP 로깅을 활성화할지 여부를 결정합니다. 사용하도록 설정하면 Azure 클라이언트에서 수행한 HTTP 요청 및 응답이 서버 로그에 인쇄됩니다.

Azure Blob 저장소 저장소를 구성한 후에는 기본 파일 저장소 시스템으로 설정할 수 있습니다.



## Azure Blog Storage를 기본 저장소로 설정

Azure Blog Storage를 Liferay 인스턴스의 기본 저장소로 사용하려면 다음 단계를 따르세요.

1. 인스턴스의 [`Portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md) 파일에 다음 속성을 추가합니다. 
   
   

   ```properties
   dl.store.impl=com.liferay.portal.store.azure.AzureStore
   ```


`portal-ext.properties` 파일이 없으면 위의 값으로 새 파일을 만들고 인스턴스의 [`[LIFERAY_HOME]`](../../../installation-and-upgrades/reference/liferay-home.md) 또는 `[USER_HOME]` 폴더에 추가합니다.

이는 `portal.properties` 파일에서 `dl.store.impl` 의 기본값을 대체합니다.

1. Liferay 서버를 다시 시작하십시오.

다시 시작하면 구성된 Azure Blob Storage 컨테이너가 인스턴스의 기본 저장소가 됩니다.



```{important}
클러스터 환경에서 Azure Blob Storage 저장소를 사용하는 경우 모든 노드의 구성이 동일해야 합니다. 특히 시스템 설정의 `portal-ext.properties` 파일과 Azure Blob Storage 저장소 설정이 동일한지 확인하십시오. 
```




## 추가 정보

* [Azure Blob 스토리지 설명서](https://docs.microsoft.com/en-us/azure/storage/blobs/)
* [파일 스토리지](../../file-storage.md)