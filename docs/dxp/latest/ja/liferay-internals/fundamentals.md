---
toc:
- ./fundamentals/module-projects.md
- ./fundamentals/apis-as-osgi-services.md
- ./fundamentals/using-an-osgi-service.md
- ./fundamentals/importing-packages.md
- ./fundamentals/exporting-packages.md
- ./fundamentals/semantic-versioning.md
- ./fundamentals/configuring-dependencies.md
- ./fundamentals/using-the-gogo-shell.md
---
# 基本

Liferayの開発プロジェクトは、主に単純な.jarファイルから構成されています。 これらはOSGiモジュールにするためにいくつかの余分な設定ファイルを含んでいますが、Javaを知っている人なら簡単に理解できるものです。

OSGiのパワーの1つは、DXPのAPIにアクセスするプロジェクトを構築し、さまざまな機能を拡張・上書きしたり、新しいソフトウェアをデプロイ用にパッケージ化するための、一貫した単一の方法を持つことです。 これらのプロジェクト（モジュール）は、互いに機能を依存し合い、実行時に操作できるエコシステムを形成しています。

これらは、Liferay DXPのエコシステムの基本です。

* **[モジュールプロジェクト](./fundamentals/module-projects.md)** OSGi モジュールとは何か、そのプロジェクト構造、そして Liferay の OSGi フレームワークでどのように使用されるかを説明します。

* **[依存関係の構成](./fundamentals/configuring-dependencies.md)** は、Liferayのアーティファクトとサードパーティのアーティファクトを特定し、それらのJavaパッケージをプロジェクトで使用するように設定する方法を示しています。

* **[インポート](./fundamentals/importing-packages.md) と [パッケージのエクスポート](./fundamentals/exporting-packages.md)** は、他のモジュールの機能を使用したり、他のモジュールが使用できるように機能を公開する方法を示しています。Liferay のツールはパッケージの使用を検出し、パッケージのインポートを自動的に指定します。

* **[セマンティックバージョニング](./fundamentals/semantic-versioning.md)** は、Liferayが新しいバージョンに進化する際に、どのようにコードの依存関係を管理するかについて説明しています。

* **[Gogo Shell](./fundamentals/using-the-gogo-shell.md)** では、シェルにコマンドを発行することにより、実行時にコンポーネントを調べたり、問題をデバッグしたり、デプロイメントを管理する方法を示しています。

まず、 [モジュールプロジェクト](./fundamentals/module-projects.md)について学ぶことができます。