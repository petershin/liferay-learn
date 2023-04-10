# 텍스트 임베딩 공급자 설정

{bdg-secondary}`7.4 U70+`
{bdg-link-dark}` [베타 기능](https://help.liferay.com/hc/ko/articles/12917247551757-Beta-Features) `

텍스트 임베딩 제공업체에는 두 가지 작업이 있습니다.

1. 인덱스 시간에 지정된 모델을 사용하여 인덱스 문서의 필드에서 추출된 텍스트 샘플의 텍스트 임베딩 표현을 만듭니다.
1. 검색 시 지정된 모델을 사용하여 검색 표시줄에 입력된 검색 구의 텍스트 임베딩 표현을 만듭니다.

사용하는 모델이 가장 중요합니다. 벡터화된 데이터는 선택한 모델만큼만 좋습니다.

선택한 모델은 검색 구문의 텍스트 임베딩과 문서의 텍스트 임베딩의 [유사성 검색](https://www.elastic.co/blog/text-similarity-search-with-vectors-in-elasticsearch) 도 수행합니다. 임베딩 공급자로 txtai를 사용하는 경우에도 모델은 [Hugging Face](https://huggingface.co/models) 에 보관됩니다.

| 텍스트 임베딩 공급자                                               | 프로덕션에 권장됩니까? |
|:--------------------------------------------------------- |:------------ |
| [txtai](https://neuml.github.io/txtai/)                   | &#10004;     |
| [포옹 얼굴 추론 끝점](https://huggingface.co/inference-endpoints) | &#10004;     |
| [포옹 얼굴 추론 API](https://huggingface.co/inference-api)      | &#10008;     |

## txtai 구성 및 실행

```{note} 
여기서 txtai 구성은 데모용입니다. 자세한 내용은 [txtai 문서](https://neuml.github.io/txtai/) 를 참조하세요.
```

API에 액세스하도록 txtai를 설정합니다. docker 컨테이너에서 txtai를 실행하려면 [txtai 설명서](https://neuml.github.io/txtai/cloud/) 참조하거나 Linux의 경우 다음 기본 단계를 따르십시오.

1. `txtai` 폴더와 `cd` 폴더를 생성합니다.

1. `txtai` 폴더에서 다음을 사용하여 Dockerfile을 다운로드합니다.

   ```sh
   curl https://raw.githubusercontent.com/neuml/txtai/master/docker/api/Dockerfile -O
   ```

1. `txtai` 폴더에 `config.yml` 파일을 만들고 다음과 같은 최소한의 콘텐츠를 제공합니다.

   ```yaml
   path: /tmp/index

   writable: False

   embeddings:
        path: sentence-transformers/msmarco-distilbert-base-dot-prod-v3
   ```

   ```{important}
   임베딩 경로에 [선택한 모델](./../semantic-search.md#choosing-a-model) 이 입력됩니다.
   ```

1. txtai 폴더에서 다음을 실행합니다.

   ```sh
   docker build -t txtai-api .
   ```

1. 컨테이너를 시작합니다.

   ```sh
   docker run -p 8000:8000 --rm -it txtai-api
   ```

   모델의 크기에 따라 서비스가 초기화되는 데 몇 분 정도 걸릴 수 있습니다.

1. Liferay에서 *글로벌 메뉴* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *제어판* &rarr; *검색 경험* &rarr; *시맨틱 검색*엽니다.

   - _Text Embeddings Enabled_ _true_으로 설정합니다.
   - 텍스트 임베딩 공급자로 _txtai_ 선택합니다.
   - 위의 테스트 설정을 따른 경우 txtai 호스트 주소, 기본 인증 사용자 이름 및 기본 인증 비밀번호의 기본값을 그대로 둡니다.
   - 벡터 차원 포함에서 기본값(768)을 그대로 둡니다.

   ```{important}
   임베딩 벡터 차원은 구성된 모델의 차원과 일치해야 합니다. 모델은 `config.yml` 파일을 사용하여 txtai에 지정됩니다. 적절한 치수 수를 구성하려면 모델 설명서를 참조하십시오.
   ```

구성을 저장하기 전에 _테스트 구성_ 클릭하여 Liferay가 txtai 서버와 연결할 수 있고 설정이 올바른지 확인하십시오.

이 예제 설정은 데모용입니다. 필요에 맞는 설정을 찾으려면 [txtai 설명서](https://github.com/neuml/txtai) 참조하십시오(예: 성능 향상을 위해 GPU [컨테이너](https://neuml.github.io/txtai/cloud/) 실행).

## 포옹하는 얼굴 추론 API 사용

```{important}
[Hugging Face Inference API](https://huggingface.co/inference-api) 는 테스트 및 개발에 적합합니다. Hugging Face를 생산을 위한 텍스트 포함 공급자로 사용하려면 [Hugging Face Inference Endpoints 공급자](#using-the-hugging-face-inference-endpoints) 를 사용하세요.
```

Hugging Face Inference API를 사용하려면 먼저 [Hugging Face 계정](https://huggingface.co/join) 만듭니다.

계정이 있으면

1. Hugging Face 계정 설정으로 이동하여 액세스 토큰을 복사하십시오.

1. Liferay에서 *글로벌 메뉴* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *제어판* &rarr; *검색 경험* &rarr; *시맨틱 검색*엽니다.

   텍스트 임베딩 공급자로 _Hugging Face Inference API_ 선택하고 복사한 액세스 토큰을 입력합니다.

1. <https://huggingface.co/models?pipeline_tag=feature-extraction>의 목록에서 모델 중 하나를 선택합니다.

1. 모델명을 모델명으로 입력합니다.

1. 선택한 모델과 일치하도록 Embedding Vector Dimension의 적절한 수를 입력하십시오.

   ```{important}
   임베딩 벡터 차원은 구성된 모델의 차원과 일치해야 합니다. 모델은 `config.yml` 파일을 사용하여 txtai에 지정됩니다. 적절한 치수 수를 구성하려면 모델 설명서를 참조하십시오.
   ```

1. 다른 Hugging Face 설정을 원하는 대로 구성합니다.

   **모델 시간 초과:** 시간 초과되기 전에 모델이 로드될 때까지 대기하는 시간(초)을 설정합니다. Hugging Face 모델을 메모리에 고정하여 반복적으로 시간이 많이 걸리는 모델 로드를 방지할 수 있습니다.

구성을 저장하기 전에 _Test Configuration_ 버튼을 클릭하여 Liferay가 Hugging Face Inference API와 연결할 수 있고 설정이 올바른지 확인하십시오.

## 포옹하는 얼굴 추론 끝점 사용

[Hugging Face Inference Endpoints](https://huggingface.co/inference-endpoints) 서비스는 Hugging Face의 엔터프라이즈급 유료 텍스트 삽입 서비스입니다. 시맨틱 검색 솔루션을 테스트하고 개발할 때 [Inference API](#using-the-hugging-face-inference-api) 을 사용할 수 있습니다.

대부분의 설정은 Hugging Face에서 완료됩니다. Inference API를 설정한 후,

1. Hugging Face 계정 설정으로 이동하여 액세스 토큰을 복사하십시오.

1. Liferay에서 *글로벌 메뉴* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *제어판* &rarr; *검색 경험* &rarr; *시맨틱 검색*엽니다.

   텍스트 포함 공급자로 _Hugging Face Inference Endpoints_ 을 선택하고 복사한 액세스 토큰을 입력합니다.

1. 호스트 주소를 입력합니다.

1. 선택한 모델과 일치하도록 임베딩 벡터 차원의 적절한 수를 입력하십시오.

   ```{important}
   임베딩 벡터 차원은 구성된 모델의 차원과 일치해야 합니다. 모델은 `config.yml` 파일을 사용하여 txtai에 지정됩니다. 적절한 차원 수를 구성하려면 모델 설명서를 참조하십시오.
   ```

구성을 저장하기 전에 _Test Configuration_ 버튼을 클릭하여 Liferay가 Hugging Face Inference Endpoint와 연결할 수 있고 설정이 올바른지 확인하십시오.
