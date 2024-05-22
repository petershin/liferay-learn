---
toc:
  - ./application-development/modeling-data-structures.md
  - ./application-development/implementing-business-logic.md
  - ./application-development/designing-user-interfaces.md
---
# アプリケーション開発

Liferayのすぐに使える機能では、必要な機能をすべてカバーできないことがあります。 そうなれば、Liferayとインターフェイスする独自のアプリケーションを開発し、その機能を活用することができます。

ここでは、世界中の流通業者にメープルシロップ製品を供給する架空のB2B生産者、デレクタブル・ボンサイの物語を続けよう。 最近の成長により、Delectable BonsaiはB2Bの文脈でディストリビューターの申請を受け取り、承認するためのカスタムソリューションを必要としています。

<!--TASK:
Due to recent growth, Delectable Bonsai needs two custom solutions to streamline business processes and better serve customers: 

1. A distributor application flow for receiving and approving distributors in a B2B context

1. A Ticketing System for customers to report issues and open requests
-->

![ディストリビューターのアプリケーションフローを作成する。](./application-development/images/01.png)

このアプリケーションは、LXC、LXC-SM、セルフホスト環境で展開可能で、Delectable Bonsaiのパートナーは、新規ビジネスアカウントの申請と取得に使用できる。

終了時には、次のことを学んでいることだろう。

* Liferay Objectsを使って、ヘッドレスAPIやパーミッションなど、Liferayのコアフレームワークを活用したカスタムデータ構造を定義・管理できます。
* Liferayのページビルダー機能を使って、オブジェクトエントリーを作成・表示するためのエクスペリエンスをデザインしましょう。
* マイクロサービスのクライアント拡張機能を使用して、ソリューションにバックエンド機能を提供します。
<!--TASK: * Use frontend client extensions to build dynamic user experiences that integrate with object APIs. -->
<!--TASK: * Promote custom applications from UAT/DEV to PRD environments. -->

Start by [データ構造のモデリング](./application-development/modeling-data-structures.md) ！



<!--TASK:
:::{grid-item-card} Module Four: Building a Ticketing System
:link: ./application-development/building-a-ticketing-system.md

Learn how to use advanced features to develop a ticketing system.
:::  
-->
