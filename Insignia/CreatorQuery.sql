--Pivot report
go
use ils
select * from (
select 'Items created' as type, t02CreatedBy as name, count(t02CreatedBy) as number
from dbo.Items_t02
where t02DateCreated > getdate() - 6
group by t02CreatedBy
Union All
select 'Items modified' as type, t02ModifiedBy as name, count(t02ModifiedBy) as number
from dbo.Items_t02
where t02DateModified > getdate() - 6
group by t02ModifiedBy
Union All
select 'Copies created' as type, t03CreatedBy as name, count(t03CreatedBy) as number
from dbo.Copies_t03
where t03DateCreated > getdate() - 6
group by t03CreatedBy
Union All
select 'Copies modified' as type, t03ModifiedBy as name, count(t03ModifiedBy) as number
from dbo.Copies_t03
where t03DateModified > getdate() - 6
group by t03ModifiedBy
) as query

--Insignia Items
select t02CreatedBy, t02DateCreated as create_date
from dbo.Items_t02
where t02DateCreated > getdate() - 6
order by t02CreatedBy

select t02ModifiedBy, CONVERT(date,t02DateModified) as modified_date
from dbo.Items_t02
where t02DateModified > getdate() - 6
order by t02ModifiedBy

--Insignia Copies
select t03CreatedBy, CONVERT(date,t03DateCreated) as create_date
from dbo.Copies_t03
where t03DateCreated > getdate() - 6
order by t03CreatedBy

select t03ModifiedBy, CONVERT(date,t03DateModified) as modified_date
from dbo.Copies_t03
where t03DateModified > getdate() - 6
order by t03ModifiedBy

--reports
select t02CreatedBy as name, count(t02CreatedBy) as created
from dbo.Items_t02
where t02DateCreated > getdate() - 6
group by t02CreatedBy

select t02ModifiedBy as name, count(t02ModifiedBy) as modified
from dbo.Items_t02
where t02DateModified > getdate() - 6
group by t02ModifiedBy

select t03CreatedBy as name, count(t03CreatedBy) as created
from dbo.Copies_t03
where t03DateCreated > getdate() - 6
group by t03CreatedBy

select t03ModifiedBy as name, count(t03ModifiedBy) as modified
from dbo.Copies_t03
where t03DateModified > getdate() - 6
group by t03ModifiedBy

--Past reports
--First week pivot
select * from (
select 'Items created' as type, t02CreatedBy as name, count(t02CreatedBy) as number
from dbo.Items_t02
where t02DateCreated < '2014-05-10 00:00:00'
and t02DateCreated > '2014-05-03 00:00:00'
group by t02CreatedBy
Union All
select 'Items modified' as type, t02ModifiedBy as name, count(t02ModifiedBy) as number
from dbo.Items_t02
where t02DateModified < '2014-05-10 00:00:00'
and t02DateModified > '2014-05-03 00:00:00'
group by t02ModifiedBy
Union All
select 'Copies created' as type, t03CreatedBy as name, count(t03CreatedBy) as number
from dbo.Copies_t03
where t03DateCreated < '2014-05-10 00:00:00'
and t03DateCreated > '2014-05-03 00:00:00'
group by t03CreatedBy
Union All
select 'Copies modified' as type, t03ModifiedBy as name, count(t03ModifiedBy) as number
from dbo.Copies_t03
where t03DateModified < '2014-05-10 00:00:00'
and t03DateModified > '2014-05-03 00:00:00'
group by t03ModifiedBy
) as query
