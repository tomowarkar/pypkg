# pypkg

pythonプロジェクトのテンプレートを目指して作成したレポジトリ

## Getting Started

cloneすることで手元でも同じように動かすことができます(たぶん(知らんけど))

### Prerequisites

#### 必須

- [pipenv](https://github.com/pypa/pipenv)

#### あると良い

- [deirenv](https://github.com/direnv/direnv)
- [circleci](https://circleci.com/docs/2.0/local-cli/)


### Installing

#### レポジトリの継承

```bash
git clone git@github.com:tomowarkar/pypkg.git pypkg
cd pypkg
git remote set-url origin git@github.com:username/repo.git
git push origin master
```
#### Prerequisitesの挿入

```bash
sudo pip install pipenv
pipenv install -dev
```

- you should update `docs/source/conf.py`
- you should update `setup.cfg`
- you should update `LICENSE`

if you need more detail

see [here](https://tomowarkar.github.io/pypkg/history)


## Usage

see [here](https://tomowarkar.github.io/pypkg/build/index)

[this is another option](https://github.com/tomowarkar/pypkg/tree/tools)

## Authors

[**tomowarkar**](https://github.com/tomowarkar)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments
