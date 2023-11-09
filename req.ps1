$res = Invoke-RestMethod -Uri "http://leedox.kr/book/api/word/Etc." 
$res.data.meaning1

$response = Invoke-WebRequest -Uri "http://leedox.kr/book/api/word/Etc."

$response.content | ConvertFrom-json


