alter FUNCTION [dbo].[ConvertDelimitedListIntoTable] (
     @list NVARCHAR(MAX) ,
     @delimiter CHAR(1) )
RETURNS @table TABLE (item VARCHAR(255) NOT NULL )
AS 
    BEGIN
        DECLARE @pos INT ,@nextpos INT ,@valuelen INT

        SELECT  @pos = 0 ,@nextpos = 1

        WHILE @nextpos > 0 
            BEGIN
                SELECT  @nextpos = CHARINDEX(@delimiter,@list,@pos + 1)
                SELECT  @valuelen = CASE WHEN @nextpos > 0 THEN @nextpos
                                         ELSE LEN(@list) + 1
                                    END - @pos - 1
                INSERT  @table ( item )
                VALUES  (CONVERT(INT,SUBSTRING(@list,@pos + 1,@valuelen)) )
                SELECT  @pos = @nextpos

            END

        DELETE  FROM @table
        WHERE   item = ''

        RETURN 
    END
    
    
 go   
------------------------------------

--select * from _Product p
--where p.ProductID in
--(
--select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop
--inner join _Catalog c on prop.item = c.CatalogID
--where c.Type = 'SP'
--)
--Order by p.ProductID DESC
