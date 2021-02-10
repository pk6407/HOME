# git merge
1. 새로운 브랜치 생성 - `git branch 브랜치이름`
2. 브랜치 헤드 이동 - `git checkout 브랜치이름`
```text
참고
git checkout -b 브랜치이름

# 위의 명령어는 아래의 두 명령어를 합한 것 
git branch 브랜치이름
git checkout 브랜치이름
```
- 헤드 이동 후 add / commit
- master(main) 브랜치로 head 이동(`git checkout master(main)`)
- `git merge 합칠브랜치이름`
3. git push
4. 브랜치 삭제 - `git branch -d 제거할브랜치이름`

# 깃으로 협업하기 - 기본 순서
## 1. 프로젝트 참여자 - `git clone` 명령으로 로컬 저장소를 만든다.
`git clone` 명령으로 중앙 원격 저장소를 복제하여 자신의 로컬 저장소로 만들 수 있다. 프로젝트 참여자는 이 로컬 저장소에서 작업을 수행한다.
```text
git clone [중앙 원격 저장소 URL]
```
## 2. 새로운 기능 개발을 위해 격리된 branch 생성
```text
git checkout -b [새로운브랜치이름]
```
## 3. 로컬 저장소의 새로운 기능 브랜치를 중앙 원격 저장소에 push
```text
git add .
git commit -m "Write commit message"
git push -u origin [새로운브랜치이름]

// -u 옵션으로 한 번 연결한 후에는 옵션 없이 아래의 명령만으로 기능 브랜치를 올릴 수 있다.
git push -origin [새로운브랜치이름]
```

## 4. 프로젝트 관리자에게 자신의 기여분을 반영해달라는 ```pull request```를 던진다.
프로젝트 관리자에게 자신의 기여분을 중앙 원격 코드 베이스에 반영해달라고 요청한다. 새로 만든 기능 개발용 브랜치도 중앙 저장소에 올려서 팀 구성원들과 개발 내용에 대한 의견(코드 리뷰 등)을 나눌 수 있다.
- master 브랜치를 손대지 않기 때문에 다른 기능 개발 브랜치를 얼마든지 올려도 된다.
- 로컬 저장소 백업 역할을 하기도 한다.

```text
pull request
- 기능 개발을 끝내고 master에 바로 병합(merge)하는 것이 아니라, 브랜치를 중앙 원격 저장소에 올리고 master에 병합(merge)해달라고 요청하는 것
```

## 5. 프로젝트 관리자는 변경 내용을 확인한 후 중앙 원격 코드 베이스에 병합(```merge```)한다.
```text
GUI 도구를 이용한 병합
- GitHub 페이지에서 “Pull requests” 버튼을 누른 후, File changed 탭에서 변경 내용을 확인한다.
- Conversation 탭으로 이동하여 “Confirm merge”를 하면 중앙 원격 코드 베이스에 병합(merge)된다.
- 충돌이 일어난 경우는 팀원들과 합의 하에 충돌 내용을 수정한 후 병합을 진행한다.

CLI로는 어떻게 하는지? 확인 필요
```

## 6. 중앙 원격 저장소와 자신의 로컬 저장소를 동기화하기 위해 로컬 저장소의 branch를 master branch로 이동한다.
***git 쓸 때 flow: pull - add - commit - push***
```text
git checkout master(main)
```

## 7. 중앙 원격 저장소의 코드 베이스에 새로운 커밋이 있다면 다음과 같이 가져온다.
중앙 원격 저장소(origin)의 메인 코드 베이스가 변경되었으므로, 프로젝트에 참여하는 모든 개발자가 자신의 로컬 저장소를 동기화해서 최신 상태로 만들어야 한다.
```text
git pull origin master
```
## 요약정리
1. git clone
2.  git checkout -b 브랜치이름 
3.  작업 후 add commit push 
4.  pull request(확인필요) 
5.  merge(프로젝트 관리자) 
6.  git checkout master 
7.  git pull origin master

# 생각해볼 것
feature branch는 하나만 생성 - 작업자별로 폴더 만든 후 merge?
어떻게 할지 고민해보기

# About `pull request`
URL
- https://velog.io/@zansol/Pull-Request-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0
- https://wayhome25.github.io/git/2017/07/08/git-first-pull-request-story/
