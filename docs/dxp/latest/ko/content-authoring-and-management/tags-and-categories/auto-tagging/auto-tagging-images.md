# 자동 태깅 이미지

[자산 자동 태그 지정이 활성화되면](./configuring-asset-auto-tagging.md)이미지 자동 태그 지정도 활성화할 수 있습니다. 이미지 자동 태그 지정은 문서 및 미디어 라이브러리에 업로드된 이미지에 태그를 지정합니다.

```{tip}
현재 자동으로 적용된 태그는 영문만 가능합니다.
```

기본적으로 이미지 자동 태그 지정은 기본적으로 비활성화되어 있습니다. DXP에서 자동 태그 지정을 활성화하는 것 외에도 이미지 태그 지정 공급자도 구성해야 합니다. 세 가지 공급자를 사용할 수 있습니다.

* [**TensorFlow:**](#configuring-tensorflow-image-auto-tagging) 기계 학습 기능을 제공하는 오픈 소스 라이브러리입니다. DXP의 TensorFlow 이미지 자동 태그 지정은 [Java용 TensorFlow의 `LabelImage` 샘플](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/java/src/main/java/org/tensorflow/) 을 기반으로 합니다. examples/LabelImage.java), Inception5h 모델을 사용합니다. 정확도가 제한되어 있으므로 주의하여 사용하십시오.
  
  * [**Google Cloud Vision:**](#configuring-google-cloud-vision) [Google Cloud Vision API](https://cloud.google.com/vision/) 를 사용하여 자동으로 이미지에 태그를 지정합니다.

* [**Microsoft Cognitive Services:**](#configuring-microsoft-cognitive-services) 는 [Microsoft Cognitive Services](https://azure.microsoft.com/en-us/services/cognitive-services/) 를 사용하여 자동으로 이미지에 태그를 지정합니다.

![이 이미지에는 화차와 전기기관차 태그가 자동으로 적용되었습니다.](./auto-tagging-images/images/01.png)

## TensorFlow 이미지 자동 태깅 구성

1. **전역 메뉴 클릭** &rarr; **제어판**
1. **시스템 설정** 을 클릭하십시오.
   
   ![시스템 설정으로 이동합니다.](./auto-tagging-images/images/02.png)

1. **콘텐츠 및 데이터** 아래에서 **자산** 을 클릭합니다.
   
   ![자산을 클릭합니다.](./auto-tagging-images/images/03.png)

1. **가상 인스턴스 범위** 아래에서 **TensorFlow Image Auto Tagging** 을 클릭합니다.

1. 양식을 작성하시오.
1. 완료되면 **저장** 을 클릭합니다.

이 양식은 다음 정보를 요구합니다.

**TensorFlow 이미지 자동 태그 지정 활성화:** 자산 자동 태그 지정이 활성화된 모든 인스턴스에서 이미지 자동 태그 지정이 기본적으로 활성화되는지 여부를 선택하려면 이 상자를 선택합니다.

**신뢰 임계값:** TensorFlow는 각 태그에 대해 0과 1 사이의 신뢰 수준을 할당합니다. 여기서 1은 가장 높은 신뢰도이고 0은 가장 낮은 신뢰도입니다. 이 필드는 TensorFlow가 태그를 적용하는 데 필요한 최소 신뢰 수준을 설정합니다. TensorFlow가 태그를 적용하기 전에 더 많은 신뢰가 필요하기 때문에 값이 높을수록 더 적은 수의 태그가 생성됩니다. 값이 낮을수록 더 많은 태그가 생성됩니다.

![포털 인스턴스에 대한 TensorFlow 이미지 자동 태그 지정을 구성합니다.](./auto-tagging-images/images/04.png)

### TensorFlow 자동 태깅 성능 최적화

1. **전역 메뉴 클릭** &rarr; **제어판**
1. **시스템 설정** 을 클릭하십시오.
1. **자산** 을 클릭합니다.
1. **SYSTEM SCOPE** 에서 **TensorFlow Image Auto Tagging Process** 을 클릭합니다.
1. 양식을 작성하시오.
1. **저장** 을 클릭하여 설정을 적용합니다.

양식은 다음 정보를 요구합니다.

**최대 재실행 횟수:** 프로세스가 영구적으로 비활성화되기 전에 충돌이 허용되는 최대 횟수입니다.

**최대 재실행 횟수 시간 간격:** 카운터가 재설정된 후의 시간(초)입니다.

![포털에서 TensorFlow 이미지 자동 태그 지정을 실행하는 프로세스를 미세 조정할 수 있습니다.](./auto-tagging-images/images/05.png)

TensorFlow 공급자가 구성되었습니다.

## Google Cloud Vision 구성

1. **전역 메뉴 클릭** &rarr; **제어판**
1. **시스템 설정** 을 클릭하십시오.
1. **자산** 을 클릭합니다.
1. **가상 인스턴스 범위** 아래에서 **Google Cloud Vision 이미지 자동 태그 지정** 을 클릭합니다.
1. Google Cloud Vision API 키를 입력합니다. 자세한 내용은 [API 키에 대한 Google 문서](https://cloud.google.com/docs/authentication/api-keys) 을 참조하십시오.
1. **Enabled** 체크박스를 선택하여 Google Cloud Vision을 활성화합니다.
   
   ![Google Cloud Vision 제공업체에는 API 키가 필요합니다.](./auto-tagging-images/images/06.png)

1. 완료되면 **저장** 을 클릭합니다.

## Microsoft Cognitive Services 구성

1. **전역 메뉴 클릭** &rarr; **제어판**
1. **시스템 설정** 을 클릭하십시오.
1. 클릭 **자산**
1. **가상 인스턴스 범위** 에서 **Microsoft Cognitive Services 이미지 자동 태깅** 을 클릭합니다.
1. 양식을 작성하시오.
1. **활성화됨** 상자를 선택합니다.
   
   ![Microsoft Cognitive Services 공급자에는 API 키와 엔드포인트가 필요합니다.](./auto-tagging-images/images/07.png)

1. 완료되면 **저장** 을 클릭합니다.

이 양식은 다음 정보를 요구합니다.

**API 키:** 귀하의 [API 키](https://azure.microsoft.com/en-us/try/cognitive-services/my-apis/?apiSlug=computer-services) Computer Vision API V2.

**API 엔드포인트:**[Computer Vision API V2](https://westcentralus.api.cognitive.microsoft.com/vision/v2.0) 의 엔드포인트입니다.

Microsoft Cognitive Services 공급자가 구성되었습니다. 자세한 내용은 [Microsoft Cognitive Services 설명서](https://docs.microsoft.com/en-us/azure/cognitive-services/) 을 참조하십시오.

둘 이상의 가상 인스턴스가 있는 경우 각 인스턴스를 개별적으로 구성할 수 있습니다. **제어판** &rarr; **인스턴스 설정** 으로 이동합니다. **자산** 을 클릭한 다음 여기에서 공급자를 구성합니다.

## 추가 정보

* [자산 자동 태그 지정 구성](./configuring-asset-auto-tagging.md)
* [자동 태그 지정 자산](./auto-tagging-assets.md)
