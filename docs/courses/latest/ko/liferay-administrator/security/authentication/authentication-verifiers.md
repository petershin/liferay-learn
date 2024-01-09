# 인증 검증자

{bdg-secondary}`LXC-SM 또는 자체 호스팅`

인증 검증자는 제공된 자격 증명(사용자 이름/비밀번호, 토큰, HTTP 헤더 또는 매개 변수 등)이 사용자 계정과 일치하는지 확인하는 코드의 내부 인스턴스입니다. Liferay에는 원격 클라이언트가 HTTP 기본 인증을 사용하거나, 요청 매개변수에 자격 증명을 보내거나, `JSESSIONID` 또는 기타 공유 비밀을 사용하는 경우와 같은 가장 일반적인 상황에 대한 구현이 내장되어 있습니다.

인증 검증자는 자격 증명을 제공하지 **않는다** 는 점을 기억하는 것이 중요합니다. 인증된 세션과 함께 이미 제공된 기존 자격 증명만 확인합니다.

## 인증 검증자 구성

Clarity Vision Solutions는 사용하지 않을 특정 기능을 잠그고 싶어합니다. 파일 변환을 위해 인스턴스를 LibreOffice/OpenOffice에 연결할 계획이 없기 때문에 이미지 요청 인증 확인 프로그램을 끄기로 결정했습니다.

1. **제어판** &rarr; **시스템 설정** &rarr; **보안** &rarr; **API 인증** 으로 이동하세요.

1. 이미지 요청 인증 확인자는 목록의 첫 번째 항목이므로 이미 선택되어 있습니다. **활성화됨** 확인란을 선택 취소합니다.

1. **저장** 을 클릭하세요.

![The Image Request authentication verifier is used only by LibreOffice.](./authentication-verifiers/images/01.png)

이제 이미지 요청 인증 확인 프로그램이 비활성화되었습니다. 다른 기능의 목록을 보려면 아래 링크를 참조하세요.

다음: [비밀번호 정책](./password-policies.md)

## 관련 개념

[인증 확인자 사용](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/using-authentication-verifiers)
