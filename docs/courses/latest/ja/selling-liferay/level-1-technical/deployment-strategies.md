---
toc:
  - ./deployment-strategies/deployment-strategies-explained.md
  - ./deployment-strategies/choosing-the-right-deployment-strategy.md
visibility:
  - Employee
  - Partner
---
# 展開戦略

**一目瞭然**

* ビジネス上の問題を解決するためにLiferay DXPを選択した後、顧客はLiferayアプリケーションをどこでホストするかを選択する必要があります。
* それぞれのプロジェクトの具体的な内容によって、どちらかのアプローチに決定するための考慮事項がある。
* Liferayは3つの製品展開を提供しています：
  * Liferay ソフトウェア - セルフホスティング
  * Liferay Experience クラウド セルフマネージド - PaaS
  * Liferayエクスペリエンスクラウド - SaaS
* Liferayの好ましいアプローチは、まずSaaSである。

## 背景

このモジュールでは、すべての展開戦略、その特徴、ビジネス価値、そして各プロスペクトに最適なアプローチを決定する方法について説明する。

デプロイメント戦略はLiferayのデモには関係ないように思えるかもしれませんが、見込み客とそのニーズについてより深く知るとき、このトピックはしばしば出てきます。

```{note}
* このモジュールのライブ・ワークショップの [録画](https://learn.liferay.com/web/guest/d/se1-8-deployment-strategies) をご覧ください。
* ライブ・ワークショップで使用されたプレゼンテーションの [PDF](https://learn.liferay.com/documents/d/guest/se1-8-deployment-strategies-pdf) をダウンロードしてください。
```
## Liferayの製品

デプロイメント戦略を説明する前に、アプリケーションがどこに置かれるかに関わらず、デプロイされる製品は常に Liferay DXP であることを強調しておきます。

Liferayの最新バージョンには、Digital Experience Platformコア、コマース、アナリティクスの3つの主要機能が含まれています。 この製品には、顧客がソリューションを開発し、ビジネスの成果を達成するためのすべてのツールと機能が組み込まれており、すべての顧客がすべての機能にアクセスできる。

![Liferay DXP contains core Digital Experience Platform capabilities along with Commerce and Analytics.](./deployment-strategies/images/01.png)

## あらゆるデプロイ方法に対応

Liferayは常に、顧客が選択したソフトウェアスタックとインフラへの投資を維持することを目的としています。 そのため、Liferayは3つの製品を展開しており、顧客は要件に合ったアプローチを選択できます。

* **Liferay Experience Cloud SaaS**は、インフラやアップグレード関連の問題を心配することなく、Liferay DXPの完全な利点を提供します。 顧客はビジネス上の問題を解決するソリューションの構築に集中できる。
* **Liferay Experience Cloud Self-Managed**は、Liferayプラットフォーム向けにカスタマイズされたPlatform-as-a-Serviceを提供します。
* **Liferay DXP Self-Hosted**は、お客様がLiferay DXPの実装をどこでどのようにホストするかを選択することができます。

![Liferay offers deployment strategies for SaaS, PaaS, and on-premise deployments of Liferay DXP.](./deployment-strategies/images/02.png)

## SaaSファースト・アプローチ

顧客に3つの異なるデプロイメント戦略の柔軟性を提供しながらも、エンジニアリングとセールスの両方の観点から、LiferayのアプローチはSaaSファーストです。

つまり、製品イニシアチブは、SaaSオプションのエクスペリエンスと利用可能なツールや機能の改善と拡大に重点を置いている。

Liferayの社員であれパートナーであれ、営業担当者の役割は、見込み客がLiferay DXPでビジネス上の問題を解決することに集中するよう導くことであり、導入アプローチはSaaSであることを前提に始めることです。

このモジュールでは、営業担当者が見込み客にSaaSにできるかできないかを判断してもらう方法について説明する。

## Liferayアプリケーションの展開要件

Liferayアプリケーションが最終的にどのようにデプロイされるかに関係なく、そのデプロイをサポートするための基本的な要件は同じです。 本モジュールでは、プロスペクトの一例であるライフバンクを使用する。

* LifeBankはデジタル変革プロジェクトに取り組んでいる企業で、Low-Code/No-Code機能とコマースおよびアナリティクスを備えたデジタル・エクスペリエンス・プラットフォームが顧客に利益をもたらすと判断した。
* ライフバンクは、一般向けのウェブサイトを計画しているが、顧客が特定の機能にアクセスしたり、個人情報を保存したりできるよう、ログイン機能も提供する。
* ライフバンクは、顧客に合わせた体験を提供するデジタル・エクスペリエンス・プラットフォームを持つことのビジネス・バリューに焦点を当てる必要があり、それを望んでいる。

これらの情報から、Liferayはライフバンクに適していると言えます。

![LifeBank is a fictional company with requirements that are well met with Liferay DXP.](./deployment-strategies/images/03.png)

## Liferayアプリケーションのホスティング

ライフバンクはLiferay DXPでビジネス要件を満たすことができると確信したため、次のステップとして、最適な導入方法を決定する手助けをすることになりました。

どのようなソフトウェア・アプリケーションであっても、通常、様々なインフラやソフトウェア関連資産を適切に配置し、設定する必要がありますが、Liferayも同様です。 特にLiferayについては、6つの主要な考慮事項がある。

![Hosting Liferay Applications requires Infrastructure, Platform Software, Architecture, Monitoring, Security, and Upgrades and Updates.](./deployment-strategies/images/04.png)

* **インフラストラクチャー** - クラウド上であろうと会社の物理的施設内であろうと、コンピューター・サーバーとネットワーク・インフラストラクチャーを提供する必要がある。
* **プラットフォームソフトウェア** - データベース、検索エンジン、ウェブサーバなど、アプリケーションが適切にインス トールされるために必要なすべての関連ソフトウェアが含まれます。
* **アーキテクチャ** - どのようなビジネス・アプリケーションも、新しいマーケティング・キャンペーンのために拡張できなければならない。 事業継続性を確保するためには、障害検知や高可用性対策が必要になる。 本番環境だけでなく、開発やテストのためのさまざまな環境が必要になる。
* **モニタリング** - 状況は変化するかもしれないので、アプリケーションは常にモニタリングされ、分析される必要がある。
* **セキュリティ** - サイバー脅威がますます一般的になっているため、ユーザーは安全に接続し、データを保護しなければならない。 また、バックアップ・ルーチンとディザスター・リカバリー・プランも整備する必要がある。
* **アップグレードと更新** - アプリケーションは、新しい機能を提供し続けるために更新され、アップグレードされなければなりません。

## ソフトウェア開発ライフサイクル

![Custom software development requires a well defined Software Development Lifecycle, or SLDC.](./deployment-strategies/images/05.png)

上記の主な考慮事項に加え、コードの変更を伴うものは、変更がそれ自身の問題を引き起こさないようにするために、ソフトウェア開発ライフサイクル（SDLC）を通過しなければならない。 これには、新機能を含む変更、既存のカスタマイズの更新、および特定された問題の修正が含まれますが、これらに限定されません。

次へ [Liferayの展開戦略について説明](./deployment-strategies/deployment-strategies-explained.md) 
