---
visibility:
- Employee
- Partner
---
# Liferay Experience Cloud SaaSの価格 - アドオンと今後の機能

**概要**

* ライフェエクスペリエンスクラウドSaaSの2023年新価格モデル
* 顧客の成長に応じてアドオンを提供
* カスタマー・エクスペリエンスを向上させ、従業員やパートナーに可視性を提供する新機能が追加されます。

## Liferay Experience クラウド SaaS アドオン

MALUを増やしたりAPVを増やしたりするだけでなく、上位プランへの移行に縛られない顧客拡大の方法もある：

* ストレージ
* プロジェクト・ワークスペース
* 延長容量
* 専用リソース

### ストレージ

ドキュメント・ライブラリに大量のドキュメント、画像、その他の資産を保存する必要があるお客様のソリューションについては、ストレージ容量を追加購入することが可能です。

それぞれのプランで開始時のストレージ容量は異なるが、後から容量を追加する必要が生じた場合は、上位プランへの移行に加えて、アドオンとして購入することができる。

### プロジェクトワークスペース

Liferay Experience Cloud SaaS は **Project Workspace** のコンセプトを導入しています。 プロジェクト・ワークスペースは、顧客が必要とするさまざまなタイプの環境とさまざまなタイプのユーザー・ベースをカプセル化する方法である。 ほとんどのお客様は、単一のプロジェクト・ワークスペースを使用しますが、お客様によっては、完全に分離されたユーザー・ベースが必要なソリューションがあるかもしれません。

追加のプロジェクト・ワークスペースが必要になるケースとしては、複数のビジネスを展開している顧客で、その事実を公にしたくない場合が考えられます。 たとえば、あるメーカーがプレミアムとエコノミーの製品ラインを製造し、それぞれを異なるブランドで販売することがある（例：luxewidgets.com & basicwidgets.com）。 このシナリオでは、すでにluxewidgets.comのウェブサイトにメールアドレスを登録している顧客が、basicwidgets.comのウェブサイトにもサインアップしようとしたときに、そのメールアドレスですでにアカウントが存在することを警告するメッセージが表示されないようにすることが重要です。

Liferay DXP が電子メール・アドレスをどのように処理するか、また Liferay Experience Cloud がどのように設計されているかによって、これは、これらのソリューションがそれぞれ別のプロジェクト・ワークスペースで作成されている場合にのみ可能です。

各Project WorkspaceにはProduction環境とUAT環境があり、Liferay DXPとExtensionsのキャパシティが含まれます。 ビジネスプランとエンタープライズプランの場合、各プロジェクト・ワークスペースには開発環境も含まれます。

それぞれのプランで、プロジェクト・ワークスペースの数は異なります：

* **プロ** : 1 プロジェクト・ワークスペース
* **Business** : 5つのプロジェクト・ワークスペース
* **Enterprise** : 10プロジェクト・ワークスペース

プラン間を移動して利用可能なプロジェクト・ワークスペースを増やすだけでなく、各プランのワークスペースを追加購入することも可能です。

```{note}
プロジェクト・ワークスペースのコンセプトは新しく、Liferay Experience Cloud SaaS専用です。 その他のユースケースでは、Liferay DXP [仮想インスタンス](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/virtual-instances) 機能を使用して同様の結果を得ることができます。  
```

### 延長容量

ほとんどのオプションと同様に、各プランで提供されるエクステンションの容量は異なります：

* **Pro** : 1 GB RAM / 1 vCPU
* **ビジネス** : 4 GB / 8 vCPU
* **エンタープライズ** : 6 GB / 12 vCPU

この場合も、プラン間の移動に加えて、延長容量を追加購入することができる。 エクステンションキャパシティは、お客様がクライアントのエクステンションをホストする場所です。 以前のモジュールで取り上げたように、クライアント・エクステンションは、カスタマイズされたソリューション開発を実装する方法である。  多くの場合、これらのクライアント・エクステンションは、ある程度のコンピューティング・パワーとメモリ容量を必要とし、クライアント・エクステンションの数と性質に応じて、お客様は追加容量を購入する必要があるかもしれません。

### 専用リソース

Liferay Experience Cloud SaaSはマルチテナント環境で、各Liferay顧客は他の顧客とLiferayインスタンスを共有します。  技術的な用語で言えば、各顧客は本番環境、UAT環境、そしてもしあれば開発環境用にLiferay " [仮想インスタンスを理解する](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances) " を手に入れることになります。

お客様が必要な場合、または自分自身からインストールを分離したい場合は、専用のLiferayインスタンスとデータベースを提供するDedicated Resourcesを購入することができます。

