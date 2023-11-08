$src = (Get-Location).Path

$cols = Get-Content $src\resource\TB_PAYMENT-R1.txt

<#
$dic = @(
    [PSCustomObject]@{Col = "paymentIdx"; Desc = "인덱스"},
    [PSCustomObject]@{Col = "oid";        Desc = "아이디 O"},
    [PSCustomObject]@{Col = "tid";        Desc = "아이디 T"}
)

$dic | ConvertTo-Json
#>

$dic = Get-Content $src\resource\dict.json | ConvertFrom-Json
#$spec = $colSpec | Where {$_.Col -eq "oid"}

foreach ($col in $cols) {
    if ($col.StartsWith("Created")) {
        continue
    }

    if ($col.length -gt 0) {
        $colStr = "{0, -50}" -f $col

        Write-Host $colStr -NoNewline
        $pt = $col.Substring(0, 20).trim()
        $results = Select-String -Path .\resource\TB_PAYMENT-C2.txt -Pattern $pt  
        if ($results.Count -gt 0) {
            Write-Host "A " -NoNewline            
            $results[0].Line
        }
        else {
            $word = Get-Content $src\resource\word.json | ConvertFrom-Json
            $d = $dic | Where { $_.Col -eq $pt }
            if ($d) {


                $w = $word | Where { $_.word -eq $d.col}

                if($w) {
                    Write-Host "D " -NoNewline
                    $str = "{0, -29} {1, -20}" -f $d.col, $w.meaning
                } else {
                    Write-Host "  " -NoNewline
                    $str = "{0, -29} {1, -20}" -f $d.col, $d.Desc
                }

                Write-Host $str
            }
            else {
                <#
                $arr = $pt.ToCharArray();

                foreach($s in $arr) {
                    if($s -cmatch "[A-Z]") {
                        $pos = $arr.IndexOf($s)
                    }
                }
                $w1 = $pt.Substring(0, $pos)
                $w2 = $pt.Substring($pos)

                $m1 = $word | Where { $_.word -eq $w1}
                $m2 = $word | Where { $_.word -eq $w2}
                #>
                $descStr = Get-Words $pt

                if($descStr) {
                    Write-Host  "W " -NoNewline
                    $str = "{0, -29} {1}" -f $pt, $descStr
                    Write-Host $str
                } else {
                    $new = [PSCustomObject]@{
                        col  = $pt
                        desc = $pt.ToUpper()
                    }
                    $dic += $new
                    Write-Host ""
                }
            }
        }
    }
}

#$dic | ConvertTo-Json | Set-Content $src\resource\dict.json -Encoding UTF8