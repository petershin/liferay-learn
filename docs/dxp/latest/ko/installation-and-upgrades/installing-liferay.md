---
toc:
  - ./installing-liferay/installing-a-liferay-tomcat-bundle.md
  - ./installing-liferay/configuring-a-database.md
  - ./installing-liferay/running-liferay-for-the-first-time.md
  - ./installing-liferay/using-liferay-docker-images.md
  - ./installing-liferay/installing-liferay-on-an-application-server.md
---
# 라이프레이 설치

```{toctree}
:maxdepth: 2

installing-liferay/installing-a-liferay-tomcat-bundle.md
installing-liferay/configuring-a-database.md
installing-liferay/running-liferay-for-the-first-time.md
installing-liferay/using-liferay-docker-images.md
installing-liferay/installing-liferay-on-an-application-server.md
```

Liferay는 애플리케이션 서버에서 실행됩니다. Liferay를 호스트하는 세 가지 방법이 있습니다.

* 도커 컨테이너 사용
* 온프레미스에서 Liferay Tomcat 번들 사용
* 선택한 지원되는 애플리케이션 서버, 온프레미스

Liferay를 호스팅하는 가장 빠른 방법은 클라우드에서 미리 구성된 Docker 이미지를 사용하는 것입니다. 클라우드 공급자와 함께 이미지를 사용하고 환경 변수를 사용하여 [구성](./installing-liferay/using-liferay-docker-images.md)합니다.

Liferay Tomcat 번들은 모든 서버에 압축을 풀고 구성하고 실행할 수 있는 아카이브입니다. Liferay가 이미 설치되어 구성할 준비가 된 경량 Tomcat 애플리케이션 서버입니다. 

물론 온프레미스에서 지원되는 모든 애플리케이션 서버에 Liferay를 항상 설치할 수 있습니다. 

```{note}
기업 가입자는 Liferay Cloud에서 [Liferay DXP 서비스 사용](https://learn.liferay.com/ko/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud) 할 수 있습니다. Liferay Cloud는 인프라 비용(하드웨어, 전기 요금)을 줄이고, 더 많은 고객을 처리할 수 있도록 빠르게 확장하고, 시장 출시 시간을 단축하고, 사용하기 쉽습니다.

Liferay Cloud에 관심이 있으시면 Liferay Cloud [제품 정보](https://www.liferay.com/products/dxp-cloud) 를 참조하거나 Liferay 담당자에게 문의하십시오.
```

자신의 컴퓨터에서 Liferay를 개발하려면 다음과 같은 편리한 옵션을 고려하십시오.

* [Liferay 도커 이미지](#docker-image)
* [라이프레이 톰캣 번들](#liferay-tomcat-bundle)

## 도커 이미지

Liferay의 Docker 이미지는 Liferay 사용을 시작하는 가장 빠른 방법입니다. 이미지는 Tomcat 애플리케이션 서버에 사전 설치된 Liferay와 함께 제공됩니다. 시작하려면 [Liferay Docker 이미지 사용](./installing-liferay/using-liferay-docker-images.md)을 방문하십시오.

## 라이프레이 톰캣 번들

Liferay Tomcat 번들은 Liferay가 Tomcat에 사전 설치된 ZIP 파일입니다. 컨테이너 외부에서 Liferay를 사용하기 시작하는 쉬운 방법입니다.

번들을 시작하려면 [Liferay Tomcat 번들 설치](./installing-liferay/installing-a-liferay-tomcat-bundle.md)을 참조하십시오.

```{warning}
Docker 이미지 및 Tomcat 번들에서 Liferay는 기본적으로 임베디드 HSQL 데이터베이스를 사용하도록 구성됩니다. 시연 목적 외에도 모든 기능을 갖춘 [지원되는 RDBMS](https://help.liferay.com/hc/ko/articles/360049238151) 를 사용하는 것이 좋습니다. 구성 지침은 [데이터베이스 구성](./reference/database-configurations.md)을 참조하십시오.
```

## 애플리케이션 서버에 Liferay 설치

지원되는 모든 [애플리케이션 서버](https://help.liferay.com/hc/ko/articles/360049238151) 에 Liferay를 설치할 수 있습니다. 이것은 일반적으로 DevOps 및 고가용성 환경에서 사용하기에 가장 실용적인 설치 유형입니다.

시작하려면

1. [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 에서 지원되는 애플리케이션 서버를 선택하십시오.
1. 해당 [애플리케이션 서버](./installing-liferay/installing-liferay-on-an-application-server.md)에 Liferay 설치 지침을 따르십시오.

## 다음

Liferay를 설치한 후 [Liferay](./setting-up-liferay.md) 설정으로 이동하여 다음 옵션을 구성합니다.

* 수색
* 지역화
* 메일
* 파일 스토리지
* 마켓플레이스 앱
* 고가용성
* 그리고 더

## 관련 주제

* [백업](./maintaining-a-liferay-installation/backing-up.md)
* [라이프레이 업데이트](./maintaining-a-liferay-installation/updating-liferay.md)
* [라이프레이 확보](./securing-liferay.md)
