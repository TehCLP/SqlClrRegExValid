

-- Reset the 'allow updates' setting to the recommended 0
sp_configure 'allow updates', 0
RECONFIGURE WITH OVERRIDE
GO


sp_configure 'clr enabled', 1
RECONFIGURE WITH OVERRIDE
GO


IF EXISTS ( SELECT   1
            FROM     sys.objects
            WHERE    object_id = OBJECT_ID(N'dbo.RegExIsMatch') ) 
	DROP FUNCTION dbo.RegExIsMatch
go

 
IF EXISTS ( SELECT   1
            FROM     sys.assemblies asms
            WHERE    asms.name = N'RegExFunction ' ) 
	DROP ASSEMBLY [RegExFunction]

CREATE ASSEMBLY RegExFunction 
FROM 'C:\teh\@Test\SqlClrRegExValid\SqlClrRegExValid\bin\Debug\SqlClrRegExValid.dll'
GO
 
CREATE FUNCTION RegExIsMatch
(
    @Pattern NVARCHAR(4000),
    @Input NVARCHAR(MAX)
)
RETURNS BIT
AS EXTERNAL NAME 
   RegExFunction.UserDefinedFunctions.RegExIsMatch
GO

