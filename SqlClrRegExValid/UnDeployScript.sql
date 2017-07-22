

IF EXISTS ( SELECT   1
            FROM     sys.objects
            WHERE    object_id = OBJECT_ID(N'dbo.RegExIsMatch') ) 
	DROP FUNCTION dbo.RegExIsMatch
go

IF EXISTS ( SELECT   1
            FROM     sys.assemblies asms
            WHERE    asms.name = N'RegExFunction ' ) 
	DROP ASSEMBLY [RegExFunction]
GO 

