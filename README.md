# ✨ Intro

노마드코더라 강의에서 만든 네이버 웹툰 API를 통해 data를 fetch하는 방법을 알 수 있다.  
웹툰 페이지에서 웹툰리스트를 외부링크로 연결하는 방법을 알 수 있다.  
웹툰 페이지를 좋아요 누르고 좋아요 데이터 값을 기기 내부에 저장하는 방법을 알 수 있다.  


## 파일구조 - MVC Parttern

뷰 페이지  
/lib/screens/detail_screen.dart  
/lib/screens/home_screen.dart  

뷰 페이지의 위젯 리팩토링  
/lib/widgets/episode_widget.dart  
/lib/widgets/webtoon_widget.dart  

API와 통신하는 페이지  
/lib/services/api_service.dart  

API와 통신하는 페이지에서 객체화시키는 모델 페이지  
/lib/models/webtoon_detail_model.dart  
/lib/models/webtoon_episode_model.dart  
/lib/models/webtoon_model.dart  

<br>

---

# ✨ API

https://webtoon-crawler.nomadcoders.workers.dev/

```
`/today` : Returns today's comics  
`/:id` : Returns a comic's information by `:id`  
`/:id/episodes: Returns the latest episodes for a comic by `:id`  
```

<br>

https://webtoon-crawler.nomadcoders.workers.dev/today
```
[
  {
    title: "99강화나무몽둥이",
    thumb: "https://shared-comic.pstatic.net/thumb/webtoon/792651/thumbnail/thumbnail_IMAG21_218f18ef-7f68-4d6a-972c-686a3e9f6138.jpg",
    id: "792651"
  },
  {
    title: "취사병 전설이 되다",
    thumb: "https://shared-comic.pstatic.net/thumb/webtoon/727188/thumbnail/thumbnail_IMAG21_d4726354-42bc-4bdf-b500-02c951082eeb.jpg",
    id: "727188"
  },
]
```

<br>

https://webtoon-crawler.nomadcoders.workers.dev/776255

```
{
  title: "천마육성",
  about: "마교의 태왕각주 ‘사마귀’의 명령으로 화산파 출목지역으로 파견나간 비객조.‘설휘’는 화산파의 절대고수 ‘구종명’에게 죽임을 당할 위기에 처한다.그 때 눈앞에 상태창이 나타나고 정찰임무를 받기 직전으로 회귀하게 된다.설휘는 자신이 전생에서 죽임을 당했던 똑같은 임무를 받게 되자 주변의 환경을 조금이라도 바꾸어 살아남고자 발버둥친다.고비마다 눈앞에 나타나는 선택창, 미래를 알 수 없는 지문들. 삶과 죽음이 공존하는 세상 안에서 최선의 방법을 찾아 나선다.",
  genre: "스토리, 무협/사극",
  age: "12세 이용가",
  thumb: "https://shared-comic.pstatic.net/thumb/webtoon/776255/thumbnail/thumbnail_IMAG06_ecf76e96-eb4a-4fe8-a0ab-9fdb4cdcb547.jpg"
}
```
<br>

https://webtoon-crawler.nomadcoders.workers.dev/776255/episodes

```
[
  {
    thumb: "https://shared-comic.pstatic.net/thumb/webtoon/776255/69/thumbnail_202x120_8237472b-b09e-4b9a-87dd-8e5525bfcdaf.jpg",
    id: "69",
    title: "69화",
    rating: "9.94",
    date: "2023.02.01"
  },
  {
    thumb: "https://shared-comic.pstatic.net/thumb/webtoon/776255/68/thumbnail_202x120_f20095c1-7fb2-4f95-ba84-a8fcc012e2e4.jpg",
    id: "68",
    title: "68화",
    rating: "9.96",
    date: "2023.01.25"
  },
]
```

---

# ✨ Packages

## http

`http` 를 사용하여 GET/POST 방식으로 서버 API를 호출할 수 있다.

path : `/lib/services/api_service.dart`

## url_launcher

`url_launcher` 패키지를 사용해 외부링크로 연결하는 방법을 알 수 있다.
mail, https, tel, sms, file 을 외부링크로 걸 수 있다.

path : `/lib/services/api_service.dart`

## shared_preferences

메모리가아닌 핸드폰 저장소에 저장을 한다.(=localStorage)
prefs.setStringList 를 이용하여 배열 형태로 저장함.

`key`, `list[]` 형태로 좋아요한 `id`를 저장하는 예제.

path : `/lib/widgets/episode_widget.dart`

