# OpenOffice / LibreOffice 통합 활성화

[OpenOffice](https://www.openoffice.org/) 및 [LibreOffice](https://www.libreoffice.org/) 는 Liferay와 통합할 수 있는 오픈 소스 생산성 제품군입니다. 기본적으로 Liferay에는 제한된 파일 유형에 대한 자동 미리보기를 생성하는 [PDFBox](https://pdfbox.apache.org/)이 포함되어 있습니다. 그러나 문서 변환과 같은 추가 기능을 위해 이러한 제품군 중 하나를 통합할 수 있습니다. Liferay 통합을 활성화하려면 먼저 원하는 서비스를 서버에 설치해야 합니다.

```{important}
OpenOffice와 LibreOffice 모두 통합이 가능하지만 일부 기능은 모든 Liferay 제품과 호환되지 않을 수 있습니다. 지원되는 기술 목록은 [Liferay의 통합 기술 호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/360016294272-Liferay-DXP-Integrated-Technologies-Compatibility-Matrix)를 참조하십시오. 
```

설치가 완료되면 제어판을 통해 Liferay의 OpenOffice/LibreOffice 통합을 활성화하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴*을 열고 *제어판* &rarr; *시스템 설정* &rarr; *커넥터* &rarr; *OpenOffice 통합*로 이동합니다.

   ```{note}
   또는 `[Liferay Home]/osgi/configs` 폴더에 `com.liferay.document.library.document.conversion.internal.configuration.OpenOfficeConfiguration.config` 파일을 배포하여 이러한 설정을 조정할 수 있습니다. 
   ```

   ![시스템 설정의 커넥터에서 OpenOffice 통합으로 이동합니다.](./enabling-openoffice-libreoffice-integration/images/01.png)

2. *서버 활성화* 상자를 선택합니다.

3. 원하는 *서버 호스트* 및 *서버 포트*을 입력합니다.

   ```{important}
   동일한 컴퓨터에 OpenOffice를 설치하는 것이 좋습니다. 인스턴스에 원격 호스트를 사용하는 것은 완전히 지원되지 않으며 예기치 않은 문제가 발생할 수 있습니다.
   ```

4. *업데이트*을 클릭합니다.

이제 문서 변환, 브라우저에서 지원되는 문서 유형 보기, 문서 축소판 및 미리보기 생성을 포함하는 OpenOffice/LibreOffice 호환 기능을 사용할 수 있습니다.

## 추가 정보

* [문서 및 미디어](../../documents-and-media.md)
* [문서 및 미디어 미리보기 구성](./configuring-documents-and-media-previews.md)
