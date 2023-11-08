function Get-LeedoxWord {
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$Key
    )
    $base = "http://leedox.kr/book/api/word/"
    $uri = $base + $Key

    $res = Invoke-RestMethod -Uri $uri 
    $res.data
}

