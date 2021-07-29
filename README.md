# Seaflag (Team Crayon)

## Introduction

<b>Seaflag</b> is a search engine that helps users to find a specific person or word in a video. The demo version provides multiple features such as pointing out the moments that contain certain keywords in English/Korean and identifying the appearance of seven BTS members (RM, Jin, Suga, J-Hope, Jimin, V, and Jungkook) within the input video.



## User Interface

![User Interface](https://user-images.githubusercontent.com/59460178/127555429-401c597f-2c82-44d1-be48-d8be731fcca0.gif))

## System Architecture
![Architecture Diagram](https://user-images.githubusercontent.com/59460178/127429602-a1c04081-cf95-4ef2-b7c0-f215dc19639d.png)

<b>React Framework</b> was used to develop the frontend of this website. The component architecture allowed us to reuse the code we wrote in all our features efficiently. We were also able to test individual pieces of the UI without interfering with the rest of the project.

On the backend side, it was crucial to design two main servers separately to minimize the risk of a system breakdown. Both servers were built using <b>Flask Framework</b>, which provides a basic set of tools for web development. The API server provides basic user authentication, separates the input video into mp3 and mp4, stores them in the S3 bucket, and returns the search results by retrieving data from MongoDB. The model server utilizes YOLO, an object recognition algorithm, to detect specific figures in the video and stores the result in MongoDB. Because Python is fundamentally single-threaded, <b>RabbitMQ</b> was introduced as a message broker to distribute the tasks effectively.

Since this website includes functions such as signup and login, <b>PostgreSQL</b>, a relational database, was utilized to manage user access and information. On the other hand, we decided to use <b>MongoDB</b>, a non-relational database, to store the image detection and speech recognition results. That is because each data is not tabular and doesn’t have dependencies with one another.



## Tech Stack

|         Frontend         |         Backend (API)         |         Backend (Model)         |         Etc         |
| :----------------------: | :---------------------------: | :-----------------------------: | :-----------------: |
| ![React](https://img.shields.io/badge/react-v17.0.2-9cf?style=flat-square&logo=react&color=lightsteelblue) ![Javascript](https://img.shields.io/badge/javascript-ES6+-yellow?style=flat-square&logo=javascript&color=lightsteelblue) ![Axios](https://img.shields.io/badge/axios-v0.21.1-9cf?style=flat-square&logo=axios&color=lightsteelblue) | ![Flask](https://img.shields.io/badge/flask-v2.0.1-green?style=flat-square&logo=flask&color=cornflowerblue) ![Python](https://img.shields.io/badge/python-v3.8.6-skyblue?style=flat-square&logo=python&color=cornflowerblue) ![PostgreSQL](https://img.shields.io/badge/postgreSQL-v12.7-blue?style=flat-square&logo=postgresql&color=cornflowerblue) | ![Flask](https://img.shields.io/badge/flask-v2.0.1-green?style=flat-square&logo=flask&color=forestgreen) ![Python](https://img.shields.io/badge/python-v3.8.6-skyblue?style=flat-square&logo=python&color=forestgreen) ![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=flat-square&logo=MongoDB&logoColor=white) | ![Docker](https://img.shields.io/badge/docker-v20.10.7-brightgreen?style=flat-square&logo=docker&color=bisque) ![Nginx](https://img.shields.io/badge/Nginx-v1.21.1-brightgreen?style=flat-square&logo=nginx&color=bisque) ![Gunicorn](https://img.shields.io/badge/gunicorn-v20.1.0-darkgreen?style=flat-square&logo=gunicorn&color=bisque) ![Swagger](https://img.shields.io/badge/Swagger-gray?style=flat-square&logo=Swagger&color=bisque&logoColor=black) ![GitKraken](https://img.shields.io/badge/GitKraken-gray?style=flat-square&logo=GitKraken&color=bisque) ![VScode](https://img.shields.io/badge/VScode-v1.58.2-blue?style=flat-square&logo=visual-studio-code&color=bisque) ![Postman](https://img.shields.io/badge/Postman-gray?style=flat-square&logo=Postman&color=bisque) |


## Getting Started

### 1. Cloning
```
$ git clone https://github.com/CrayonTeamJ/docker.git
```
- Provide necessary information in 'settings/dev/env.dev' or 'settings/prod/env.prod'

### 2. Frontend
  - Install packages
  ```
  $ cd frontend
  $ npm install
  ```
  
### 3. Docker
  
  #### Development environment
 
  - Run Docker
  ```
  $ git submodule update --init --recursive
  $ docker-compose up                                       
  ```
  
  #### Production environment
 
  - Run Docker   
  ```
  $ git submodule update --init --recursive
  $ docker-compose -f docker-compose.prod.yml up   
  ```


## Directory Structure

```bash
├── README.md                                          - 리드미 파일
│
│
├── backend/                                           - 백엔드 플라스크 디렉토리
│   ├── dockerfile                                     - docker 파일
│   ├── app.py                                         - 서버 시작, 서버 api 처리, Frontend/Backend model과 소통을 통해 기능을 호출, 처리
│   ├── aud_search.py                                  - 음성 검색 기능
│   ├── config.py                                      - postgreSQL와 연결하기 위한 key가 존재하는 파일
│   ├── img_search.py                                  - 이미지 검색 기능     
│   ├── models.py                                      - DB 테이블 정의
│   ├── swagger.py                                     - 스웨거와 연동
│   ├── tasks.py                                       - Celery task 정의
│   ├── view.py                                        - DB 조작 기능
│   ├── requirements.txt                               - 실행에 필요한 모듈들 정의
│   ├── celerybeat-schedule                            - Celerybeat 스케줄러
│   ├── function/                                              
│   │    ├── clova_func.py                             - 클로바 음성인식 api 실행
│   │    ├── s3_control.py                             - s3 기능 정의
│   │    ├── trans.py                                  - 음성인식 결과 json 변환 
│   │    └── video_func.py                             - 영상 다운로드 및 mp3/mp4 형태 저장
│   └── migration/
│
│
├── backend_model/
│   ├── dockerfile                                     - docker 파일
│   ├── app.py                                         - 서버 시작, 서버 api reply 처리, backend에서 요청을 받아 반환
│   ├── best_4.pt                                      - 인공지능 학습 결과 weight 파일
│   ├── detect.py                                      - Yolo 인공지능 실행 파일
│   ├── tasks.py                                       - Celery task 정의
│   ├── requirements.txt                               - 실행에 필요한 모듈들 정의       
│   ├── models.py                                      - DB 테이블 정의
│   ├── package-lock.json                             
│   ├── function/                                              
│   │    ├── s3_control.py                             - s3 기능 정의
│   │    └── to_frame.py                               - 영상을 초단위 이미지로 추출
│   ├── models/                                              
│   ├── utils/                                              
│
│
├── frontend/
│   ├── dockerfile                                    - docker 파일
│   ├── public/
│   ├── node_modules/
│   ├── package.json & package.lock.json              - 라이브러리 관리 파일
│   └── src/ 
│        ├── index.js & index.css                     - React 프로젝트 파일
│        ├── App.js & App.css                         - page components 관리 파일
│        ├── axios.js
│        ├── index.js
│        ├── store.js                                 - baseURL 설정
│        ├── components/                                              
│        │    ├── Footer.jsx
│        │    ├── LandingInfo.jsx                     - 상단에 보여질 컴포넌트
│        │    ├── Navigationbar.jsx                   - 네비게이션 바 컴포넌트
│        │    ├── PrivateRoute.jsx                    - 회원 전용 구현을 위한 컴포넌트
│        │    ├── Template.jsx                        - 탬플릿 컴포넌트
│        │    ├── Timer.jsx                           - 로그인 유효시간 타이머
│        │    ├── Typebtn.jsx                         - 스타일 라디오 버튼 컴포넌트
│        ├── pages/    
│        │    ├── ErrorPage.jsx                       - 서버에서 에러가 발생할 경우 보여지는 페이지 
│        │    ├── LoadingPage.jsx                     - 서버에서 데이터를 불러 올 때 보여지는 페이지
│        │    ├── MemberOnlyPage.jsx                  - 로그인하지 않았을 경우의 경고 페이지 
│        │    ├── SigninPage.jsx                      - 로그인 페이지
│        │    ├── SignupPage.jsx                      - 회원가입 페이지
│        │    ├── UploadPage.jsx                      - 영상 업로드 페이지
│        │    ├── ResultPage.jsx                      - 결과 페이지                                          
│        │    └── SearchPage.jsx                      - 검색어 입력 및 검색 타입 선택 페이지                              
│        ├── redux/   
│        │    ├── index.js                            - rootReducer 
│        │    ├── status.js                           - 비동기 처리를 위한 변수 관리 reducer                                                   
│        │    └── user.js                             - user정보 관리를 위한 변수 관리 reducer                               
│        ├── font/                                              
│        └── img/
│
│
├── ELK / elasticsearch
│
│
├── nginx/
│   ├── dockerfile                                    - nginx 도커파일
│   └── nginx.conf                                    - nginx 설정파일
│
├── settings/                                         - 환경변수 설정 파일
│   ├── dev/                                              
│   │    └── .env.dev                                 - 개발환경변수 설정 파일
│   └── prod/
│        └── .env.prod                                - 배포환경변수 설정 파일
├── docker-compose.yml                                - 개발용 docker-compose파일
├── docker-compose.prod.yml                           - 배포용 docker-compose파일
└── .gitignore	
	
``` 

## API Documentation

Coming soon!


## Additional Repositories

- [Frontend](https://github.com/CrayonTeamJ/frontend.git)
- [Backend (API Server)](https://github.com/CrayonTeamJ/backend.git)  
- [Backend (Model Server)](https://github.com/CrayonTeamJ/backend_model.git)


## Contributors

| Yujeong Lee | Minwoong Kim | Somi Kim | Suyeon Maeng | Hayoung Lim | Gilhan Yong | 
| :----: | :----: | :----: |:----: | :----: | :----: |
| [@IAGREEBUT](https://github.com/IAGREEBUT) | [@POL6463](https://github.com/POL6463) | [@rlathal009](https://github.com/rlathal009) | [@maengsuyeon](https://github.com/maengsuyeon) | [@hayoung1998](https://github.com/hayoung1998) | [@Yong-ga-ri](https://github.com/Yong-ga-ri) |
|Frontend |Backend |AI/Backend |AI/Backend | AI/Backend |DevOps |