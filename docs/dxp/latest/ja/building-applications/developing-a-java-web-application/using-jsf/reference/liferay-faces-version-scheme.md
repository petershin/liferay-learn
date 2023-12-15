# Liferay Facesのバージョンスキーム

この記事では、どのLiferay Facesアーティファクトをポートレットで使用すべきかを学び、バージョンの各コンポーネントの意味を知ることで、Liferay Facesのバージョン管理スキームを探ります。 バージョン管理スキームをマスターしたら、いくつかの構成例を見てみましょう。

## Liferay Faces Archetypeポートレットの使用

[Liferay Faces Archetypeポートレット](http://liferayfaces.org) を使用して、ポートレットに含める必要のあるLiferay Facesアーティファクトとバージョンを判別できます。 目的のLiferay Portalバージョン、JSFバージョン、コンポーネントスイート（オプション）、およびビルドツールを選択すると、ポートレットにはMavenアーキタイプからポートレットを生成するコマンドと、ビルドファイルにコピーできる依存関係のリストの両方が表示されます。 次のセクションでは、Liferay Facesアーティファクトの各バージョンに関する互換性情報を提供します。

## Liferay Faces Alloy

[AlloyUI](http://alloyui.com/) を利用するJSFコンポーネントのスイートを提供します。

| ブランチ                                                                                  | アーティファクトの例                        | AlloyUI | JSF API | 追加情報                                                             |
| ------------------------------------------------------------------------------------- | --------------------------------- | ------- | ------- | ---------------------------------------------------------------- |
| [master \(4.x\)](https://github.com/liferay/liferay-faces-alloy/tree/master) | com.liferay.faces.alloy-4.1.0.jar | 3.1.x   | 2.2+    | **AlloyUI 3.1.xは、Liferay Portal 7.3.** にバンドルされているバージョンです。         |
| [3.x](https://github.com/liferay/liferay-faces-alloy/tree/3.x)             | com.liferay.faces.alloy-3.1.0.jar | 3.0.x   | 2.2+    | **AlloyUI 3.0.xは、Liferay Portal 7.0/7.1/7.2.** にバンドルされているバージョンです。 |
| [2.x](https://github.com/liferay/liferay-faces-alloy/tree/2.x)             | com.liferay.faces.alloy-2.0.1.jar | 2.0.x   | 2.1+    | **AlloyUI 2.0.xは、Liferay Portal 6.2.** にバンドルされているバージョンです。         |
| [1.x](https://github.com/liferay/liferay-faces-alloy/tree/1.x)             | com.liferay.faces.alloy-1.0.1.jar | 2.0.x   | 1.2     | **AlloyUI 2.0.xは、Liferay Portal 6.2.** にバンドルされているバージョンです。         |

## Liferay Faces Bridge

JSR 286（Portlet 2.0）およびJSR 362（Portlet 3.0）のリファレンス実装である [Apache Pluto](https://portals.apache.org/pluto/) 内のポートレットとしてJSF Webアプリケーションをデプロイする機能を提供します。

| ブランチ                                                                                                                                                                          | アーティファクトの例                                                                         | ポートレットAPI | JSF API |                                 JCP仕様                                | 追加情報                                                                     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | :-------: | :-----: | :------------------------------------------------------------------: | ------------------------------------------------------------------------ |
| API: [5.x](https://github.com/liferay/liferay-faces-bridge-api/tree/5.x) <br/>IMPL: [5.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/5.x) | com.liferay.faces.bridge.api-5.0.0.jar<br/>com.liferay.faces.bridge.impl-5.0.0.jar |    3.0    |   2.2   |    [JSR 378](https://www.jcp.org/en/jsr/detail?id=378)    | *日本共産党による「最終審査」中で、2020年発表予定。                                            |
| API: [4.x](https://github.com/liferay/liferay-faces-bridge-api/tree/4.x) <br/>IMPL: [4.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/4.x) | com.liferay.faces.bridge.api-4.1.0.jar<br/>com.liferay.faces.bridge.impl-4.0.0.jar |    2.0    |   2.2   |    [JSR 329](https://www.jcp.org/en/jsr/detail?id=329)    | **JSF 2.2.** 用の非標準ブリッジ拡張を含みます。                                            |
| API: [3.x](https://github.com/liferay/liferay-faces-bridge-api/tree/3.x) <br/>IMPL: [3.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/3.x) | com.liferay.faces.bridge.api-3.1.0.jar<br/>com.liferay.faces.bridge.impl-3.0.0.jar |    2.0    |   2.1   |    [JSR 329](https://www.jcp.org/en/jsr/detail?id=329)    | **JSF 2.1.** 用の非標準ブリッジ拡張を含みます。                                            |
| API: [2.x](https://github.com/liferay/liferay-faces-bridge-api/tree/2.x) <br/>IMPL: [2.x](https://github.com/liferay/liferay-faces-bridge-impl/tree/2.x) | com.liferay.faces.bridge.api-2.1.0.jar<br/>com.liferay.faces.bridge.impl-2.0.0.jar |    2.0    |   1.2   | [JSR 329](https://www.jcp.org/en/jsr/detail?id=329) (MR1) | *メンテナンス・リリース1（MR1）のサポートを含む。                                             |
| 1.x                                                                                                                                                                           | 該当なし                                                                               |    1.0    |   1.2   |    [JSR 301](https://www.jcp.org/en/jsr/detail?id=301)    | **Liferay Faces Bridge は JSR 301.**を実装していないため、N/A (Not Applicable) となります。 |

## Liferay Faces Bridge Ext

[Liferay Portal](https://liferay.dev/-/portal) との互換性を提供し、フレンドリURLなどのLiferay固有の機能も利用するLiferay Faces Bridgeの拡張機能。

| ブランチ                                                                              | アーティファクトの例                             | &nbsp;&nbsp;Liferay Portal API&nbsp;&nbsp; | &nbsp;&nbsp;ブリッジ API&nbsp;&nbsp; | &nbsp;&nbsp;ポートレット API&nbsp;&nbsp; | JSF API |
| --------------------------------------------------------------------------------- | -------------------------------------- | :------------------------------------------------------------: | :--------------------------------------------------: | :----------------------------------------------------: | :-----: |
| [8.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/master) | com.liferay.faces.bridge.ext-8.0.0.jar |                             7.3.0+                             |                          5.x                         |                           3.0                          |   2.3   |
| [7.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/7.x)    | com.liferay.faces.bridge.ext-7.0.0.jar |                             7.3.0+                             |                          5.x                         |                           3.0                          |   2.2   |
| [6.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/6.x)    | com.liferay.faces.bridge.ext-6.0.0.jar |                             7.3.0+                             |                          4.x                         |                           2.0                          |   2.2   |
| [5.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/5.x)    | com.liferay.faces.bridge.ext-5.0.4.jar |                        7.0.x/7.1.x/7.2.x                       |                          4.x                         |                           2.0                          |   2.2   |
| [4.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/4.x)    | 未使用                                    |                              該当なし                              |                         該当なし                         |                          該当なし                          |   該当なし  |
| [3.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/3.x)    | com.liferay.faces.bridge.ext-3.0.1.jar |                              6.2.x                             |                          4.x                         |                           2.0                          |   2.2   |
| [2.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/2.x)    | com.liferay.faces.bridge.ext-2.0.1.jar |                              6.2.x                             |                          3.x                         |                           2.0                          |   2.1   |
| [1.x](https://github.com/liferay/liferay-faces-bridge-ext/tree/1.x)    | com.liferay.faces.bridge.ext-1.0.1.jar |                              6.2.x                             |                          2.x                         |                           2.0                          |   1.2   |

## Liferay Faces Portal

[Liferay Portal](https://liferay.dev/-/portal) によって提供されるJSPタグに基づくJSFコンポーネントのスイートを提供します。

| ブランチ                                                                          | アーティファクトの例                         | Liferay Portal API&nbsp;&nbsp; | &nbsp;&nbsp;ポートレットAPI | &nbsp;&nbsp;JSF API |
| ----------------------------------------------------------------------------- | ---------------------------------- | :--------------------------------------: | :-----------------------------: | :---------------------------: |
| [6.x](https://github.com/liferay/liferay-faces-portal/tree/master) | com.liferay.faces.portal-6.0.0.jar |                   7.2+                   |               3.0               |              2.3              |
| [5.x](https://github.com/liferay/liferay-faces-portal/tree/5.x)    | com.liferay.faces.portal-5.0.0.jar |                   7.2+                   |               3.0               |              2.2              |
| [4.x](https://github.com/liferay/liferay-faces-portal/tree/4.x)    | com.liferay.faces.portal-4.0.0.jar |                  7.2/7.3                 |               2.0               |              2.2              |
| [3.x](https://github.com/liferay/liferay-faces-portal/tree/3.x)    | com.liferay.faces.portal-3.0.1.jar |                7.0/7.1/7.2               |               2.0               |              2.2              |
| [2.x](https://github.com/liferay/liferay-faces-portal/tree/2.x)    | com.liferay.faces.portal-2.0.1.jar |                    6.2                   |               2.0               |            2.1/2.2            |
| [1.x](https://github.com/liferay/liferay-faces-portal/tree/1.x)    | com.liferay.faces.portal-1.0.1.jar |                    6.2                   |               2.0               |              1.2              |

## Liferay Faces Util

Liferay Facesを構成するサブプロジェクトの多くをサポートするための汎用JSFユーティリティを含むライブラリ。

| ブランチ                                                                     | アーティファクトの例                       | &nbsp;&nbsp;JSF API |
| ------------------------------------------------------------------------ | -------------------------------- | :---------------------------: |
| [マスター](https://github.com/liferay/liferay-faces-util)         | com.liferay.faces.util-3.1.0.jar |              2.3              |
| [3.x](https://github.com/liferay/liferay-faces-util/tree/3.x) | com.liferay.faces.util-3.1.0.jar |              2.2              |
| [2.x](https://github.com/liferay/liferay-faces-util/tree/2.x) | com.liferay.faces.util-2.1.0.jar |              2.1              |
| [1.x](https://github.com/liferay/liferay-faces-util/tree/1.x) | com.liferay.faces.util-1.1.0.jar |              1.2              |

次の画像は、Liferay Facesの依存関係図を示しています。これは、コンポーネントがどのように相互作用し、相互に依存しているかを視覚化するのに役立ちます。

![Liferay Faces dependency diagram helps visualize how components interact and depend on each other.](./liferay-faces-version-scheme/images/01.png)

次に、新しいバージョン管理スキームの動作を確認するための構成例をいくつか示します。
