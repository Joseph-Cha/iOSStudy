# iOSStudy
iOS 앱 개발 개인 스터디 공간입니다.

## 1. App Build Intro

<img src="./resources/1.AppBuildIntro.gif" width="30%" height="30%"/>

버튼 클릭 시 같은 storyboard에 있는 ViewController를 화면에 띄워줍니다.

``` swift
let storyBoard = UIStoryboard(name: "Main", bundle: nil)
let detailViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController

self.present(detailViewController, animated: true, completion: nil)
```

