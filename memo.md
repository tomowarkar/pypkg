## 汎用的な Python プロジェクトのテンプレートを探る

### pipenv の導入

- [Homepage](https://github.com/pypa/pipenv)

```bash
pipenv install --python 3.6
```

参考: [Python のパッケージ周りのベストプラクティスを理解する](https://www.m3tech.blog/entry/python-packaging)

### direnv の導入

- [Homepage](https://github.com/direnv/direnv)

```bash
echo layout pipenv >> .envrc
```

参考: [direnv::wiki Python](https://github.com/direnv/direnv/wiki/Python)

### 開発者ツール(リンター, フォーマッター)の導入

```bash
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

[チートシート](https://mypy.readthedocs.io/en/latest/cheat_sheet_py3.html)

### LICENCE, .gitignore の作成

- [Licenses](https://choosealicense.com/licenses/)
- [.gitignore](https://github.com/github/gitignore)

```bash
cat <<EOF >LICENSE
> MIT License
>
> Copyright (c) [year] [fullname]
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.
> EOF
```

```bash
curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
```
