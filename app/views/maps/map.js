let success = (pos) => {
  // マップオブジェクトの変数を空で宣言
  let map;
  let myLocation;

  let nowLat = pos.coords.latitude; // 緯度
  let nowLng = pos.coords.longitude; // 経度
  // 現在地の緯度・経度を変数に格納
  let nowLatLng = new google.maps.LatLng(nowLat, nowLng);

  // マップオプションを変数に格納
  let mapOptions = {
    zoom: 14, // 拡大率
    center: nowLatLng // 中心座標を指定
  };

  // マップオブジェクト作成
  map = new google.maps.Map(
    document.getElementById('js-map'),
    mapOptions
  );

  // マップにマーカーを表示する
  myLocation = new google.maps.Marker({
    map: map, // mapに対して指定（マップオブジェクト作成したやつ）
    position: mapOptions.center, // mapOptionsから座標を指定
    icon: {
      url: 'https://higemura.com/wordpress/wp-content/uploads/2018/10/ic_gmap_mylocation.svg', // icon画像（png画像でも可）
      scaledSize: new google.maps.Size(32, 32) // 表示するアイコンサイズ
    },
    title: '現在地' // アイコンにマウスホバーすると出てくる文言
  });
}

// 位置情報取得が失敗したら
let error = (err) => {
  // エラーメッセージ
  msg = 'エラーが発生しました: ' + err;
  console.log(msg);
}

// getCurrentPositionのオプション
let options = {
  enableHighAccuracy: false,
  timeout: 5000,
  maximumAge: 0
};

// 位置情報を取得
navigator.geolocation.getCurrentPosition(success, error, options);
