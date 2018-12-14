insert into test(id,[image]) 
SELECT '21',BulkColumn 
FROM Openrowset( Bulk 'C:\Users\magic\Desktop\2.png', Single_Blob) as img