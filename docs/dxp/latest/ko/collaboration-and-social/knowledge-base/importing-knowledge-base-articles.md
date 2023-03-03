# 기술 자료 문서 가져오기

Knowledge Base 앱은 문서를 대량으로 가져올 수 있습니다. 이를 통해 기사가 게시되기 전에 미리 준비되는 프로세스를 가질 수 있습니다. 문서는 [Markdown](http://commonmark.org/) 파일로 지식 베이스에 가져옵니다. Markdown은 읽기 쉬운 텍스트 전용 파일 형식이지만 기사 형식을 지정하는 데 필요한 모든 작업을 지원합니다.

참고: 기사를 가져오려면 역할에 *기술 자료* &rarr; *리소스 권한: 기사 가져오기* 권한이 부여되어야 합니다.

Knowledge Base는 [Multi-Markdown](http://fletcher.github.io/MultiMarkdown-4/) 로 알려진 Markdown 방언을 지원합니다. 이 방언은 표 서식, 이미지 캡션 및 각주와 같은 기능으로 원래 Markdown을 확장합니다.

기술 자료에서 Markdown 문서를 가져오려면 다음 요구 사항을 준수해야 합니다.

* 모든 소스 파일은 `.markdown` 또는 `.md` 확장자를 사용해야 합니다.
* 기사는 최상위 헤더로 시작해야 합니다(예: `# Some Heading ...`).
* 각 헤더에는 기사의 친숙한 URL 제목과 기사 하위 헤더의 앵커 태그에 대한 연결된 고유 ID가 있어야 합니다. 다음은 ID를 올바르게 지정하는 최상위 헤더의 예입니다.

`# Some Heading [](id=some-heading) `

간단한 예제 문서에 대한 Markdown 소스 텍스트는 다음과 같습니다.

    # Modern Pentathlon [](id=modern-pentathlon)
    
    The modern pentathlon is a competition across five different sport disciplines.
    
    Each athlete must compete in fencing, shooting, swimming, horseback riding, and running.

위의 첫 번째 줄에서 헤더의 ID 할당 `id=modern-pentathlon`을 확인하십시오. 가져올 때 ID 값은 기술 자료 문서의 URL 제목이 됩니다.

Markdown은 풍미가 있는 표준입니다. Github Flavored Markdown [, 제안된](https://help.github.com/articles/github-flavored-markdown) 공통 Markdown 구문 [, Markdown을 지원하는 포럼(reddit,](http://www.commonmark.org/) 등), Markdown 편집기 및 공식 인터넷으로 만들기 위한 [IETF 초안](https://tools.ietf.org/html/rfc7763) 가 있습니다. 미디어 유형(텍스트/마크다운). Markdown은 다음과 같은 이유로 선호됩니다.

* 읽을 수 있습니다. Markdown을 몰라도 구문을 필터링하지 않고도 읽을 수 있습니다.

* 그것은 작가의 길을 벗어납니다. 텍스트를 머리글로 변경하거나 글머리 기호 목록을 만들기 위해 다양한 아이콘에 마우스를 갖다 대는 것에 대해 걱정할 필요가 없습니다. 입력을 시작하십시오. 구문은 매우 직관적입니다.

* HTML로 변환하도록 설계되었지만 다른 많은 형식으로 변환하는 도구가 있습니다. 기사가 Markdown에 있는 경우 웹, 모바일 형식(Kindle, ePub) 및 인쇄에 게시할 수 있습니다.

* 텍스트뿐이므로 기존 도구를 사용하여 해당 텍스트에 대해 공동 작업을 할 수 있습니다. 사람들은 GitHub와 같은 서비스를 사용하여 기사에 기여할 수 있으며 기사에 적용된 모든 변경 사항을 볼 수 있습니다.
