# ファイルやフォルダーを無視する

Liferay Cloud では、サービスをデプロイする前に、どのファイルやフォルダーを無視するかを契約者が決定することができます。 これは、 `.lcpignore` ファイルを作成し、プロジェクトフォルダのトップレベル内に配置することで行います（例： `/etc/lfrlearn/` `lfrlearn` はプロジェクト名です）。 ここにファイルを置くことで、 **ignore** のルールを他のユーザーと共有することができます。

## `.lcpignore` ファイルを使用する。

1. プロジェクトのフォルダの場所に移動します。
1. `.lcpignore`というファイルを作成します。
1. 適宜、ファイルを修正してください。
1. ターミナルで `lcp deploy` を実行し、新しい `.lcpignore` のルールでサービスをデプロイしてください。

## LCP無視パターン

`.lcpignore` ファイルは、ファイル名に対するマッチングにグロビングパターンを使用します。 (これらは `.gitignore` ファイルで使われているパターンと同じです)。 管理者は、様々なシンボルを使ってこのようなパターンを構築することができます。

| パターン                                       | マッチング例                                                                                     | 説明*                                                                                           |
|:------------------------------------------ |:------------------------------------------------------------------------------------------ |:--------------------------------------------------------------------------------------------- |
| `**/service`                               | `service/file.txt`, or, `service/monday/foo.bar`, or `build/service/file.txt`              | パターンにアスタリスクを2つ付けると、リポジトリ内の任意の場所にあるフォルダーにマッチします。                                               |
| `**/service/file.txt`                      | `service/file.txt`; or `build/service/file.txt` but not `service/build/file.txt`           | ダブルアスタリスクを使用すると、ファイル名とその親フォルダーの名前に基づいてファイルが照合されます。                                            |
| `*.txt`                                    | `file.txt`, `foo.txt`, `.txt`, or, `service/file.txt`                                      | アスタリスクは、0個以上の文字にマッチするワイルドカードです。                                                               |
| `*.txt` or `!important.txt`                | `file.txt`, `trace.txt` but not `important.txt`, `service/important.txt`                   | パターンに感嘆符を付けると、そのパターンが否定されます。 あるファイルがパターンにマッチし、かつファイル内で後に定義された否定パターンにもマッチする場合、それは無視されない。       |
| `*.txt` or `!important/*.txt` or `trace.*` | `file.txt` `important/trace.txt` but not `important/file.txt`                              | 否定するパターンの後に定義されたパターンは、それ以前に否定されたファイルを無視します。                                                   |
| `/file.txt`                                | `file.txt`, but not `service/file.txt`                                                     | スラッシュを付けると、リポジトリルート内のファイルのみにマッチします。                                                           |
| `file.txt`                                 | `file.txt`, or `service/file.txt`                                                          | デフォルトでは、パターンは任意のフォルダーにあるファイルにマッチします。                                                          |
| `file?.txt`                                | `fileo.txt`, `files.txt` but not `file10.txt`                                              | クエスチョンマークを使用すると、正確に1文字にマッチします。                                                                |
| `file[0-9].txt`                            | `file0.txt`, `file1.txt`, but not `file10.txt`                                             | 角括弧を使用すると、指定した範囲内の1文字にマッチします。                                                                 |
| `file[01].txt`                             | `file0.txt`, `file1.txt`, but not `file2.txt` nor `file01.txt`                             | 角括弧を使用すると、指定された集合から1つの文字にマッチします。                                                              |
| `file[!01].txt`                            | `file2.txt`, but not `file0.txt`, nor `file1.txt`, nor `file01.txt`                        | 感嘆符は、指定された文字以外の文字にマッチします。                                                                     |
| `file[a-z].txt`                            | `filea.txt`, `fileb.txt`, but not `file1.txt`                                              | 範囲には、数値またはアルファベットを使用することができる。                                                                 |
| `txts`                                     | `txts`, `txt/file.txt`, `txts/latest/foo.bar`, `build/txts`, `build/txts/file.txt`         | スラッシュが **でなく** であった場合、その名前のファイルとフォルダの内容の両方にマッチします。 左のマッチの例では、 `txts` という名前のフォルダとファイルの両方が無視されます。 |
| `txts/`                                    | `txts/file.txt`, `txts/latest/foo.bar`, `build/txts/foo.bar`, `build/txts/latest/file.txt` | スラッシュを付けると、パターンがフォルダーであることを示します。 その名前に一致するリポジトリ内のフォルダの内容全体（すべてのファイルとサブフォルダを含む）は無視されます。        |
| `txts/**/file.txt`                         | `txts/file.txt`, `txts/monday/file.txt`, or `txts/monday/pm/file.txt`                      | ダブルアスタリスクは、0個以上のフォルダーにマッチします。                                                                 |
| `txts/*day/file.txt`                       | `txts/monday/file.txt` or `txts/tuesday/file.txt`, but not `txts/latest/file.txt`          | ワイルドカードは、フォルダ名にも使用することができます。                                                                  |
| `txts/file.txt`                            | `txts/file.txt`, but not `file.txt` `build/txts/file.txt`                                  | 特定のフォルダーにあるファイルを指定するパターンは、リポジトリルートからの相対パスです。 なお、スラッシュを前につけても効果はない。                            |

ベストプラクティスとして、 `.lcpignore` ファイルをプロジェクトのトップレベルのフォルダーに置いてください。 リポジトリに複数の `.lcpignore` ファイルがある場合（推奨しません）、Liferay Cloud はそれらを統一されたドキュメントとして読み込みます。

```{note}
ファイルやフォルダがデプロイされ、管理者が後でそれを無視したい場合、Liferay Cloud は後続のルールがそのファイルやフォルダを含めようとすると、ファイルを無視しないようにします。 むしろ、そのファイルやフォルダは更新されません。
```

## 追加情報

* [Liferayサービスの紹介](../using-the-liferay-dxp-service/introduction-to-the-liferay-dxp-service.md)
* [Liferay サービスを設定する](../using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
