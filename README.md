# 패스트캠퍼스 iOS School 1기
## 강의 내용 정리
### 1주차
+ __1일 : 컴퓨터의 구성__

	__컴퓨터의역사__
		
		수학자가 빠른 연산을 위한 기계장치를 만들어냄 = 계산기 = 컴퓨터
		
		  * 빠른 연산을 위해서 2진법을 사용함
		
		 1세대 컴퓨터 : ENIAC, 진공관을 사용함
		
		 2세대 컴퓨터 : 트랜지스터
		
		 3세대 컴퓨터 : 직접회로(IC)

	__컴퓨터의 구성__
	 	
	 	하드웨어
	 	
	 		입출력장치 : 입력과 출력을 할수 있는 컴퓨터에 연결된 모든 기기
	 	
	 		기억장치 : 컴퓨터가 사용되기 위한 데이터를 기록하는 장치
	 	
	 			주기억(RAM), 보조기억(ROM)
	 	
	 		연산/제어장치 : CPU

	 	소프트웨어
	 	
	 		시스템소프트웨어
	 	
	 			로더, 장치드라이버, OS, 컴파일러, 어셈블러, 링커 등

	 		응용소프트웨어
	 	
	 			OS안에서 실행되는 모든 프로그램

	__컴퓨터의 구조__
		
		하버드 구조 : 명령어 메모리, 데이터 메모리가 분리된 형태
		
			장점 : 메모리가 따로 쓰기때문에 병목현상이 일어나지 않는다.
		
			단점 : 프로그램을 돌리려면 각자의 회로 구조가 필요하다 
		
		폰노이만구조 : 메모리를 하나로 공유한다.
		
			장점 : 구조를 바꾸지 않고 내부 프로그램만으로도 설계가 가능하다.
		
			단점 : 메모리를 공유하므로 병목현상이 일어난다.

		 ** 오늘날의 컴퓨터는 두개의 구조를 용도에 따라서 같이 사용한다.

+ __2일차 : 컴퓨터의 연산와 운영체제__

	__컴퓨터연산(AND, OR, XOR)__

	__운영체제__

+ __3일차 : 자료구조와 알고리즘, 데이터베이스 __

	__자료구조__
		원시구조 : 정수, 실수, 문자
		선형구조
			리스트구조
			스택
			큐
			덱



	__알고리즘__

+ __4일차 : 네트워크와 암호화 __

+ __5일차 : 소프트웨어 공학__

###2주차

+ __6일차 : 프로그래밍 언어__

+ __7일차 : 리뷰 및 Git기초 설명__

+ __8일차 : XCode 기초 강의 및 C언어 기초__

	__XCode 기본 사용법__
		
		계산기 예제를 통한 UI숙달  - 경로 : ios/Example/calc

	__C언어 기초__
		
		기본 변수 선언 및 타입
		
		함수선언 및 작성 방법
		
		CamelCase와 camelBackCase에 대한 설명

+ __9일차__

	__C언어 기초 2차__
		
		조건문 = if, switch
		
		비교연산자(>, <, <= ...), 조건연산자(&&, ||)
		
		반복문 예제를 통한 반복문 실습 
		
			369게임만들기 : ios/Homework/Day9/Day9/main.m
			
+ __10일차__

	__Review 및 실습__

		기본변수선언과 타입, 함수의 선언 및 작성, 조건문, 반복문, 비교연산자와 조건연산자

		실습 : ios/Homework/Day10/Day10/main.m
			swap 두 개 값 변경하기
			삼각수와 특정 배수의 삼각수 구하기
			지정한 숫자까지 더하기
			D-Day구하기(단, 현재일과 기준일을 입력받는다.)

### 3주차

