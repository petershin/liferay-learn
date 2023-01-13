# 테마 업그레이드

이전 버전의 Liferay DXP용으로 개발된 테마를 새 버전으로 배포하려면 업그레이드해야 합니다. `꿀꺽 업그레이드` 작업은 Liferay 버전 참조 및 테마 종속성을 업데이트합니다. 이를 통해 최신 버전의 Liferay에 테마를 배포할 수 있습니다.

## 전제 조건

Liferay 테마 생성기는 업그레이드 작업을 실행하는 데 사용됩니다. 아직 설치하지 않았다면 다음 명령으로 설치하십시오.

```bash
npm install -g generator-liferay-theme@10.x.x
```

다음 명령을 사용하여 Yeoman 및 Gulp 종속성을 설치합니다.

```bash
npm install -g yo gulp
```

## 업그레이드 작업 실행

업그레이드 작업을 사용하여 테마의 버전 종속성을 업데이트합니다.

```{important}
업그레이드 작업은 테마의 파일을 변경하거나 덮어쓸 수 있습니다. 실행하기 전에 테마 파일을 백업하십시오. 
```

테마 폴더 내에서 다음 명령을 실행합니다.

```bash
gulp upgrade
```

아직 파일을 백업하지 않은 경우 파일을 백업하라는 경고가 나타납니다. 준비가 되면 "y"(또는 "yes")를 입력하여 프롬프트에서 계속합니다.

```
? We recommend creating a backup of your theme files before proceeding. Are you 
sure you wish to start the upgrade process?
```

**Liferay 7.4**로 업그레이드하는 경우 Bootstrap 3-4 호환성 레이어를 추가할지 묻는 또 다른 프롬프트가 나타납니다. 테마가 Bootstrap 3과의 호환성이 필요한 경우 "y"(또는 "yes")를 입력한 다음 확인을 위한 경고가 나타나면 다시 입력합니다. Bootstrap 3과의 호환성이 필요하지 않은 경우 "n"(또는 "no")을 입력합니다.

```
? Would you like to add the Bootstrap 3 to 4 compatibility layer? Yes
? Bootstrap 3 to 4 compatibility layer is for DXP 7.4 GA1 and we cannot garauntee it working with future releases of Liferay DXP. Confirm?
```

콘솔의 메시지와 함께 업그레이드 작업이 완료되었는지 확인합니다.

```
Finished 'upgrade' after 36 s
```

이제 테마의 버전 번호가 업데이트되었으며 이제 새 버전의 Liferay DXP에 배포할 수 있습니다.

<!-- Add Next Steps section when information is available -->
