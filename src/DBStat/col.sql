SET NOCOUNT ON;

select c.name
  from sys.tables t
      inner join
	   sys.columns c
	  on c.object_id = t.object_id
 where t.name = '$(NAME)'