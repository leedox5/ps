<#
.DESCRIPTION
    PowerShell ISE 에서 라인별 수행(해당 라인에 커서를 위치시키고 F8 이용)    
    ** 반드시 C:\DBStat 안에서 작업해야 함
#>

# 모듈 임포트 - 사용될 command를 메모리에 로딩
Import-Module .\DBStat\DBStat.psd1 -Force

# 기능 확인
Get-Command -Module DBStat

# 도움말 얻기(예)
Get-Help Get-TableUsage

# config.json 파일 설정하기 (db, srouce folder정보, target 폴더)

# 테이블 목록 가져오기
Get-Table cadian F -Verbose

Get-Table NEW_CADIAN F -Verbose

# 테이블 전체 조사하기
Get-TableUsage root cadian F -Verbose

Get-TableUsage root NEW_CADIAN F -Verbose