# 애니메이션 GIF 최적화 활성화
<!--TASK: Relocate to Adaptive Media section. -->
애니메이션 GIF의 크기를 조정하기 위해 Adaptive Media는 [Gifsicle](https://www.lcdf.org/gifsicle/) 이라는 외부 도구를 사용합니다. Gifsicle이 설치되지 않고 지원되는 MIME 유형으로 `image/gif` 이 포함된 경우 Adaptive Media는 GIF의 한 프레임만 확장하여 정적 GIF를 만듭니다.

Adaptive Media를 사용하여 애니메이션 GIF를 최적화하려면 DXP가 실행 중인 로컬 서버에 Gifsicle을 설치하고, `PATH` 환경 변수를 설정한 다음 DXP의 **시스템 설정** 에서 Gifsicle을 활성화하는 세 단계가 필요합니다.

1. [Gifsicle](https://www.lcdf.org/gifsicle/) 을 설치하고 서버 환경의 경로에 추가하십시오.

1. **글로벌 메뉴** &rarr; **제어판** 로 이동합니다.

    ![제어판으로 이동합니다.](./enabling-optimization-of-animated-gifs/images/01.png)

1. **시스템 설정** 을 클릭하십시오.
1. **적응형 미디어** 을 클릭합니다.

   ![Adaptive Media 시스템 설정에 액세스합니다.](./enabling-optimization-of-animated-gifs/images/02.png)

1. **시스템 범위** 아래의 왼쪽 탐색에서 **이미지** 을 클릭합니다.
1. 아래로 스크롤한 다음 **Gifsicle Enabled** 옆의 상자를 클릭합니다.

    ![Gifsicle을 활성화합니다.](./enabling-optimization-of-animated-gifs/images/03.png)

1. 완료되면 **저장** 을 클릭합니다.

## 관련 주제

* [적응형 미디어 작동 방식](../publishing-and-sharing/serving-device-and-screen-optimized-media/how-adaptive-media-works.md)
* [사이트 콘텐츠에서 적응된 이미지 사용](../publishing-and-sharing/serving-device-and-screen-optimized-media/using-adapted-images-in-site-content.md)
