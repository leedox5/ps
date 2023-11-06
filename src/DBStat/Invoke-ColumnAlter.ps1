function Invoke-ColumnAlter {
    <#
    .DESCRIPTION
        Get-ColumnAlter를 반복 수행

    .PARAMETER FolderName
        테이블 정의 파일의 위치(폴더명)

    .PARAMETER OutType함
        C  - 콘솔 출력
        F  - 파일 출력

    .EXAMPLE
        Invoke-ColumnAlter admin\etc C
    #>

        [CmdletBinding()]
        param (
            [Parameter(Mandatory, Position=0)]
            [string]$FolderName,
            [Parameter(Mandatory, Position=2)]
            [string]$OutType
        )

        $config = Get-Content C:\DBStat\config.json | ConvertFrom-Json;

    $srcPath = $config.outRoot + "\" + $FolderName + "\TB*-R1.txt"

    $src = @(Get-ChildItem -Path $srcPath)

    foreach ($file in @($src)) {
        try {
            Write-Host $file.Basename
            Get-ColumnAlter $FolderName $file.Basename $OutType
        }
        catch {
            throw "Unable to open source [$($file.FullName)]"

        }
    }
}