## 汎用的な Python プロジェクトのテンプレートを探る

### pipenv の導入

- [Homepage](https://github.com/pypa/pipenv)

```bash:bash
pipenv install --python 3.6
```

参考: [Python のパッケージ周りのベストプラクティスを理解する](https://www.m3tech.blog/entry/python-packaging)

### direnv の導入

- [Homepage](https://github.com/direnv/direnv)
- [.envrc](../.envrc)

```bash:bash
echo layout pipenv >> .envrc
```

参考: [direnv::wiki Python](https://github.com/direnv/direnv/wiki/Python)

### 開発者ツール(リンター, フォーマッター)の導入

- [Pipfile](../Pipfile)

```bash:bash
pipenv install --dev flake8 black isort mypy pytest
```

#### flake8

- [Homepage](https://gitlab.com/pycqa/flake8)

[PEP8](https://www.python.org/dev/peps/pep-0008/)準拠のコードチェックツール

Usage: `pipenv run lint files ...`

#### black

- [Homepage](https://github.com/psf/black)

[PEP8](https://www.python.org/dev/peps/pep-0008)準拠の自動整形ツール

Usage: `pipenv run format files ...`

#### isort

- [Homepage](https://github.com/timothycrosley/isort)

[PEP8](https://www.python.org/dev/peps/pep-0008/)に準拠した package の並び替えツール

Usage: `isort files ...`

#### mypy

- [Homepage](https://github.com/python/mypy)

型ヒントの静的解析ツール [PEP484](https://www.python.org/dev/peps/pep-0484/)

参考: [チートシート](https://mypy.readthedocs.io/en/latest/cheat_sheet_py3.html)

### LICENCE, .gitignore の作成

- [LICENSE](../LICENSE)
- [.gitignore](../.gitignore)

参考: [Licenses](https://choosealicense.com/licenses/)

参考:  [.gitignore](https://github.com/github/gitignore)

```bash:bash
cat <<EOF >LICENSE
MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
```

```bash:bash
curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
```

### ライブラリの作成

```bash:bash
mkdir -p src/pkg tests
touch src/pkg/{__init__,main}.py
touch tests/{__init__,test_main}.py
touch setup.{py,cfg}
```

参考: [Packaging a python library](https://blog.ionelmc.ro/2014/05/25/python-packaging/)

参考: [setup using setup cfg files](https://setuptools.readthedocs.io/en/latest/setuptools.html#configuring-setup-using-setup-cfg-files)

### ライブラリインストールチェック, pytest チェック

- Update [`src/pkg/main.py`](../src/pkg/main.py)

```bash:bash
pip install -e .
python
>>> from pkg.main import hello
>>> hello()
'hello python'
```

- Update [`tests/test_main.py`](../tests/test_main.py)

```bash:bash
pytest
============= test session starts =============
platform darwin -- Python 3.6.8, pytest-5.4.2, py-1.8.1, pluggy-0.13.1
rootdir: /Users/tomowarkar/Desktop/github/pypkg
collected 1 item

tests/test_main.py .                    [100%]

============== 1 passed in 0.03s ==============
```

### CircleCI の 設定

参考: [CircleCI のローカル CLI の使用](https://circleci.com/docs/ja/2.0/local-cli/)

- Update [`.circleci/config.yml`](../.circleci/config.yml)

CircleCI の設定をしようとしたら、以下のエラーでつまづいた。

```bash:bash
$ circleci config validate
Config file at .circleci/config.yml is valid.
$ circleci local execute

(中略)

['Traceback (most recent call last):\n', '  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 501, in create_spinner\n    yield sp\n', '  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 649, in venv_resolve_deps\n    c = resolve(cmd, sp)\n', '  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 539, in resolve\n    sys.exit(c.return_code)\n', 'SystemExit: 1\n']
Error:
Exited with code exit status 1

Step failed
Error: runner failed (exited with 101)
Task failed
Error: task failed
```

原因はどうやら `Pipfile.lock` 周りで起きているらしい。

```bash:bash
$ pipenv update
Running $ pipenv lock then $ pipenv sync.
Locking [dev-packages] dependencies…
✘ Locking Failed!

(中略)

There are incompatible versions in the resolved dependencies.
```

同様の案件は結構起きているらしいが、どうすれば解決できるかという点は結構あやふやな答えが多かった。

ライブラリのバージョンにあたりをつけて手を動かしてみると `black = "==19.10b0"` とバージョンを固定してあげることで解決した。

参考: [Pipenv でよく出喰わす問題](https://pipenv-ja.readthedocs.io/ja/translate-ja/diagnose.html)


### README.md のアップデート

参考: [shields](https://shields.io/)

参考: [A template to make good README.md](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)

```bash:bash
curl -o README.md https://gist.githubusercontent.com/PurpleBooth/109311bb0361f32d87a2/raw/8254b53ab8dcb18afc64287aaddd9e5b6059f880/README-Template.md
```

### ドキュメントツール sphinx の導入

参考: [Sphinx::docs](https://www.sphinx-doc.org/ja/master/)

- Update [`docs/source/conf.py`](../docs/source/conf.py)

- Update [`docs/source/index.rst`](../docs/source/index.rst)

```bash:bash
pipenv install -dev sphinx sphinx_rtd_theme
sphinx-quickstart docs
cd docs && make html && cd ..

# ./src/pkg 配下を参照して rst ファイルを ./docs/source に自動生成
sphinx-apidoc -f -o ./docs/source ./src/pkg

# ./docs/source を参照して rst -> html 変換, ./docs/build に出力
sphinx-build -a ./docs/source ./docs/build
```
### github pages への対応

Settings (https://github.com/{user}/{repo}/settings) > GitHubページ > Source > `master branch /docs folder`

Github Pages は jekyll で処理され、jekyllは　sphinx に対応していないため　cssなど_(under bar)がつくファイルを参照しない.

そのためGithubPagesのソースディレクトリ(今回は /docs) 配下に 空の .nojekyll を作成することで jekyll を 使わず処理することができ、sphinx の css などもうまく適応される。

```bash:bash
:> docs/.nojekyll
```