ここで重要なのは、これはプライベート・クラスタではないということだ。まだいくつかの共有リソースがあるので、セミプライベート・クラスタとみなすことができる。 Liferay Experience Cloud Self-Managed には、フルプライベートクラスターのアドオンオプションが用意されています。

### アドオンの価格

![利用可能なアドオンは、ストレージ、プロジェクト・ワークスペース、拡張容量、専用リソースです。](./liferay-pricing-saas/images/06.png)

上記の例では、アドオンの価格を米ドルとユーロで表示しています。 その他の通貨については、LiferayのコンタクトパーソンとCAMが正確な価格を提供できますが、目安の価格については、通常の為替レートを使用して各市場の現地価格に換算してください。

エンタープライズプランのバンドルとして追加ドメインを購入できる可能性は、将来のアドオンの可能性として調査中です。

## 成功が成長を促進する

Businessには15サイト、Enterpriseには無制限のサイト数が含まれるため、顧客が必要とするサイト数と使用数は、上位プランではあまり関係なくなります。

これが意味するのは、2022年の価格モデルの大きな制限であった、サイトを追加しても顧客にとって高額にならないということだ。

この柔軟性により、顧客は成長に合わせてより多くのソリューションを構築することができ、顧客にとっての価値が高まる。 彼らの利用やエンドユーザーのエンゲージメントが高まるにつれて、MALUやAPVのボリュームが増加し、それがLiferayやパートナーにとっても収益の増加につながります。

パートナーにとっては、最初のプロジェクトが完了した後も、すぐに新しいインスタンスを購入する必要なく、顧客のために新しいソリューションを構築し続けることが可能になった。 顧客が複数のソリューションを持っている場合、各ソリューションのMALUとAPVは合算され、その合計で12ヶ月の契約期間に必要なMALUとAPVの帯域が決定される。

これにより、ソリューションを構築するパートナーはLiferayとともに収益を拡大し、顧客はLiferayアカウントからより多くの価値を得ることができます。

## さいごに

最後に、このモジュールには、新しい価格モデルを強化するための追加機能と項目がいくつかあります：

* 製品に関するお知らせ
* 製品ダッシュボード
* イネーブルメント・アセット
* フリープラン

### 製品に関するお知らせ

製品通知は現在開発中であり、顧客がMALUとAPVの制限に近づいているかどうかを理解できるようにするため、特に重要である。 LiferayのカスタマーサクセスチームとLiferayのパートナーに使用されます。

すべての関係者が残りの使用量を認識することで、早い段階から会話を始め、より高いレベルに移行するための選択肢を提供することが可能になる。 そのうちに、お客さまから積極的に引っ越しを希望されるようになることも予想されます。

これにより、顧客が知らずに利用限度額を超えてしまい、予期せず超過料金を請求されるという事態を防ぐことができる。

### 製品ダッシュボード

ダッシュボードも計画されており、利用指標を単に課金目的に使用するだけでなく、プラットフォームがどのように利用されているのか、ソリューションがどのように機能しているのか、どのような利用があり、どのような傾向があるのかを顧客が理解できるようにする。

これらを整備することで、顧客とのより親密な会話をサポートし、ソリューションを改善する機会を特定するのに役立つ。

### イネーブルメント・アセット

イネーブルメントに関しては、さらなるシナリオ、例、テストを計画しており、新しいパートナーポータルの準備が整い次第、インタラクティブな価格計算ツールも提供する予定です。

パートナーポータルの準備が整うまで、価格に関する質問がある場合は、CAMや他のLiferayチームメンバーにお問い合わせください。

### フリープラン

先に述べたように、私たちは採用を促進し、オープンソース企業としてのLiferayにとって重要な、より多くの、より良いフィードバックを得るためのボトムアップアプローチを提供するために、Free or Hobbyプランを導入する計画を持っています。

この無料プランはまた、新しい潜在顧客を特定し、彼らのニーズを理解するのに役立ち、そうすることで、見込み客とのより有意義な会話を可能にし、新しいユースケースや製品強化の可能性を特定する。

## 実世界での検証

新しい価格モデルが定義されたとき、Liferayの大規模なチームによって大規模な作業が行われました。その一部には、新しい価格モデルが現在のモデルから移行した場合にどのような影響を与えるかを理解するために、既存の顧客の数字や使用指標を見直すことが含まれていました。

2023年初頭にこの価格設定を開始して以来、現場からのフィードバックは全体的にポジティブで、建設的な批判もいくつかあった。  価格設定モデルを使って多くの案件が成約しており、各案件の学習にも役立っている。 引き続きご意見をお寄せください。

[Liferay Experience Cloud セルフマネージド (PaaS) の価格設定](./liferay-pricing-paas.md) を使用して、Liferay の価格設定について学習を続けてください。