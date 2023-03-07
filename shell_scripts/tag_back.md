# 이전 tag checkout 가이드

**1. tag 지정하여 branch 생성**

```bash
git checkout -b {branch 명} {tag_version}
dvc checkout
```

**2. 생성한 branch에서 데이터 변경 후, 반영**

```bash
dvc add train_data
git add traiin_data.dvc
git commit -m "{commit_message}"
```

**3. branch 재배치(rebase 충돌 해결)**

```bash
git rebase main
============충돌 발생==========
# 충돌되는 코드(train_data.dvc) manual 하게 수정 #

git add train_data.dvc
git commit -m "{commit_message}"
git rebase --continue
```

**4. 생성한 branch를 main으로 merge**

```bash
git checkout main
git merge --no-ff -m "{commit_message}" {branch 명}
```

**5. 태깅 및 dvc 등록**
```bash
git tag -a {tag_version} -m "{tag_message}"
git push
git push origin {tag_version}
dvc push
```