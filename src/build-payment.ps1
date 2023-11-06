<#
.DESCRIPTION
    - PowerShell ISE 에서 라인별 수행(해당 라인에 커서를 위치시키고 F8 이용)    
      ** 반드시 C:\DBStat 안에서 작업해야 함
    - 결제 내역
    - 대상 폴더
    admin/payment
#>
Get-TableUsage payment NEW_CADIAN F

Get-Column admin\payment NEW_CADIAN F

Invoke-ColumnUsage admin\payment F

Invoke-ColumnAlter admin\payment F

#Get-TableUsage payment cadian C
