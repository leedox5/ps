<#
.DESCRIPTION
    - PowerShell ISE 에서 라인별 수행(해당 라인에 커서를 위치시키고 F8 이용)    
      ** 반드시 C:\DBStat 안에서 작업해야 함
    - 커뮤티티
    - 대상 폴더
    admin/community
    www/kr/community
    www/us/community 
#>
# admin/community
Get-TableUsage community NEW_CADIAN F

Get-Column admin\community NEW_CADIAN F

Invoke-ColumnUsage admin\community F

Invoke-ColumnAlter admin\community F

# www/kr/community
Get-TableUsageHome kr\community NEW_CADIAN F

Get-Column www\kr\community NEW_CADIAN F

Invoke-ColumnUsage www\kr\community F

Invoke-ColumnAlter www\kr\community F

# www/us/community
Get-TableUsageHome us\community NEW_CADIAN F

Get-Column www\us\community NEW_CADIAN F

Invoke-ColumnUsage www\us\community F

Invoke-ColumnAlter www\us\community F

# DB명을 파라메터로 수행 가능
#Get-TableUsage community cadian C
