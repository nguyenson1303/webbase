alter PROCEDURE create_order_code
as
begin
	Declare @r varchar(8);
	set @r = '';
	select @r = coalesce(@r, '') + n FROM (SELECT top 8 CHAR(number) n FROM master..spt_values
	WHERE type = 'P' 
	AND (number between ascii(0) and ascii(9)
	or number between ascii('A') and ascii('Z'))
	--or number between ascii('a') and ascii('z'))
	ORDER BY newid()) a
	select @r AS order_code
end

exec create_order_code
