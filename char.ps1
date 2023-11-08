function Get-Words {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$Str
    )
    #$Str = "productType"
    #$Str = "AttachFileName"

    $src = (Get-Location).Path
    $word = Get-Content $src\resource\word.json | ConvertFrom-Json
    $arr = $Str.ToCharArray()

    $str1 = ""
    $cnt = 0
    $mt = $false

    foreach ($s in $arr) {
        #Write-Host $s -NoNewline
        if ($s -cmatch "[A-Z]") {
            $mt = $true
            #Write-Host ' Matched!' $mt
            if($cnt -gt 0) {
                if ($mt) {
                    $str1 += ","
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

    $ColWords = $str1.Split(",")

    $desc = "";
    $cnt = 0;
    $found = $false

    foreach($colWord in $ColWords) {
        $w = $word | Where { $_.word -eq $colWord}
        #Write-Host $colWord -NoNewline
        #Write-Host $cnt -NoNewline
        if($found) {
            $desc += " "
        }

        if($w) {
            #Write-Host "Found!"
            $found = $true
            $desc += $w.meaning    
            $cnt++
        } else {
            #Write-Host "Not found"
            $found = $false
        }
    }
    $desc
}

