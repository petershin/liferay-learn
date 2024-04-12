# Liferay 7.4でのBootstrap 3互換性レイヤーの使用

Liferay DXP 7.4 GA1では、 [Bootstrap 3](https://getbootstrap.com/) 互換性レイヤーはLiferayフロントエンドアプリケーションの組み込みパッケージから削除されています。 以前のバージョンからアップグレードする場合、CSSコードを Bootstrap 3に依存しているプロジェクトには、外部パッケージとして互換性レイヤーを含める必要があります。

```{note}
`gulp upgrade`コマンドを使用してLiferay 7.4に[テーマをアップグレード](../../../site-building/site-appearance/themes/upgrading-a-theme.md)すれば、自動的にBootstrap 3互換性レイヤーをアップグレードに含めることができます。 この場合、そのテーマに手動で互換性レイヤーを追加する必要はありません。
```

```{warning}
Bootstrap 3互換性レイヤーは、Liferay 7.4 GA1へのアップグレードをよりスムーズに行うために、外部パッケージとしてのみ提供しています。 それ以降のバージョンでは動作しないようになっているので、早めに交換した方がよいでしょう。
```

## 互換性レイヤーのインストール

次のコマンドを実行して、互換性レイヤーを外部パッケージとしてインストールし、プロジェクトで使用できるようにします。

```bash
npm install @liferay/bs3-bs4-compat
```

また、下記コマンドを実行すると、Yarnを使用してインストールすることができます。

```bash
yarn add @liferay/bs3-bs4-compat
```

一度互換性レイヤーをインストールすれば、Bootstrap 3との互換性が必要なプロジェクトで使用することができます。

## プロジェクトで互換性レイヤーを使用する

互換性レイヤーを使用するには、それをプロジェクトの `clay.scss`ファイルにインポートする必要があります（ただし、 [7.4へのアップグレード](../../../site-building/site-appearance/themes/upgrading-a-theme.md)の一部としてすでに含まれているテーマは除きます）。

atlasテーマの変数が必要な場合は、これをプロジェクトの `src/css/clay.scss`ファイルに追加してください。

```css
@import 'clay/atlas';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/atlas_variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

atlasテーマ変数を必要 **としない** 場合は、代わりに以下をプロジェクトの`src/css/clay.scss`ファイルに追加してください。

```css
@import 'clay/base';

@import '@liferay/bs3-bs4-compat/scss/variables';

@import '@liferay/bs3-bs4-compat/scss/components';
```

Bootstrap 3互換性レイヤーがテーマに含まれるようになり、Liferay DXP 7.4 GA1で機能するようになりました。 次の作業は、プロジェクトのコードを変更して、Bootstrap 3 への依存を解消することです。

## 関連トピック

* [テーマのアップグレード](../../../site-building/site-appearance/themes/upgrading-a-theme.md)
* [7.4で廃止予定の機能](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md#features-deprecated-in-7-4)
