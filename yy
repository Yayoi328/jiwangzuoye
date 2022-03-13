#根据经纬度确定地点
<!DOCTYPE html>  
<html>  
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Hello, World</title>  
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:100%}  
</style>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=XUC79CmxB4hxLxqcnrEGngTqOumOV1CK">
</script>
</head>  
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
var map = new BMap.Map("container");          // 创建地图实例  
var point = new BMap.Point(106.63701955062727,31.7973190636538);  // 创建点坐标  
map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
</script>  
</body>  
</html>

#添加图片url
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>地面图片叠加层</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <style>
    body,
    html,
    #container {
        overflow: hidden;
        width: 100%;
        height: 100%;
        margin: 0;
        font-family: "微软雅黑";
    }
    </style>
    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=XUC79CmxB4hxLxqcnrEGngTqOumOV1CK"></script>
</head>
<body>
    <div id="container"></div>
</body>
</html>
<script>
var map = new BMapGL.Map('container');
map.centerAndZoom(new BMapGL.Point(106.63701955062727,31.7973190636538), 18);

var pStart = new BMapGL.Point(106.63701955062727,31.7973190636538);
var pEnd = new BMapGL.Point(106.63701955062727,31.7973190636538);
var bounds = new BMapGL.Bounds(new BMapGL.Point(pStart.lng, pEnd.lat), new BMapGL.Point(pEnd.lng, pStart.lat));
var imgOverlay = new BMapGL.GroundOverlay(bounds, {
    type: 'image',
    url: 'https://youimg1.c-ctrip.com/target/100j12000000ssibqDD66.jpg',
    opacity: 1
});
map.addOverlay(imgOverlay);

</script>

#添加信息窗口
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=XUC79CmxB4hxLxqcnrEGngTqOumOV1CK"></script>
	<title>添加信息窗口</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMapGL.Map("allmap");
	var point = new BMapGL.Point(106.63701955062727,31.7973190636538);
	map.centerAndZoom(point, 15);
	
	var marker = new BMapGL.Marker(point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	var opts = {
	    width : 200,     // 信息窗口宽度
	    height: 100,     // 信息窗口高度
	    title : "恩阳古镇" , // 信息窗口标题
	    message:"恩阳古镇"
	}
	var infoWindow = new BMapGL.InfoWindow("坐落于川东北地区的革命老区巴中市恩阳区，东临巴中市区。恩阳河从旁流过，故名恩阳古镇", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow, point); //开启信息窗口
	}); 
</script>
