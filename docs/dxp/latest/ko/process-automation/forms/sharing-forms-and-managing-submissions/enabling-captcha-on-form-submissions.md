# 양식 제출 시 CAPTCHA 활성화

[자동 양식 제출을 방지하기 위해 CAPTCHA](https://en.wikipedia.org/wiki/CAPTCHA) 을 활성화할 수 있습니다.

CAPTCHA를 활성화하려면:

1. 양식의 _옵션_ 버튼(![Options](../../../images/icon-actions.png))을 클릭하고 _설정_을 선택합니다.

    ![양식 설정으로 이동](./enabling-captcha-on-form-submissions/images/01.png)

1. _Require CAPTCHA_ 토글을 오른쪽으로 전환합니다.

    ![CAPTCHA 활성화](./enabling-captcha-on-form-submissions/images/02.png)

1. _완료_을 클릭합니다.

이제 양식을 제출하려면 CAPTCHA 확인을 완료해야 합니다.

![보안 문자가 활성화된 양식입니다.](./enabling-captcha-on-form-submissions/images/03.png)

## 추가 정보

기본적으로 Liferay는 "Simple CAPTCHA" 확인을 사용합니다. Google의 reCAPTCHA 서비스와 같은 대체 CAPTCHA 엔진을 사용하도록 구성 및 변경할 수 있습니다. 이를 수행하는 방법에 대한 자세한 내용은 [인증 기본 사항](../../../installation-and-upgrades/securing-liferay/authentication-basics.md#configuring-captcha-or-recaptcha)을 참조하십시오.
