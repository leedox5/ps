<#
.DESCRIPTION
    - PowerShell ISE 에서 라인별 수행(해당 라인에 커서를 위치시키고 F8 이용)    
      ** 반드시 C:\DBStat 안에서 작업해야 함
    - 제품관리
    - 대상 폴더
    admin/product 
#>
# 테이블 사용 분석
Get-TableUsage product NEW_CADIAN F

# 컬럼 정보 추출
Get-Column admin\product NEW_CADIAN F

# 컬럼 사용 분석
Invoke-ColumnUsage admin\product F

# alter문 추출
Invoke-ColumnAlter admin\product F

Get-TableUsage product cadian C

# target 폴더에 생성된 alter 스크립트를 수행(주석 해제후 사용) 
# Set-Column NEW_CADIAN 테이블명-ALTER.txt  
 