+ __11일차__

	__실습__

		D-Day구하기2 : ios/Homework/Day11/Day11/main.m (강사님 예시)

	__Objective-C__

		변수
			값타입 : NSInteger, CGFloat, BOOL, NSString

			참조형 타입 : id, ClassName * (모든 객체는 참조형타입)
		
		실습
			성적총점 및 평균 구하기,구구단 출력하기 ios/Example/Day_Exam/Day_Exam/main.m

	__기본 데이터 클래스__

		배열 : NSArray, NSMutableArray ...
			같은 타입의 자료가 연속적으로 저장된다.
			인덱스를 통하여 데이터를 접근, 관리한다. 

			NSArray는 id type을 받는 정적배열 객체이다.(Objective-C에서만 사용 가능)
				@[@1,@2,@3]

			NSMutableArray는 동적배열이다.
				* list자료형 구조를 가진 배열

		문자열 : NSString
			Foundtion Framework에 수록 
			Objective-C에서 사용하는 문자열 
			@"[문자열]"을 사용함

		숫자형 : NSNumber, NSInteger 등
			단, 참조형의 경우에는 실제 연산이 불가능하다.
			ex) NSNumber @3 + @5 = ?   => (Error)
			    NSInteger 3 + 5  = ?   => 8
			    NSNumber *num1 = @3, *num2 = @5
			    num1.integerValue + num2.integerValue = ? => 8

			    if(num1 < num2){
			    	NSLog(@"TRUE");
			    }


		For In 구문 
			for [type *name] in [collection]{

			}



	__객체지향__

		OOP(Object-Oriented Programming)? 프로그래밍 패러다임중 현실세계의 모든 사물을 "객체화" 한것을 말한다.
		                                  (하나의 독립된 단위, 메세지단위로 데이터를 처리)
			단점 : 필요한것 외에것을 다 가져와야한다, 설계가 힘들고 속도가 느리다,

		클래스 : 같은 종류 집단에 속하는 행위와 속성을 정의한것
			변수와 함수(메서드)로 구성되어 있다.

		객체 : 클래스가 인스턴스(실제로 메모리에상에 할당된것	)이다.
			* _nil_ 상태는 객체의 실제 주소값이 할당되지 않았을 경우 나타난다.
		
		메서드 : 클래스로 부터 생성된 객체를 사용하는 방법으로 메세지를 통해 객체에 명령이 전달된다.

+ __12일차__
	
	__Objective-C 기초__

		__클래스와 객체__
			
			__선언부(Interface)__
				헤더 파일 내 @interface ~ @end 사이에 기록
				메서드, 프로퍼티를 선언한다.
			
			__구현부(Implementation)__
				클래스의 인스턴스 변수 및 메서드의 구현 실제코드가 담긴다.
				_.m_ 파일에 @implementation @end 사이에 기록을 한다.
				@implementation [ClassName] : NSObject
				{
					NSString *name; //인스턴스 변수
				}
				-([리턴타입]) 식별자:(타입)매개변수명 .... {
					//실행부
				}
				@End
		
			실습 : ios/Example/TestScore/TestScore/main.m
             	  ios/Example/TestScore/TestScore/CalculationScore.*

            __인스턴스화와 초기화__
            	Car *evoke =[[Car alloc]init];
            	Car *evoke = new Car();
            	 * alloc : 객체를 사용하기 위한 메모리 공간을 확보한다.  
            	 * init  : 객체를 쓰기 위한 초기화를 한다.
            	   ex) alloc은 그림을 그리기 위한 캔버스가 만들어지고 초기화는 그 그림을 그리기 
            	       위해 준비가 된 상태이다. 

        상속 : 새로운 클래스가 기존의 클래스의 속성(자료)와 행위(연산)을 이용할수 있게 하는 기능
				@Implementation Car : NSObject  : NSObject를 상속 받는다

        메소드 : 인스턴스가 수행하는 행동
        	[-,+] ([type])[식별자1]:([type])[매개변수명] [식별자2]:([type])[매개변수명]

        	실습 : ios/Example/TestScore/TestScore/ToolBox.*

+ __14일차__
	
	리뷰 및 자습 과 실습
      
    	CardDeck : ios/Homework/CardDeck/CardDeck/

+ __15일차__

	따라치기

		VendingMachine

			/ios/Example/VendingMachine/VendingMachine/*.*







	
	

