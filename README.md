# This is tools branch

pypkgをより使いやすくするためのツール専用ブランチ

## tools

### md2html

マークダウンパーサー

`.md`ファイルを`.html`ファイルに変換する

```bash:bash
$ sh md2html.sh input.md
```

なおGithub Pagesを使用する場合内部リンクが崩壊する場合があるので別途修正が必要

以下は`docs/`配下のマークダウンファイルから相対参照でレポジトリ内のソースファイルをソースにしている場合の変更である

```bash:bash
$ sed -i.bak 's/<a href="\.\.\/\([^"]*\)/<a href="https:\/\/github.com\/{user name}\/{preo name}\/blob\/master\/\1/g' input.html
```

### new

pythonのテストファイルとパッケージファイルを一緒に作る

```bash:bash
$ sh new.sh hoge
```
