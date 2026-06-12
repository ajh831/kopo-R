# 📊 Big Data Analysis Practice with R

<div align="center">

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge\&logo=r\&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-2C3E50?style=for-the-badge)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-FF6F61?style=for-the-badge)

R 기반 데이터 분석 및 시각화 실습 저장소

</div>

---

# 📌 Overview

빅데이터 분석 수업에서 진행한 R 실습 및 복습 내용을 정리한 저장소입니다.

데이터 전처리, 기술통계, 데이터 시각화, 공공데이터 API 활용,
텍스트 마이닝, SQL 기반 데이터 분석 등을 실습하며 학습했습니다.

---

# 🛠 Tech Stack

* R
* ggplot2
* dplyr
* reshape2
* ggmap
* XML
* httr
* wordcloud
* sqldf

---

# 📂 Project Structure

```bash id="jlwmq5"
📦 RWorks
 ┣ 📂 practice
 ┣ 📂 review
 ┗ 📜 README.md
```

| Folder   | Description   |
| -------- | ------------- |
| practice | 수업 시간 실습 코드   |
| review   | 복습 및 추가 실습 코드 |

---

# 📖 Learning Summary

## 📊 데이터 시각화

* ggplot2 기반 그래프 작성
* 히스토그램, 산점도, boxplot 시각화
* 그룹별 데이터 시각화

## 📈 기술통계 분석

* 평균, 중앙값, 사분위수, IQR 계산
* 이상치 탐색
* 상관분석 및 표준화(scale)

## 🗺 지도 시각화

* ggmap 기반 지도 출력
* Google Maps API 활용
* 지진 데이터 지도 시각화

## 🌫 공공데이터 활용

* 공공데이터 Open API 활용
* XML 데이터 파싱
* 미세먼지 및 공공데이터 분석

## 🧠 텍스트 마이닝

* 형태소 분석 및 명사 추출
* 워드클라우드 생성
* 뉴스 데이터 텍스트 분석

## 🗄 SQL 기반 데이터 분석

* sqldf를 활용한 SQL 문법 실습
* JOIN 및 그룹 집계 실습

---

# 🔐 API Key Management

API Key는 `.Renviron` 환경변수를 활용하여 관리했습니다.

```r id="ozuhwo"
api_key <- Sys.getenv("DATA_GO_API")
google_key <- Sys.getenv("GOOGLE_API_KEY")
```

---

# 🚀 Author

Big Data Software Department
