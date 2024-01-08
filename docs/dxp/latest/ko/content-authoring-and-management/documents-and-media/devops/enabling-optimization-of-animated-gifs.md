# 애니메이션 GIF 최적화 활성화

<!--TASK: Relocate to Adaptive Media section. -->

애니메이션 GIF의 크기를 조정하기 위해 Adaptive Media는 [Gifsicle](https://www.lcdf.org/gifsicle/) 이라는 외부 도구를 사용합니다. Gifsicle이 설치되지 않았고 'image/gif'가 지원되는 MIME 유형으로 포함된 경우 Adaptive Media는 GIF의 한 프레임만 크기를 조정하여 정적 GIF를 만듭니다.

Adaptive Media를 사용하여 애니메이션 GIF를 최적화하려면 DXP가 실행 중인 로컬 서버에 Gifsicle을 설치하고 `PATH` 환경 변수를 설정한 다음 DXP의 **시스템 설정** 에서 Gifsicle을 활성화하는 세 단계가 필요합니다.

1. [Gifsicle](https://www.lcdf.org/gifsicle/) 설치하고 서버 환경의 경로에 추가합니다.

1. **글로벌 메뉴** &rarr; **제어판** 으로 이동하세요.

   ![Navigate to the Control Panel.](./enabling-optimization-of-animated-gifs/images/01.png)

1. **시스템 설정** 을 클릭하세요.

1. **적응형 미디어** 를 클릭하세요.

   ![Access the Adaptive Media system settings.](./enabling-optimization-of-animated-gifs/images/02.png)

1. **시스템 범위** 아래 왼쪽 탐색 메뉴에서 **이미지** 를 클릭하세요.

1. 아래로 스크롤한 다음 **Gifsicle Enabled** 옆에 있는 상자를 클릭하세요.

   ![Enable Gifsicle.](./enabling-optimization-of-animated-gifs/images/03.png)

1. 완료되면 **저장** 을 클릭하세요.

## 관련 주제

* [적응형 미디어 사용하기](../publishing-and-sharing/using-adaptive-media.md) 
* [사이트 콘텐츠에 적응된 이미지 사용하기](../publishing-and-sharing/using-adaptive-media/using-adapted-images-in-site-content.md) 
