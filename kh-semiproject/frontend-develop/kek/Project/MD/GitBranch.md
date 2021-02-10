# Branch
참고URL:https://gmlwjd9405.github.io/2017/10/27/how-to-collaborate-on-GitHub-1.html
## 1.중앙 원격 저장소
 - 여러 명이 같은 프로젝트를 관리하는 데 사용하는 그룹 계정의 중립된 원격 저장소
 - 
- Organizatoin의 사용자와 저장소는 팀으로 관리되고 저장소의 권한 설정도 팀으로 관리한다.

## 2. 자신의 원격 저장소
 - 파일이 GitHub 전용 서버에서 관리되는 원격 저장소

## 3. 로컬 저장소
 - 내 PC에 파일이 저장되는 개인 전용 저장소, 지역저장소

![remote1](https://gmlwjd9405.github.io/images/github-collaboration1/github-collaboration-1.png)

![remote2](https://gmlwjd9405.github.io/images/github-collaboration1/github-collaboration-2.png)

---
# merge할 팀장
- Organization(중앙 원격 저장소)을 만드는 방법은 GitHub 페이지 오른쪽 위에 있는 “+” 아이콘을 클릭하고 메뉴에서 “New organization”을 선택하면 된다.
---
# 프로젝트 참여자
- 프로젝트 참여자는 git clone 명령으로 중앙 원격 저장소(remote repository)를 복제하여 자신의 로컬 저장소(local repository)를 만들 수 있다. 프로젝트 참여자는 이 로컬 저장소에서 작업을 수행한다.
'''git
git clone [중앙 remote repository URL]
'''

## fatch 와 pull의 차이

- fetch: 원격 저장소의 데이터를 로컬에 가져오기만 하기
- pull: 원격 저장소의 내용을 가져와 자동으로 병합 작업을 실행
- 즉, 단순히 원격 저장소의 내용을 확인만 하고 로컬 데이터와 병합은 하고 싶지 않은 경우에는 fetch 명령어를 사용한다.
- pull = fetch + merge
---
# 명령어 브렌치 만드는 순서
URL:https://backlog.com/git-tutorial/kr/stepup/stepup2_2.html
