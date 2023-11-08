$res = Invoke-RestMethod -Uri "http://leedox.kr/book/api/word/type" 
$res.data.meaning1

$response = Invoke-WebRequest -Uri "http://leedox.kr/book/api/word/attach"

$response.content | ConvertFrom-json


