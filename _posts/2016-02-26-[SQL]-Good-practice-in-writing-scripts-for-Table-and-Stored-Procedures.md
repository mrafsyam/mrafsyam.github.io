---           
layout: post
title: [SQL] Good practice in writing scripts for Table and Stored Procedures
date: 2016-02-26 11:44:23 UTC
updated: 2016-02-26 11:44:23 UTC
comments: false
categories: 
---

I learned this from my current project's team leader, Shaun who is a good programmer himself. His attentive to details is off the chart among those that I know. These are good habits to incorporate into my programming skill, specifically for SQL.<br /><br />All the tips below are to ensure that our SQL scripts can be executed at all times and multiple times. These are also to ensure that MOST preconditions are covered so that our script can be executed successfully until the end of the line - instead of stopping halfway due to errors.. Sometimes, we as developer have no control over the deployment of our scripts. Once we handed them over, the IT guys of the clients will run the scripts and chase us when something goes wrong (which happens, all the time!)<br /><br /><br /><br /><b>For TABLES</b><br /><br />1. To create a new table, do not just DROP and CREATE. The best way is to put in the preconditions check, that is to check first IF EXIST (using schema, sys,object or HASH and then DROP. This will avoid stopping the execution of the script due to the table not found - thus can't be dropped.<br /><br />Using sys,objects :<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;"><br /></span><span style="font-family: courier new, courier, monospace;">IF EXISTS(SELECT 1 FROM sys.Objects WHERE &nbsp;Object_id = OBJECT_ID(N'dbo.MY_TABLE') AND Type = N'U')</span><br /><span style="font-family: courier new, courier, monospace;">BEGIN</span><br /><span style="font-family: courier new, courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> </span>PRINT 'TABLE_EXIST'</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">ENDIF&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><br /></span><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span style="font-family: 'Times New Roman';">Using Hash :</span></span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span style="font-family: 'Times New Roman';"><br /></span></span><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">IF DBO.getTableHash('MY_TABLE') = 0xACE31E3C4550DE4B166F01E78A1D86E5</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">&nbsp;<span class="Apple-tab-span" style="white-space: pre;"> </span>DROP TABLE MY_TABLE</span><br /><br />2. To insert a new data, ensure that ALL PRIMARY KEYS of the rows are checked against before the INSERT command is executed. This is to ensure that we select exactly the data row that we want - the use of Primary Keys distinguishes this!<br /><span style="font-size: x-normal;"><b><br /></b></span><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">IF NOT EXISTS (SELECT * FROM TABLE1 WHERE COL_PK1='A1' AND COL_PK2='A2')&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">BEGIN</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span class="Apple-tab-span" style="white-space: pre;"> </span>INSERT INTO SET_INITIAL&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span class="Apple-tab-span" style="white-space: pre;"> </span>(COL3, COL4)</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span class="Apple-tab-span" style="white-space: pre;"> </span>VALUES&nbsp;</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><span class="Apple-tab-span" style="white-space: pre;"> </span>('A3','A4')</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">END</span><br /><br /><br /><b>For STORED PROCEDURES (StoProc)</b><br /><br />1. To alter an existing StoProc or to create a new one, do not use DROP and CREATE. SQL keeps a log <i>somewhere</i> with regards to the creation and modification of any StoProc. For existing StoProc, DROP and CREATE will not be helpful anymore for the logs because CREATE builds a new StoProc altogether instead of referring to the previously existing one that being dropped. Instead, use the following : Check IF NOT EXIST, then CREATE empty StoProc. Then, followed by ALTER StoProc. In the above script, first part creates an dummy StoProc if the StoProc with the specified name in the specified schema does not exist. This is useful for the initial setup, when you are creating this StoProc in a new environment. The second part alters the StoProc always – whether it’s created in the first step or it existed before. So, every time you need to make some changes in the StoProc, only the ALTER PROCEDURE section (second part) of the above script needs to be modified and entire script can be executed without worrying whether the StoProc already exists or not.<br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;"><b><br /></b></span><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_MY_ELEGANT_SP]') AND type in (N'P', N'PC'))</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">&nbsp;EXEC('CREATE PROCEDURE [dbo].[SP_MY_ELEGANT_SP] &nbsp;AS SET NOCOUNT ON;')</span><br /><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace; font-size: xx-normal;">GO</span><br /><span style="font-size: xx-normal;"><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;"><br /></span><span style="font-family: &quot;courier new&quot; , &quot;courier&quot; , monospace;">ALTER PROCEDURE [dbo].[SP_MY_ELEGANT_SP]<br />.....</span></span><br /><span style="font-family: inherit;">The usual approach what people follow for modifying StoProc is to check IF EXIST, then DROP it (if exists) and CREATE it back. The following are the drawbacks of using this approach:</span><br /><br /><ul><li><span style="font-family: inherit;">Permissions associated with the object, like GRANT EXECUTE etc., are lost when we DROP and CREATE the StoProc.</span></li><li><span style="font-family: inherit;">If ALTER PROCEDURE is used on any prior version in a "maintenance" script, different Script needs to be written to cater for it if the StoProc is already existed.</span></li><li><span style="font-family: inherit;">If DROP PROCEDURE and CREATE PROCEDURE approach is used, then all the permissions previously present on the Stored Procedure need to be given again with the help of necessary additional scripts.&nbsp;</span></li></ul><div><br /></div><br /><span style="font-size: xx-normal;"><span style="font-family: inherit;"></span></span>