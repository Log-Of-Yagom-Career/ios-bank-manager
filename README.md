# 💰은행창구 매니저💰 

## 목차
1. [소개](#1소개)
2. [팀원](#2팀원)
3. [타임라인](#3타임라인)
4. [다이어그램](#4다이어그램)
5. [실행 화면](#5실행화면)
6. [트러블 슈팅](#6트러블-슈팅)
7. [핵심 경험](#7프로젝트-수행-중-핵심-경험)
8. [참고 링크](#8참고-링크)

## 1.소개
- 은행의 은행원들이 고객의 업무에 따른 일을 동시에 처리하는 앱입니다.

<br>

## 2.팀원
| Baem | bella |
| --- | --- |
| <img src=https://i.imgur.com/jrW5RQj.png width="155" height="150" >|<img src=https://i.imgur.com/Ux3OvW7.jpg width="155" height="150" > |
| [@Dylan-Yoon](https://github.com/dylan-yoon) |  [@hyhy0429](https://github.com/hyhy0429) |

<br>

## 3.타임라인
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
    - 접근제어자 설정

**[STEP-3]**
- 221107
    - Task 파일 생성 및 Customer 타입 프로퍼티 추가
    - Bankmanger 타입 구현
    - Bank 타입 내부 고객 대기열 구분 및 랜덤하게 업무 분배하는 메서드 추가
    - Bankmanager 타입 내부 task() 구현
    - Bankmanager 타입 class로 변경 및 시간/고객수 프로퍼티와 메서드 구현
    - Bank 타입 내부 업무 마치는 메서드 구현
    - Bank 타입 내부 일을 시작 메서드와 DispatchQueue에 던지는 메서드 기능 분리
- 221110
    - BankType의 고객창구를 Task 타입의 프로퍼티로 관리하도록 구현
    - Bank 타입 내부 업무 관련 메서드를 BankManager 타입 내부로 이동
    - Bank 타입 내부 dispatchTask() 시간계산 오류 수정
- 221111
    - Readme 작성


<br>

## 4.다이어그램
#### UML
<img src=https://i.imgur.com/ih6BBYT.jpg width="600" height="450">

## 5.실행화면

| STEP 1, 2 | STEP 3 |
| -- | -- |
| <img src=https://i.imgur.com/Tw1RwJ4.gif width="400" height="350" > | <img src=https://i.imgur.com/5ZcK7tA.gif width="400" height="350" > |


## 6.트러블 슈팅

#### SwiftLint SPM설치에 대한 오해와 Cocoa Pod 선택 이유
- Swift Package Manager(SPM)
    - 처음 `SwiftLint 라이브러리`를 사용하기 위한 의존성관리도구 중 `CocoaPod`과 `SPM`을 고민하게 되었고, 애플에서 직접 제공한다는 점 및 편리하다는 점에서 `SPM`을 선택하여 사용하려고 했습니다.
    - SPM을 이용한 설치 과정에서, 처음에는 Xcode의 [File -> Add Package]에서 설치만 하면 되는 것으로 알고 있었으나, `SwiftLint`는 다른 라이브러리처럼 SPM을 지원하는 것이 아니었으며 사용을 위해서는 `brew`를 통해 `swiftLint`를 인스톨 한 뒤 프로젝트에 적용 후 swiftlint.yml 파일을 생성 해야 했습니다.

- CocoaPod
    - <img src=https://i.imgur.com/ImUaDQf.png width="600" height="250" >
    - [SwiftLint github](https://github.com/realm/SwiftLint)의 `설치`와 관련된 부분을 살펴보니, `SPM`이 아닌 `CocoaPod` 사용을 권장하고 있는 것을 알게 되어 변경하게 되었습니다. 

#### 큐의 사용
- 처음에는 LinkedList로 만든 큐를 활용하여, `예금 큐` `대출 큐` 를 따로 만들고자 하였습니다. 
그러나, Bank 타입 내부에 예금 매니저 2명과 대출 매니저 1명을 생성하였습니다. 예금 매니저1과 대출매니저1에게 각 고객 대기열에서 고객을 꺼내 일을 할당하는 것이 가능했으나, 예금 고객대기열을 예금매니저1 뿐만 아니라 예금매니저2에게도 할당하는 것에는 실패하게되었습니다.
고민을 하다가, 업무처리를 매니저 객체를 생성해서 분담하는 것이 아닌 스레드의 개념에서 처리하는 것으로 변경했습니다.

#### DispatchSemaphore 사용
- 위의 과정에 기재된 것과 같이, 업무처리를 스레드의 개념에서 처리하고자 하는 구현과정에서, 각 업무를 `global.async` 를 이용하여 보낼 경우에, 랜덤하게 생성한 고객 수 만큼(필요한 만큼) 쓰레드를 생성하게 되었습니다. 이를 해결하기 위해, `DispatchSemaphore`와 `SerialQueue` 두 가지 방법 중에 고민하게 되었으며 예금 업무와 대출 업무를 처리하는 스레드의 개수를 제한하고자 `DispatchSemaphore`의 `value` 를 이용하여 지정하였습니다.  

#### 클로저캡쳐 오류에 따른 Struct -> Class 타입 변경 
![](https://i.imgur.com/2CUCsq8.png)
- `struct Bankmanager` 의 타입이 Struct일 때, `Bank`의 DispatchQueue 에서 사용하면 사용하고자 하는 값이 이미 캡쳐가 되어있어 변경이 불가하기에 위와 같은 오류가 발생하게 되었습니다. 
- 캡쳐드 리스트를 활용하여 문제를 해결하고자 하였으나, 캡쳐드 리스트 역시 값 변경은 불가하였기에 참조타입이 아닌 값타입으로 바꾸어 문제를 해결하였습니다. 

#### 초기 설계와 현재 구현의 차이
- 처음 설계 시에는, 예금 대기열과 대출 대기열을 만들고 예금 담당 은행원(2), 대출 담당 은행원(1) 및 은행창구의 개념이 담긴 객체를 생성하여 업무를 할당하고자 하였습니다.
그러나, 하나의 예금 대기열의 고객들을 두 명의 은행원에게 분배하는 작업(while문 이용 시, 이미 예금담당 은행원1이 모두 고객을 dequeue한 상황)이 불가하게 되어, 일하는 은행원의 개념을 스레드의 개념에 적용하고자 하였습니다.
이 문제를 해결하기 위한 방법 방법으로는 홀수번째 짝수번째로 각각 할당하는 방법이 있을 수 있지만 은행원이 여러명일 경우 복잡해 질 것으로 예상해서 다른 방법을 찾아 보고자 하였습니다.
![](https://i.imgur.com/zGT6TRz.png)
- 예를 들어, 위의 사진처럼 만약 총 6명의 고객이 있을 때 예금 창구에는 2명의 은행원이 있다고 생각해봅니다.
링크드 리스트에 들어있는 고객들을 하나씩 빼서 `async`로 보내주면 동시에 일을 처리하게 될 것이며, 공유자원인 예금고객대기열에 접근할 수 있는 스레드를 `Semaphore`의 `value`를 통해 제한하여 2명씩 업무처리가 가능하게 됩니다. 
그러나, 위의 사진처럼 각 고객당 하나의 스레드에서 업무처리가 되어 총 고객의 수에 맞는 스레드가 생성되기 때문에 어떤 방식을 사용 해야할지 다시 고민해보아야 할 부분이라고 생각합니다.


<br>

## 7.프로젝트 수행 중 핵심 경험
- 의존성관리도구의 개념 이해와 적용
- LinkedList 자료구조의 이해와 적용
- Generics 개념이해와 적용
- 타입 추상화 및 일반화
- 동기 비동기의 이해와 적용
- 동시성 프로그래밍 개념의 이해
    - GCD의 이해와 활용
- 클로저 캡쳐와 캡쳐드 리스트의 이해

<br>

## 8.참고 링크
- Apple Developer 
    - [Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
    - [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
- Swift Programming Language
    - [클로저 캡쳐(캡쳐 값)](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
    - [클로저의 강한 참조](https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html#ID56)
- 위키백과
    - [LinkedList](https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)
- github
    - [SwiftLint.github](https://github.com/realm/SwiftLint)
- 야곰닷넷
    - [동시성 프로그래밍](https://yagom.net/courses/%EB%8F%99%EC%8B%9C%EC%84%B1-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-concurrency-programming/)

---
[🔝 맨 위로 이동하기](#은행창구-매니저)
