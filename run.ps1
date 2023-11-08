
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$cookie = New-Object System.Net.Cookie("ASPSESSIONIDQAQCDSAS", "NMHHBFNBJFNOHAIKLEFJKDGK", "/", "admin.cadian.com")
$session.Cookies.Add($cookie)

$product = "http://admin.cadian.com/product/view.asp?idx=57&pdtType=pdt1&cate=54"
$admin = Invoke-WebRequest -Uri $product -WebSession $session -TimeoutSec 900 

$usView = "http://admin.cadian.com/product/us_view.asp?idx=8&pdtType=pdt1_us&cate=109"
$admin = Invoke-WebRequest -Uri $usView -WebSession $session -TimeoutSec 900 

$payment = "http://admin.cadian.com/payment/view.asp?oid=cad1_20230825093047648"
$admin = Invoke-WebRequest -Uri $payment -WebSession $session -TimeoutSec 900 

$community = "http://admin.cadian.com/community/news_view.asp?idx=345031&cate=0&bbs=news"
$admin = Invoke-WebRequest -Uri $community -WebSession $session -TimeoutSec 900 

$admin.Content

$admin.AllElements.Count

$admin.AllElements |?{$_.TagName -eq 'th'} |select outerHtml

$admin.AllElements |?{$_.TagName -eq 'td'} |select outerHtml 

$admin.AllElements.getElementsByTagName("th")


$ths = $admin.ParsedHtml.body.getElementsByTagName('th')
$tds = $admin.ParsedHtml.body.getElementsByTagName('td')

$admin.ParsedHtml | Get-Member

$ths = $admin.ParsedHtml.getElementsByTagName('th')

foreach ($th in $ths) {
    Write-Host $th.outerHtml
}

foreach ($td in $tds) {
    $ul = $td.firstChild;
    if ($ul) {
        Write-Host $ul.outerHTML
    }
}

($ths | Where { $_.ClassName -eq 'input_tit' }).InnerText

foreach ($th in $ths | Where { $_.ClassName -eq 'input_tit' }) {
    Write-Host $th.outerHTML
}


$ths1 = $ths | Where { $_.ClassName -eq 'input_tit' }
$tds1 = $tds | Where { $_.ClassName -eq 'input_cont' }


foreach ($th in $ths1) {
    $str = $th.outerHtml
    Write-Host $str
}

for ($i = 0 ; $i -lt $ths1.length ; $i++) {
    $child = $tds1[$i].firstChild
    if ($child) {
        $str1 = "{0, -30}" -f $child.getAttribute("id")
    }
    else {
        $str1 = "{0, -30}" -f $tds1[$i].getAttribute("id")
    }
    $str2 = "{0, -30}" -f $ths1[$i].innerHtml
    Write-Host $str1 -NoNewline
    Write-Host $str2
}



foreach ($th in $ths) {
    if ($th.ClassName -eq "input_tit") {
        Write-Host $th.outerHTML 
    }
}

$ths[0] | Get-Member


foreach ($td in $tds) {
    if ($td.ClassName -eq "input_cont") {
        Write-Host $td.outerHTML
    }
    
}


# with th, td tag
for ($i = 0 ; $i -lt $tds.length ; $i++) {
    $str = "{0, -50} {1, -40}" -f $tds[$i].outerHTML, $ths[$i].outerHTML
    Write-Host $str
}


# id, header

for ($i = 0 ; $i -lt $tds.length ; $i++) {
    $ul = $tds[$i].firstChild
    if ($ul) {
        $t = $ul.getAttribute("id")
    }
    else {
        $t = $tds[$i].getAttribute("id")
    }
    $str = "{0, -30} {1, -25}" -f $t , $ths[$i].innerHTML
    Write-Host $str
}

# txt replace
for ($i = 0 ; $i -lt $tds.length ; $i++) {
    $ul = $tds[$i].firstChild
    if ($ul) {
        $t = $ul.getAttribute("id")
    }
    else {
        $t = $tds[$i].getAttribute("id")
    }
    $t = $t.replace("txt", "")
    $str = "{0, -30} {1, -25}" -f $t , $ths[$i].innerHTML
    Write-Host $str
}


$src = (Get-Location).Path

$cols = Get-Content $src\TB_PRODUCT_1105-R1.txt

foreach ($col in $cols) {
    if ($col.length -gt 0) {
        $colStr = "{0, -50}" -f $col

        Write-Host $colStr -NoNewline
        $pt = $col.Substring(0, 20).trim()
        $results = Select-String -Path .\resource\TB_PRODUCT-C3.txt -Pattern $pt  
        if ($results.Count -gt 0) {
            $results[0].Line
        }
        else {
            Write-Host ""
        }
    }
}

Select-String -Path .\resource\TB_PRODUCT-C3.txt -Pattern license | Select-Object Line