function Get-ColumnDesc {
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]$TableName
    )
    $src = (Get-Location).Path
    $chkPath = "$src\resource\$TableName-C2.txt"
    
    $cols = Get-Content "$src\resource\$TableName-R1.txt"
    
    $dic = Get-Content "$src\resource\dict.json" | ConvertFrom-Json

    foreach ($col in $cols) {
        if ($col.StartsWith("Created")) {
            continue
        }

        if ($col.length -gt 0) {
            $colStr = "{0, -50}" -f $col

            Write-Host $colStr -NoNewline
            $pt = $col.Substring(0, 20).trim()
            
            if (Test-Path $chkPath) {
                $results = Select-String -Path $chkPath -Pattern $pt  
            }
            else {
                $results = @()
            }

            if ($results.Count -gt 0) {
                Write-Host "A " -NoNewline            
                $results[0].Line
            }
            else {
                $word = Get-Content "$src\resource\word.json" | ConvertFrom-Json
                $d = $dic | Where { $_.Col -eq $pt }
                if ($d) {
                    $w = $word | Where { $_.word -eq $d.col }

                    if ($w) {
                        Write-Host "D " -NoNewline
                        $str = "{0, -29} {1, -20}" -f $d.col, $w.meaning
                    }
                    else {
                        Write-Host "  " -NoNewline
                        $str = "{0, -29} {1, -20}" -f $d.col, $d.Desc
                    }

                    Write-Host $str
                }
                else {
                    $descStr = Get-Words $pt

                    if ($descStr) {
                        Write-Host  "W " -NoNewline
                        $str = "{0, -29} {1}" -f $pt, $descStr
                        Write-Host $str
                    }
                    else {
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
}

#$dic | ConvertTo-Json | Set-Content $src\resource\dict.json -Encoding UTF8