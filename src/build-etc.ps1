<#
.DESCRIPTION
    - PowerShell ISE 에서 라인별 수행(해당 라인에 커서를 위치시키고 F8 이용)    
      ** 반드시 C:\DBStat 안에서 작업해야 함
    - 문의 견적요청
    - 대상 폴더
    admin/etc 
#>
# 테이블 사용 분석
Get-TableUsage etc NEW_CADIAN F

# 컬럼 정보 추출
Get-Column admin\etc NEW_CADIAN F

# 컬럼 사용 분석
Invoke-ColumnUsage admin\etc C

# alter문 추출
Invoke-ColumnAlter admin\etc F

# DB명을 파라메터로 수행 가능
# Get-TableUsage etc cadian C