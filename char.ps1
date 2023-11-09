function Get-Words {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$Str
    )
    #$Str = "productType"
    #$Str = "AttachFileName"
    #$Str = "code_cat"
    #$Str = "Etc_Idx"

    $src = (Get-Location).Path
    $word = Get-Content $src\resource\word.json | ConvertFrom-Json
    
    # todo word를 바로 받아오도록 해야함
    #$res = Invoke-RestMethod -Uri "http://leedox.kr/book/api/word/type" 
    #$word = $res.data

    $arr = $Str.ToCharArray()

    $str1 = ""
    $cnt = 0
    $mt = $false

    foreach ($s in $arr) {
        #Write-Host $s -NoNewline
        if ($s -cmatch "[A-Z]") {
            $mt = $true
            #Write-Host ' Matched!' $mt
            if ($cnt -gt 0) {
                if ($mt) {
                    #Write-Host $str1 $s
                    if ($str1.EndsWith("_")) {

                    }
                    else {
                        $str1 += ","
                    }
                }
            }
            $str1 += $s
        }
        else {
            #Write-Host ' Not Matched'
            $str1 += $s
            $mt = $false
        }
        #Write-Host $str1
        $cnt++
    }
    $str1 = $str1.Replace("_", ",")

    $ColWords = $str1.Split(",")

    $desc = "";
    $cnt = 0;
    $found = $false

    foreach ($colWord in $ColWords) {
        #$w = $word | Where { $_.word -eq $colWord}
        $w = Get-LeedoxWord $colWord
        #Write-Host $colWord -NoNewline
        #Write-Host $cnt -NoNewline
        if ($found) {
            $desc += " "
        }

        if ($w) {
            #Write-Host "Found!"
            $found = $true
            $desc += $w.meaning1    
            $cnt++
        }
        else {
            #Write-Host "Not found"
            $found = $false
        }
    }
    $desc
}

