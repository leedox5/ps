SET NOCOUNT ON;

select trim(name)
  from sys.tables
 order by name