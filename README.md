# TEAM3
 KH정보교육원 Java기반 풀스택 개발자 양성 과정 최종 프로젝트로
병원 예약 중개 플랫폼을 개발하였습니다.

## 목차
1. [프로젝트 개요](#프로젝트-개요)
2. [주요 개발 내용](#주요-개발-내용)
3. [기술 스택](#기술-스택) 		
4. [ERD 다이어그램](#ERD-다이어그램)

## 프로젝트 개요

- **프로젝트 명**: 병원 예약 중개사이트
 
- **설명**: 
  사용자와 병원을 연결하여 병원 검색, 예약, 리뷰 작성 및 관리를 할 수 있는 웹 기반 중개 플랫폼.
  
- **주요 기능**:
  - **병원 검색 및 필터링**: 사용자 주소와 관심 진료 과목에 기반한 병원 검색.
  - **병원 예약 관리**: 병원 스케줄 및 예약 관리 기능.
  - **사용자 리뷰 관리**: 병원에 대한 리뷰 작성 및 조회 기능.
  - **관리자 페이지**: 병원 정보, 진료 프로그램 및 예약 관리.
  - **결제 기능**: 포트원 API를 활용한 예약 금액 결제.

- **기간**: 6 ~ 7주  
- **팀 구성**: 4명

## [주요 개발 내용]

1. **회원 가입 및 권한 관리**
   - 일반 회원과 병원 회원으로 구분하여 가입.
   - 각 회원은 서로 다른 권한을 가지며, 서비스 이용 방식이 다릅니다.

2. **병원 검색 및 예약**
   - 일반 회원:
     - 관심 진료 과목 및 위치 정보를 입력하여 병원 검색.
     - 예약 시 병원의 진료 프로그램을 선택하고 결제 후 예약 확정.
   - 병원 회원:
     - 병원 정보 및 진료 프로그램 등록.
     - 스케줄 관리 기능 제공.

3. **결제 시스템**
   - 포트원 API를 활용하여 예약 시 결제 기능 구현.
   - 결제 완료 후 예약 상태가 확정으로 변경.

4. **리뷰 시스템**
   - 일반 회원은 병원 방문 후 리뷰 작성 가능.
   - 병원 리뷰는 모든 사용자가 열람 가능.
     
5. **커뮤니티 시스템**
   - 일반 회원,병원 회원은 커뮤니티에 게시물 작성 가능.
   - 회원들이 작성한 게시물에 좋아요, 신고 기능 구현.
   - 본인 게시물에 한해 수정 및 삭제 가능.
     

## [기술 스택]

### 백엔드
- **언어**: Java  
- **프레임워크 및 라이브러리**: Spring Framework, MyBatis, JPA  
- **데이터베이스**: MySQL
- **빌드 및 관리 도구**: Maven

### 프론트엔드
- **언어**: HTML5, CSS3, JavaScript  
- **라이브러리 및 기술**: jQuery, Ajax, BootStrap5  

### 기타 도구
- **결제 API**: 포트원 API (아임포트)  
- **협업 툴**: GitHub, Notion 

## [ERD 다이어그램]
![image](https://github.com/user-attachments/assets/a0c22b24-a0ce-4571-a60e-26beb27b5d11)
- 최대한 DB에 NULL 값이 발생하지 않도록 팀원들과 활발하게 소통하며 설계했습니다.


