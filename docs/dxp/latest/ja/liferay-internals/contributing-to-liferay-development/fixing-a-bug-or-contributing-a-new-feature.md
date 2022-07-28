# Fixing a Bug or Contributing a New Feature

バグ修正や機能貢献のための学習では、まず、システムの作り方に慣れることが大切です。 Liferay Portal のビルドシステムに、ant all によるフルビルドとは対照的に、ナイトリースナップショットバンドルを使用するオプションが追加されました。 これにより、システム構築のための時間を大幅に短縮することができました。 *ant all* は、動作するシステムを構築するのに15〜30分かかることがありますが、スナップショットを使用すると数分で済みます。

詳しくは、 [Building Liferay Source](./building-liferay-source.md) をご覧ください。

## 不具合の修正

Liferay Portalを構築したら、プラットフォームの最新リビジョンを使ってバグが再現されるかどうかを確認します。 多くの場合、そのバグはLiferay Portalの開発ビルドですでに対処されています。 また、masterブランチに対してプルリクエストを発行してください。 他のブランチに対するプルリクエストは受け付けられません。

Liferay Portalの基本的なコード構造を学び、どこにバグがありそうなのかを確認することができます。 Liferay Portal は非常に大きな製品で、特定の機能のコードがどこにあるかを見つけるのは、最初は大変なことかもしれません。 しかし、コードは明確に定義されたパターンに従っており、そのパターンを覚えてしまえば、コードの領域を特定することは非常に簡単になります。 詳しくは、 [ソースがどのように構成されているか](./organizing-the-source.md)をご覧ください。

バグを修正し、Liferayを再構築して再起動し、直ったかどうか確認してみてください そうでない場合は、修正できるまで繰り返しましょう。 絶対に必要以上のコードには触れないようにしてください。

コードの変更を git リポジトリにコミットし、Github</a>の main

liferay-portal repo に対して pull request を発行してください。</p> 

[issues.liferay.com](https://issues.liferay.com/secure/Dashboard.jspa) にあるバグレポートの Contribute Solution をクリックして、あなたがそれを修正し、プルリクエストを記録したことを文書化し、私たちのコミュニティにお返しをしたことを祝福してください。 詳しくは、 [Building Liferay Source](./building-liferay-source.md) をご覧ください。



## 新機能を提供する

Liferayは、開発者コミュニティからの貢献と革新によって繁栄しており、新しいアイデアを実装することで、ユーザーのニーズを満たすためにプラットフォームを継続的に進化させることができます。 もしあなたがLiferayの開発をしたことがないのであれば、コードを学ぶのに時間をかけ、おそらくいくつかのバグを修正し、プロセスを理解する必要があります。 

Liferay Portalの多くの機能はモジュールによって追加されるようになり、Liferay Marketplaceを通じて新しい機能を公開することが容易になりました。 一般的な経験則では、それがマーケットプレイスプラグインになることができれば、それはマーケットプレイスプラグインになるはずです。 マーケットプレイスのプラグインは、一般的にコアの貢献よりも受け入れられやすいと言われています。 もし新しい機能がLiferay Marketplaceプラグインとして実装できない場合は、 [Suggestions and Features](https://liferay.dev/en/forums-redirect/-/message_boards/category/1108052) フォーラムで議論を始め、あなたのアイデアに関心があるかどうかを確認し、あなたを指導してくれる潜在的な協力者を確認することが最善です。 詳しくは、 [Marketplace WebSite](https://marketplace.liferay.dev/) をご覧ください。

その機能を実装し、関連するテストを行い、徹底的にテストして、あなたが考えるとおりに動作することを確認します。 必要に応じてプルリクエストを発行する。

*Contribute Solution* on the feature request ticket on [issues.liferay.com](https://issues.liferay.com/secure/Dashboard.jspa) to document that you've implemented it and have recorded the pull request(s), and congratulate yourself on giving back to our community!