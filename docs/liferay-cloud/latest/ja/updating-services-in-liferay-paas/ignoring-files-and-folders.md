# ファイルとフォルダを無視する

Liferay Cloud では、サービスをデプロイする前に、どのファイルやフォルダーを無視するかを契約者が決定することができます。 これは、 `.lcpignore` ファイルを作成し、プロジェクトフォルダーの最上位レベル内に配置することで行われます（例： `/ etc/lfrlearn /` ここで、 `lfrlearn` はプロジェクト名です）。 ここにファイルを配置することで、 **ignore** ルールを他のユーザーと共有できます。

## `.lcpignore` ファイルの使用

1. プロジェクトフォルダの場所に移動します。
1. `.lcpignore`というファイルを作成します。
1. それに応じてファイルを変更します。
1. ターミナルで `lcp deploy` を実行して、新しい `.lcpignore` ルールでサービスをデプロイします。

## LCP Ignoreパターン

`.lcpignore` ファイルは、グロビングパターンを使用してファイル名と照合します。 （これらは `.gitignore` ファイルで使用されるものと同じパターンです。） 管理者は、さまざまなシンボルを使用してそのようなパターンを構築できます。

| パターン                                       | 一致の例                                                                                       | 説明*                                                                                                  |
|:------------------------------------------ |:------------------------------------------------------------------------------------------ |:---------------------------------------------------------------------------------------------------- |
| `**/service`                               | `service/file.txt`, or, `service/monday/foo.bar`, or `build/service/file.txt`              | パターンの前にダブルアスタリスクを付けると、リポジトリ内の任意の場所のフォルダに一致します。                                                       |
| `**/service/file.txt`                      | `service/file.txt`; or `build/service/file.txt` but not `service/build/file.txt`           | ダブルアスタリスクを使用すると、ファイルの名前と親フォルダーの名前に基づいてファイルが照合されます。                                                   |
| `*.txt`                                    | `file.txt`, `foo.txt`, `.txt`, or, `service/file.txt`                                      | アスタリスクは、0個以上の文字に一致するワイルドカードです。                                                                       |
| `*.txt` or `!important.txt`                | `file.txt`, `trace.txt` but not `important.txt`, `service/important.txt`                   | パターンの前にエクスクラメーション・マークを付けると、パターンが無効になります。 ファイルがパターンに一致するが、ファイルで後で定義された否定パターンにも一致する場合、それは無視されません。      |
| `*.txt` or `!important/*.txt` or `trace.*` | `file.txt` `important/trace.txt` but not `important/file.txt`                              | 否定パターンの後に定義されたパターンは、以前に否定されたファイルを無視します。                                                              |
| `/file.txt`                                | `file.txt`, but not `service/file.txt`                                                     | 先頭にスラッシュを付けると、リポジトリルート内のファイルのみが一致します。                                                                |
| `file.txt`                                 | `file.txt`, or `service/file.txt`                                                          | デフォルトでは、パターンは任意のフォルダ内のファイルと一致します                                                                     |
| `file?.txt`                                | `fileo.txt`, `files.txt` but not `file10.txt`                                              | 疑問符を使用すると、正確に1文字と一致します。                                                                              |
| `file[0-9].txt`                            | `file0.txt`, `file1.txt`, but not `file10.txt`                                             | 角括弧を使用すると、指定した範囲の1文字と一致します。                                                                          |
| `file[01].txt`                             | `file0.txt`, `file1.txt`, but not `file2.txt` nor `file01.txt`                             | 角かっこを使用すると、指定したセットの1文字と一致します。                                                                        |
| `file[!01].txt`                            | `file2.txt`, but not `file0.txt`, nor `file1.txt`, nor `file01.txt`                        | エクスクラメーションマークを使用すると、指定したセットの文字以外のすべての文字に一致します。                                                       |
| `file[a-z].txt`                            | `filea.txt`, `fileb.txt`, but not `file1.txt`                                              | 範囲は数値またはアルファベットにすることができます。                                                                           |
| `txts`                                     | `txts`, `txt/file.txt`, `txts/latest/foo.bar`, `build/txts`, `build/txts/file.txt`         | スラッシュがある場合は **not** 付加し、パターンがその名前のファイルとフォルダの内容の両方に一致します。 左の一致例では、 `txts` という名前のフォルダーとファイルの両方が無視されます。 |
| `txts/`                                    | `txts/file.txt`, `txts/latest/foo.bar`, `build/txts/foo.bar`, `build/txts/latest/file.txt` | スラッシュを追加すると、パターンがフォルダーであることを示します。 その名前に一致するリポジトリ内のすべてのファイルとサブフォルダを含むフォルダの内容全体は無視されます。                |
| `txts/**/file.txt`                         | `txts/file.txt`, `txts/monday/file.txt`, or `txts/monday/pm/file.txt`                      | 二重アスタリスクは、0個以上のフォルダーと一致します。                                                                          |
| `txts/*day/file.txt`                       | `txts/monday/file.txt` or `txts/tuesday/file.txt`, but not `txts/latest/file.txt`          | ワイルドカードは、フォルダフォルダ名にも使用できます。                                                                          |
| `txts/file.txt`                            | `txts/file.txt`, but not `file.txt` `build/txts/file.txt`                                  | 特定のフォルダ内のファイルを指定するパターンは、リポジトリルートを基準にしています。 スラッシュを前に付けても効果がないことに注意してください。                             |

ベストプラクティスとして、 `.lcpignore` ファイルをプロジェクトの最上位フォルダに保持します。 リポジトリに複数の `.lcpignore` ファイルがある場合（推奨しません）、Liferay Cloud はそれらを統一されたドキュメントとして読み込みます。

```{note}
ファイルやフォルダがデプロイされ、管理者が後でそれを無視したい場合、Liferay Cloud は後続のルールがそのファイルやフォルダを含めようとしても、ファイルを無視しないようにします。 むしろ、そのファイルやフォルダは更新されません。
```

## 関連トピック

* [Liferay DXPサービスの使用](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md)
* [Liferay サービスを設定する](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
