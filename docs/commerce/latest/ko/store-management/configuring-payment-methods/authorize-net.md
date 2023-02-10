# Authorize.net

이 문서에서는 Authorize.Net을 결제 방법으로 활성화하는 방법에 대해 자세히 설명합니다. [Authorize.Net](https://www.authorize.net/about-us/) 은 Visa의 자회사이자 가맹점 고객을 대신하여 처리 네트워크에 대한 수십억 건의 거래 제출을 관리하는 결제 게이트웨이 서비스 제공업체입니다.

## 전제 조건

[을 사용하도록 상점을 구성하기 전에 다음을 생성해야](https://support.authorize.net/s/article/How-do-I-obtain-my-API-Login-ID-and-Transaction-Key).

* API 로그인 ID
* 트랜잭션 키

## Authorize.net을 결제 수단으로 활성화

Authorize.net을 결제 수단으로 활성화하려면:

1. _제어판_ → 상거래 → _채널_으로 이동합니다.

    ![커머스 채널](./authorize-net/images/03.png)

1. 원하는 채널을 클릭합니다.
1. 아래로 스크롤한 다음 Authorize.net 옆에 있는 _편집_ 을 클릭합니다.

    ![편집을 클릭하여 Authorize.net 구성을 시작합니다.](./authorize-net/images/04.png)

1. _활성_ 토글을 _예_으로 전환합니다.
1. _구성_ 탭을 클릭합니다.
1. 다음을 입력:
    * **API 로그인 아이디**
    * **트랜잭션 키**
1. _환경_ 드롭다운 메뉴에서 원하는 환경 설정을 선택합니다.
1. 다음 옵션을 선택하여 다음을 표시하도록 활성화합니다.
    * _은행 계좌 표시_
    * _신용카드 표시_
    * _스토어 이름 표시_
1. 다음 옵션을 선택하여 다음을 표시하도록 활성화합니다.
    * _CAPTCHA 필요_
    * _카드 코드 확인 필요_

     ![Authorize.Net 설정](./authorize-net/images/01.png)

1. _저장_을 클릭합니다.
1. _Authorize.Net_ 옆에 있는 _점 3개 아이콘_ 을 클릭한 다음 _활성화_를 클릭합니다.

완료되면 이제 Authorize.Net이 활성화됩니다.

### 상거래 2.0 이하

1. _사이트 관리 → 상거래 → 설정 → 지불 방법_으로 이동합니다.

    ![Authorize.Net 설정](./authorize-net/images/05.png)

1. 추가(+) 버튼을 클릭한 다음 _Authorize.Net_을 클릭합니다.
1. _구성_을 클릭합니다.
1. 다음을 입력:
    * **API 로그인 아이디**
    * **트랜잭션 키**
1. 라이브 사이트인 경우 _프로덕션_ 을 선택하고 테스트 환경인 경우 _샌드박스_ 을 선택합니다.
1. 다음 옵션을 선택하여 다음을 표시하도록 활성화합니다.
    * _은행 계좌 표시_
    * _신용카드 표시_
    * _스토어 이름 표시_
1. 다음 옵션을 선택하여 다음을 표시하도록 활성화합니다.
    * _CAPTCHA 필요_
    * _카드 코드 확인 필요_

       ![Authorize.Net 설정](./authorize-net/images/02.png)

1. _저장_을 클릭합니다.
1. _Authorize.Net_ 옆에 있는 _점 3개 아이콘_ 을 클릭한 다음 _활성화_를 클릭합니다.

## 추가 정보

* [새 통화 추가](../currencies/adding-a-new-currency.md)
* [Mercanet](./mercanet.md)
* [PayPal](./paypal.md)
