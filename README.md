# Seaflag - Team Crayon 

## Introduction

<b>Seaflag</b> is a search engine that helps users to find a specific person or word in a video. The demo version provides multiple features such as pointing out the moments that contain certain keywords in English/Korean and identifying the appearance of seven BTS members (RM, Jin, Suga, J-Hope, Jimin, V, and Jungkook) within the input video.


## User Interface

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

## Directory Structure

## API Documentation

## Additional Repositories

- [Frontend](https://github.com/CrayonTeamJ/frontend.git)
- [Backend (API Server)](https://github.com/CrayonTeamJ/backend.git)  
- [Backend (Model Server)](https://github.com/CrayonTeamJ/backend_model.git)

## Contributors

| Yujeong Lee | Minwoong Kim | Somi Kim | Suyeon Maeng | Hayoung Lim | Gilhan Yong | 
| :----: | :----: | :----: |:----: | :----: | :----: |
| [@IAGREEBUT](https://github.com/IAGREEBUT) | [@POL6463](https://github.com/POL6463) | [@rlathal009](https://github.com/rlathal009) | [@maengsuyeon](https://github.com/maengsuyeon) | [@hayoung1998](https://github.com/hayoung1998) | [@Yong-ga-ri](https://github.com/Yong-ga-ri) |
|Frontend |Backend |AI/Backend |AI/Backend | AI/Backend |DevOps |