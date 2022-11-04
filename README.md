# 💰은행창구 매니저💰 

## 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [UML](#-UML)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [핵심 경험](#-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#-참고-링크)

## 1. 소개
- 은행에 온 고객의 업무를 처리하는 앱입니다.

<br>

## 2. 팀원
| Baem | bella |
| --- | --- |
| <img src=https://i.imgur.com/jrW5RQj.png width="155" height="150" >|<img src=https://i.imgur.com/Ux3OvW7.jpg width="155" height="150" > |
| [@Dylan-Yoon](https://github.com/dylan-yoon) |  [@hyhy0429](https://github.com/hyhy0429) |

<br>

## 3. 타임라인
**[STEP-1]**
- 221101
    - CocoaPod을 이용한 SwiftLint 라이브러리 설치 
    - Node 파일 생성 및 구현
    - LinkedList 파일 생성과 프로퍼티 및 메서드 구현
    - LinkedList UnitTest 구현
  
**[STEP-2]**
- 221102
    - Bank 파일 생성 및 타입 내부 메서드 구현
    - Customer 파일 생성
    - Bank 타입 내부 메서드 기능 분리



<br>

## 4. UML
- Comming Soon

## 5. 실행화면
<img src=https://i.imgur.com/Tw1RwJ4.gif width="400" height="350" >

## 6. 트러블 슈팅

### SwiftLint SPM설치에 대한 오해와 Cocoa Pod 선택 이유
#### Swift Package Manager(SPM)
- 처음 `SwiftLint 라이브러리`를 사용하기 위한 의존성관리도구 중 `CocoaPod`과 `SPM`을 고민하게 되었고, 애플에서 직접 제공한다는 점 및 편리하다는 점에서 `SPM`을 선택하여 사용하려고 했습니다.
- SPM을 이용한 설치 과정에서, 처음에는 Xcode의 [File -> Add Package]에서 설치만 하면 되는 것으로 알고 있었으나, `SwiftLint`는 다른 라이브러리처럼 SPM을 지원하는 것이 아니었으며 사용을 위해서는 `brew`를 통해 `swiftLint`를 인스톨 한 뒤 프로젝트에 적용 후 swiftlint.yml 파일을 생성 해야 했습니다.
#### CocoaPod
<img src=https://i.imgur.com/ImUaDQf.png width="600" height="250" >
- [SwiftLint github](https://github.com/realm/SwiftLint)의 `설치`와 관련된 부분을 살펴보니, `SPM`이 아닌 `CocoaPod` 사용을 권장하고 있는 것을 알게 되어 변경하게 되었습니다. 

<br>

## 7. 프로젝트 수행 중 핵심 경험
- 의존성관리도구의 개념 이해와 사용
- LinkedList 자료구조의 이해 및 구현
- Generics 개념이해 및 적용
- 타입 추상화 및 일반화

<br>

## 8. 참고 링크
- Apple Developer 
    - [Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
    - [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- 위키백과
    - [LinkedList](https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)
- github
    - [SwiftLint.github](https://github.com/realm/SwiftLint)

---
[🔝 맨 위로 이동하기](#은행창구매니저)
