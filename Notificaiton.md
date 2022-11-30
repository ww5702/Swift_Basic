# Notification

문자 그대로 notification은 알림을 표현해주는 기능이다.   
애플에는 user notification을 띄울 수 있는 프레임워크가 있다.   
화면 상단에 뜨는 앱 알림을 'push'라고 말하며 notification과 혼동할 수 있지만   
   
push 는 앱 외부에서 알림을 보내는 경우이고,   
Notification은 서버에서 보낼 수도 있고, 앱 내에서도 보낼 수 있다.   

즉, Notification은 alert를 띄우고, 소리를 낼 수 있고, 앱 아이콘을 뱃지로 보여줄 수 있다.   

## 알림 띄울 권한 요청하기
Notification을 사용할 때, 권한을 요천하는 것이다.   
권한을 요청하기 위해 UNUserNotificationCenter 인스턴스를 가져와서   
requestAuthorization(options:completionHandler:) 메서드를 호출한다.   
   
```
let center = UNUserNotificationCenter.current()
center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
    
    if let error = error {
        // Handle the error here.
    }
    
    // Enable or disable features based on the authorization.
}
```
   
alert = 알림이 화면에 보여지는것   
sound = 소리   
badge = 빨간색 동그라미 숫자   
   
만약
<img width="438" alt="스크린샷 2022-11-30 오후 3 46 47" src="https://user-images.githubusercontent.com/60501045/204726764-82757333-f18f-4694-8966-ba42794e2342.png">


<img width="451" alt="스크린샷 2022-11-30 오후 3 47 28" src="https://user-images.githubusercontent.com/60501045/204726867-ac6e7bcb-df50-4379-b2a6-84e995e0f14d.png">
