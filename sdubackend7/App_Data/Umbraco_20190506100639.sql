-- Script Date: 5/6/2019 12:06 PM  - ErikEJ.SqlCeScripting version 3.5.2.26
-- Database information:
-- Locale Identifier: 1030
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\Users\uffec\vs\sdubackend7\sdubackend7\App_Data\\Umbraco_20190506100639.sdf
-- ServerVersion: 4.0.8902.1
-- DatabaseSize: 2228224
-- Created: 5/6/2019 12:06 PM

-- User Table information:
-- Number of tables: 51
-- cmsContent: 37 row(s)
-- cmsContentType: 30 row(s)
-- cmsContentType2ContentType: 11 row(s)
-- cmsContentTypeAllowedContentType: 20 row(s)
-- cmsContentVersion: 84 row(s)
-- cmsContentXml: 20 row(s)
-- cmsDataType: 48 row(s)
-- cmsDataTypePreValues: 85 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 84 row(s)
-- cmsDocumentType: 0 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMedia: 0 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 9 row(s)
-- cmsPreviewXml: 52 row(s)
-- cmsPropertyData: 972 row(s)
-- cmsPropertyType: 127 row(s)
-- cmsPropertyTypeGroup: 36 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 0 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoAudit: 62 row(s)
-- umbracoCacheInstruction: 1 row(s)
-- umbracoConsent: 0 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLock: 1 row(s)
-- umbracoLog: 315 row(s)
-- umbracoMigration: 1 row(s)
-- umbracoNode: 125 row(s)
-- umbracoRedirectUrl: 4 row(s)
-- umbracoRelation: 17 row(s)
-- umbracoRelationType: 3 row(s)
-- umbracoServer: 1 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2UserGroup: 2 row(s)
-- umbracoUserGroup: 5 row(s)
-- umbracoUserGroup2App: 12 row(s)
-- umbracoUserGroup2NodePermission: 0 row(s)
-- umbracoUserLogin: 32 row(s)
-- umbracoUserStartNode: 0 row(s)

CREATE TABLE [cmsContent] (
  [pk] int NOT NULL  IDENTITY (38,1)
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int NOT NULL  IDENTITY (564,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) NOT NULL DEFAULT ('folder.png')
, [description] nvarchar(1500) NULL
, [isContainer] bit NOT NULL DEFAULT ('0')
, [allowAtRoot] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int NOT NULL  IDENTITY (85,1)
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int NOT NULL  IDENTITY (68,1)
, [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int NOT NULL  IDENTITY (127,1)
, [datatypeNodeId] int NOT NULL
, [value] ntext NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(450) NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [templateId] int NULL
, [newest] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int NOT NULL  IDENTITY (1,1)
, [uniqueId] uniqueidentifier NOT NULL
, [macroUseInEditor] bit NOT NULL DEFAULT ('0')
, [macroRefreshRate] int NOT NULL DEFAULT ('0')
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit NOT NULL DEFAULT ('1')
, [macroCachePersonalized] bit NOT NULL DEFAULT ('0')
, [macroDontRender] bit NOT NULL DEFAULT ('0')
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int NOT NULL  IDENTITY (1,1)
, [uniquePropertyId] uniqueidentifier NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int NOT NULL DEFAULT ('0')
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMedia] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [mediaPath] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) NOT NULL DEFAULT ('''')
, [LoginName] nvarchar(1000) NOT NULL DEFAULT ('''')
, [Password] nvarchar(1000) NOT NULL DEFAULT ('''')
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int NOT NULL  IDENTITY (19,1)
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit NOT NULL DEFAULT ('0')
, [viewOnProfile] bit NOT NULL DEFAULT ('0')
, [isSensitive] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int NOT NULL  IDENTITY (983,1)
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDecimal] numeric(38,6) NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int NOT NULL  IDENTITY (188,1)
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int NOT NULL DEFAULT ('0')
, [mandatory] bit NOT NULL DEFAULT ('0')
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
, [UniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int NOT NULL  IDENTITY (51,1)
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int NOT NULL  IDENTITY (1,1)
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit NOT NULL DEFAULT ('0')
, [id] int NOT NULL  IDENTITY (1,1)
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime NOT NULL DEFAULT (GETDATE())
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int NOT NULL  IDENTITY (2,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoAudit] (
  [id] int NOT NULL  IDENTITY (63,1)
, [performingUserId] int NOT NULL
, [performingDetails] nvarchar(1024) NULL
, [performingIp] nvarchar(64) NULL
, [eventDateUtc] datetime NOT NULL DEFAULT (GETDATE())
, [affectedUserId] int NOT NULL
, [affectedDetails] nvarchar(1024) NULL
, [eventType] nvarchar(256) NOT NULL
, [eventDetails] nvarchar(1024) NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int NOT NULL  IDENTITY (266,1)
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
, [instructionCount] int NOT NULL DEFAULT ('1')
);
GO
CREATE TABLE [umbracoConsent] (
  [id] int NOT NULL  IDENTITY (1,1)
, [current] bit NOT NULL
, [source] nvarchar(512) NOT NULL
, [context] nvarchar(128) NOT NULL
, [action] nvarchar(512) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [state] int NOT NULL
, [comment] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int NOT NULL  IDENTITY (1,1)
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int NOT NULL  IDENTITY (2,1)
, [languageISOCode] nvarchar(14) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoLock] (
  [id] int NOT NULL  IDENTITY (1,1)
, [value] int NOT NULL
, [name] nvarchar(64) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int NOT NULL  IDENTITY (316,1)
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime NOT NULL DEFAULT (GETDATE())
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoMigration] (
  [id] int NOT NULL  IDENTITY (100,1)
, [name] nvarchar(255) NOT NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [version] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int NOT NULL  IDENTITY (1162,1)
, [trashed] bit NOT NULL DEFAULT ('0')
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NOT NULL DEFAULT (NEWID())
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int NOT NULL  IDENTITY (18,1)
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime NOT NULL DEFAULT (GETDATE())
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int NOT NULL  IDENTITY (4,1)
, [typeUniqueId] uniqueidentifier NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int NOT NULL  IDENTITY (2,1)
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime NOT NULL DEFAULT (GETDATE())
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userDisabled] bit NOT NULL DEFAULT ('0')
, [userNoConsole] bit NOT NULL DEFAULT ('0')
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [passwordConfig] nvarchar(500) NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
, [emailConfirmedDate] datetime NULL
, [invitedDate] datetime NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [avatar] nvarchar(500) NULL
, [tourData] ntext NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser2UserGroup] (
  [userId] int NOT NULL
, [userGroupId] int NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup] (
  [id] int NOT NULL  IDENTITY (6,1)
, [userGroupAlias] nvarchar(200) NOT NULL
, [userGroupName] nvarchar(200) NOT NULL
, [userGroupDefaultPermissions] nvarchar(50) NULL
, [createDate] datetime NOT NULL DEFAULT (GETDATE())
, [updateDate] datetime NOT NULL DEFAULT (GETDATE())
, [icon] nvarchar(255) NULL
, [startContentId] int NULL
, [startMediaId] int NULL
);
GO
CREATE TABLE [umbracoUserGroup2App] (
  [userGroupId] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup2NodePermission] (
  [userGroupId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserLogin] (
  [sessionId] uniqueidentifier NOT NULL
, [userId] int NOT NULL
, [loggedInUtc] datetime NOT NULL
, [lastValidatedUtc] datetime NOT NULL
, [loggedOutUtc] datetime NULL
, [ipAddress] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoUserStartNode] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userId] int NOT NULL
, [startNode] int NOT NULL
, [startNodeType] int NOT NULL
);
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (1,1065,1063);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (2,1066,1061);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (3,1071,1069);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (4,1072,1069);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (5,1073,1069);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (6,1077,1075);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (7,1078,1075);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (8,1084,1083);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (9,1085,1083);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (10,1093,1089);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (11,1097,1087);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (12,1101,1100);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (13,1102,1075);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (14,1103,1075);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (15,1108,1104);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (16,1109,1106);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (17,1110,1105);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (18,1133,1132);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (19,1135,1130);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (20,1138,1129);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (21,1139,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (22,1140,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (23,1141,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (24,1142,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (25,1143,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (26,1144,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (27,1145,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (28,1146,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (29,1147,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (30,1148,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (31,1149,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (32,1150,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (33,1151,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (34,1152,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (35,1153,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (36,1154,1117);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (37,1157,1117);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (534,1033,N'File',N'icon-document',N'icon-document',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (535,1061,N'guide',N'icon-book color-blue',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (536,1063,N'home',N'icon-home color-green',N'folder.png',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (537,1064,N'baseSection',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (539,1069,N'contentBoxPage',N'icon-list color-deep-orange',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (540,1075,N'simpleBox',N'icon-stop color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (541,1083,N'login',N'icon-lock color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (542,1087,N'exercise',N'icon-hearts color-pink',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (543,1089,N'exercises',N'icon-hearts color-pink',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (544,1091,N'basePage',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (545,1098,N'baseContentBox',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (546,1100,N'guideIntro',N'icon-book color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (547,1104,N'trainingOverview',N'icon-hearts color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (548,1105,N'trainingSurvey',N'icon-hearts color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (549,1106,N'trainingDiary',N'icon-hearts color-green',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (550,1107,N'repetitionMaximum',N'icon-document',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (552,1117,N'groupASurvey',N'icon-checkbox color-red',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (553,1122,N'groupBSurvey',N'icon-checkbox color-light-blue',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (554,1124,N'groupADiary',N'icon-edit color-red',N'folder.png',N'Control group dairy',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (555,1129,N'submissionsDirectory',N'icon-folder-close color-green',N'folder.png',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (556,1130,N'userA',N'icon-umb-users color-red',N'folder.png',N'Control group',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (557,1131,N'userB',N'icon-umb-users color-blue',N'folder.png',N'Intervention group',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (558,1132,N'usersDirectory',N'icon-folder-close color-green',N'folder.png',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (559,1137,N'groupBDiary',N'icon-edit color-light-blue',N'folder.png',N'Intervention group diary',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (560,1158,N'repetitionMaximumGroupB',N'icon-temperatrure-alt color-light-blue',N'folder.png',N'Intervention group RM',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (562,1160,N'baseDairySubmission',N'icon-edit color-black',N'folder.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (563,1161,N'baseSurveySubmission',N'icon-edit color-black',N'folder.png',NULL,0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1061);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1063);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1083);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1100);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1104);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1105);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1064,1106);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1091,1089);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1091,1107);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1098,1075);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (1160,1124);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1033,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1063,1061,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1069,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1069,1075,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1063,1083,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1089,1087,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1061,1089,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1100,1075,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1063,1100,2);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1104,1105,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1104,1106,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1063,1104,3);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1129,1117,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1129,1122,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1129,1124,2);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1132,1130,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1132,1131,1);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1129,1137,3);
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (1,1065,'ed0b1adb-f05a-4f1e-8f3d-66763303c624',{ts '2019-04-09 10:02:55.510'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (2,1066,'4208b58d-bea2-4c32-8f7f-685815ac4e99',{ts '2019-04-09 10:04:03.353'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (3,1066,'cb74c60d-c135-4977-aa9e-2afea4d2c848',{ts '2019-04-09 10:06:16.710'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (4,1071,'608ce508-8f97-48f3-aaf8-7f605e86ae4f',{ts '2019-04-09 10:26:10.283'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (5,1072,'a2a30b40-1124-4ad2-a481-9d72b0cefd9d',{ts '2019-04-09 10:26:28.410'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (6,1073,'37de678b-a2ea-4087-9867-5129b0964997',{ts '2019-04-09 10:26:50.580'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (7,1066,'a17b3c3b-e560-48a4-9685-6cd0cdaa9130',{ts '2019-04-09 10:27:00.540'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (8,1065,'7495b6c1-e670-4ad0-94c2-989fc71d40f3',{ts '2019-04-09 10:27:13.707'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (9,1077,'0d990451-9edb-49c8-a9a5-89c44f183d9d',{ts '2019-04-09 10:53:52.320'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (10,1078,'9cc76e30-af8f-457b-aff4-2c635cd4bfe7',{ts '2019-04-09 10:53:17.997'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (11,1078,'5aa34b8b-6185-4224-9adc-f7ea7e9b580c',{ts '2019-04-09 10:53:46.620'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (12,1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',{ts '2019-04-10 20:24:13.157'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (13,1084,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',{ts '2019-04-10 20:32:19.303'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (14,1084,'99c295cc-0c8d-428f-9e40-22101e968622',{ts '2019-04-10 20:32:19.363'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (15,1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',{ts '2019-04-10 20:45:56.890'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (16,1093,'b1a59788-0947-48dc-8985-fa47f70409ca',{ts '2019-04-11 10:36:11.367'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (17,1072,'05728fed-4e38-4483-9387-4ce906173b8b',{ts '2019-04-11 10:36:18.603'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (18,1072,'3a61df9c-c1ac-4b49-bdd4-048ce397d02b',{ts '2019-04-11 10:36:18.627'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (19,1093,'489bbff2-90eb-4bb1-a48c-06f297c00332',{ts '2019-04-11 10:36:47.957'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (20,1093,'546f9d52-694c-47c9-b42d-2126a768cd9b',{ts '2019-04-21 13:18:30.977'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (21,1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',{ts '2019-04-21 13:18:26.487'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (22,1101,'363d3eff-fc10-4039-8b77-0eb3ddce60ed',{ts '2019-04-21 13:08:43.363'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (23,1102,'7a30fc8d-ef7c-441b-8ef4-b6d32f168a5a',{ts '2019-04-21 13:09:49.310'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (24,1102,'68d04a58-cbad-4293-b309-0d4f675d5ed9',{ts '2019-04-21 13:10:50.447'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (25,1103,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',{ts '2019-04-21 13:11:33.150'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (26,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',{ts '2019-04-21 13:58:29.793'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (27,1101,'d7062020-04e5-439e-8cbd-271271d5e086',{ts '2019-04-21 14:09:43.467'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (28,1103,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',{ts '2019-04-21 14:09:55.347'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (29,1108,'81a60f88-67ed-4522-ab6a-8bc80ee79c52',{ts '2019-04-21 14:10:31.473'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (30,1109,'1594b85e-6cca-45c5-ace0-d024c7cd351e',{ts '2019-04-21 14:10:55.340'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (31,1110,'92357437-57d3-4d39-a66a-6264f5d838fb',{ts '2019-04-21 14:11:11.960'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (32,1133,'a2763692-e746-4b0d-89bf-0f4493ebb0d7',{ts '2019-04-22 13:41:57.787'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (33,1135,'d8415c10-041c-4740-b2fd-8090e57697f3',{ts '2019-04-22 13:44:32.973'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (34,1138,'6b0e6f1e-fb98-4d08-96e3-0181898ce554',{ts '2019-04-22 14:06:35.413'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (35,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',{ts '2019-04-22 14:09:55.310'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (36,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',{ts '2019-04-22 14:48:17.830'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (37,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',{ts '2019-04-22 14:26:44.717'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (38,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',{ts '2019-04-22 14:37:44.317'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (39,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',{ts '2019-04-22 15:05:10.687'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (40,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',{ts '2019-04-22 15:05:52.853'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (41,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',{ts '2019-04-22 15:07:46.390'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (42,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',{ts '2019-04-22 15:20:14.660'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (43,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',{ts '2019-04-23 10:15:36.377'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (44,1147,'ca336733-37ad-4646-92ba-54d7640c4255',{ts '2019-04-23 10:16:44.507'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (45,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',{ts '2019-04-23 10:34:55.910'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (46,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',{ts '2019-04-23 10:37:27.103'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (47,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',{ts '2019-04-23 11:49:06.737'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (48,1151,'a86c74da-7f93-433c-a289-e429121e73f1',{ts '2019-04-23 11:51:04.540'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (49,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',{ts '2019-04-23 11:55:38.090'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (50,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',{ts '2019-04-23 11:58:00.183'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (51,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',{ts '2019-04-23 12:08:12.300'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (52,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',{ts '2019-04-23 12:08:12.367'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (53,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',{ts '2019-04-23 12:08:18.323'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (54,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',{ts '2019-04-23 12:08:23.667'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (55,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',{ts '2019-04-23 12:08:28.713'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (56,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',{ts '2019-04-23 12:08:28.747'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (57,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',{ts '2019-04-23 12:08:34.120'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (58,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',{ts '2019-04-23 12:08:34.150'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (59,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',{ts '2019-04-23 12:08:41.870'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (60,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',{ts '2019-04-23 12:08:41.897'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (61,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',{ts '2019-04-23 12:08:47.917'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (62,1145,'582dff84-3fab-415d-b229-5de612bff936',{ts '2019-04-23 12:08:47.943'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (63,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',{ts '2019-04-23 12:08:53.850'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (64,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',{ts '2019-04-23 12:08:53.880'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (65,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',{ts '2019-04-23 12:08:59.357'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (66,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',{ts '2019-04-23 12:08:59.387'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (67,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',{ts '2019-04-23 12:09:05.417'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (68,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',{ts '2019-04-23 12:09:05.440'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (69,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',{ts '2019-04-23 12:09:11.787'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (70,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',{ts '2019-04-23 12:09:11.833'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (71,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',{ts '2019-04-23 12:09:18.053'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (72,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',{ts '2019-04-23 12:09:18.087'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (73,1151,'192817e8-d708-431f-a2e7-298364ad4df0',{ts '2019-04-23 12:09:24.597'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (74,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',{ts '2019-04-23 12:09:24.623'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (75,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',{ts '2019-04-23 12:09:30.197'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (76,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',{ts '2019-04-23 12:09:30.227'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (77,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',{ts '2019-04-23 12:09:36.873'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (78,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',{ts '2019-04-23 12:09:36.903'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (79,1154,'50237dae-576e-4e82-a469-765ea7e30491',{ts '2019-04-23 12:15:29.287'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (80,1110,'64d9c2b0-55c2-4c17-b191-295bbade0b41',{ts '2019-04-23 12:53:52.527'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (81,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',{ts '2019-04-25 13:06:39.407'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (82,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',{ts '2019-04-25 13:27:20.957'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (83,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',{ts '2019-04-25 13:29:08.300'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (84,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',{ts '2019-04-26 14:30:48.467'});
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1065,N'<home id="1065" key="7021da52-54ba-414d-9606-a0e4a2731d4e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2019-04-09T10:02:55" updateDate="2019-04-09T10:27:13" nodeName="Overview" urlName="overview" path="-1,1065" isDoc="" nodeType="1063" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="home" isPublished="true"><title><![CDATA[Oversigt]]></title></home>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1066,N'<guide id="1066" key="8a182883-7e24-4e35-be1a-69e807dd0062" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2019-04-09T10:04:03" updateDate="2019-04-09T10:27:00" nodeName="Guide" urlName="guide" path="-1,1065,1066" isDoc="" nodeType="1061" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="guide" isPublished="true">
  <title><![CDATA[Vejledning]]></title>
</guide>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1071,N'<contentBoxPage id="1071" key="af5ba885-8ea1-470e-8c07-fd31fcea28dc" parentID="1066" level="3" creatorID="0" sortOrder="0" createDate="2019-04-09T10:26:10" updateDate="2019-04-09T10:26:10" nodeName="About program" urlName="about-program" path="-1,1065,1066,1071" isDoc="" nodeType="1069" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="contentBoxPage" isPublished="true">
  <heading><![CDATA[Om programmet]]></heading>
</contentBoxPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1097,N'<exercise id="1097" key="1b0dfcb0-c3cb-4400-a6bb-9723d0a5f343" parentID="1093" level="4" creatorID="0" sortOrder="0" createDate="2019-04-11T11:41:31" updateDate="2019-04-21T13:18:26" nodeName="Exercise 1" urlName="exercise-1" path="-1,1065,1066,1093,1097" isDoc="" nodeType="1087" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercise" isPublished="true"><body><![CDATA[<p>Lorem ipsum</p>]]></body><intro><![CDATA[Udføres uge 1-4]]></intro><number>1</number><heading><![CDATA[Kropsholdning]]></heading></exercise>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1073,N'<contentBoxPage id="1073" key="a2c82e34-4a27-446b-9c26-51bf6ed991a8" parentID="1066" level="3" creatorID="0" sortOrder="2" createDate="2019-04-09T10:26:50" updateDate="2019-04-09T10:26:50" nodeName="About training" urlName="about-training" path="-1,1065,1066,1073" isDoc="" nodeType="1069" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="contentBoxPage" isPublished="true">
  <heading><![CDATA[Om træningsdagbogen]]></heading>
</contentBoxPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1077,N'<simpleBox id="1077" key="dd4a9fb3-c395-4db6-9c44-dd55a3a5b29b" parentID="1071" level="4" creatorID="0" sortOrder="0" createDate="2019-04-09T10:52:21" updateDate="2019-04-09T10:53:52" nodeName="How does the program work?" urlName="how-does-the-program-work" path="-1,1065,1066,1071,1077" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true">
  <body><![CDATA[<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>]]></body>
  <title><![CDATA[Hvordan virker programmet?]]></title>
</simpleBox>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1078,N'<simpleBox id="1078" key="51040a79-7abd-4fb1-b06d-3047907b8f89" parentID="1071" level="4" creatorID="0" sortOrder="1" createDate="2019-04-09T10:53:17" updateDate="2019-04-09T10:53:46" nodeName="General recommendations" urlName="general-recommendations" path="-1,1065,1066,1071,1078" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true">
  <body><![CDATA[<p>Træning regelmæssigt er lige så vigtig som en sund livsstil, og der er ikke nogen grund til at folk med hypermobile led ikke skal træne. Men finder du ud af, at visse sportsgrene eller øvelser giver anledning til smerter, bør du stoppe disse aktiviteter, indtil du ved hvorfor symptomerne opstår. Med de rigtige styrkeøvelser kan det være muligt at vende tilbage til de bestemte aktiviteter uden at øge symptomerne.</p>
<p>Kontrolleret styrketræning og holdningsøvelser kan derfor være godt for kroppen.</p>]]></body>
  <title><![CDATA[Generelle anbefalinger]]></title>
</simpleBox>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1085,N'<login id="1085" key="f3e29d38-b828-4524-8b5f-08f09f5b76a8" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2019-04-10T20:45:56" updateDate="2019-04-21T13:58:29" nodeName="Login" urlName="login" path="-1,1065,1085" isDoc="" nodeType="1083" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="login" isPublished="true"><title><![CDATA[Log ind]]></title><loginButtonText><![CDATA[Log ind]]></loginButtonText><codePlaceholder><![CDATA[Indtast din brugerkode]]></codePlaceholder><applicationName><![CDATA[SDU Træningsprogram]]></applicationName><instructions><![CDATA[Log ind med den kode du fik udleveret i din e-Boks.]]></instructions></login>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1093,N'<exercises id="1093" key="30ef99ce-9043-42a1-b5f3-71b690c0c5be" parentID="1066" level="3" creatorID="0" sortOrder="1" createDate="2019-04-11T10:36:11" updateDate="2019-04-21T13:18:30" nodeName="Exercises" urlName="exercises" path="-1,1065,1066,1093" isDoc="" nodeType="1089" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercises" isPublished="true"><heading><![CDATA[Øvelser]]></heading></exercises>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1101,N'<guideIntro id="1101" key="d87cc5c9-6eae-4be3-a044-5755ab397726" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2019-04-21T13:08:43" updateDate="2019-04-21T14:09:43" nodeName="Guide Intro" urlName="guide-intro" path="-1,1065,1101" isDoc="" nodeType="1100" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="guideIntro" isPublished="true"><title><![CDATA[Vejledning]]></title><nextButtonText><![CDATA[Videre]]></nextButtonText></guideIntro>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1102,N'<simpleBox id="1102" key="1bfb7e3a-6635-498b-bd7c-055422a5da17" parentID="1101" level="3" creatorID="0" sortOrder="0" createDate="2019-04-21T13:09:49" updateDate="2019-04-21T13:10:50" nodeName="Read through" urlName="read-through" path="-1,1065,1101,1102" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><subheading><![CDATA[Læs denne vejledning igennem inden du påbegynder dit træningsprogram.]]></subheading><isImportant>1</isImportant><body><![CDATA[<p>Du kan altid finde vejledningen igen, når du får brug for den på et senere tidspunkt.</p>]]></body></simpleBox>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1103,N'<simpleBox id="1103" key="0d777818-7f9f-400a-84b8-221dd7b44792" parentID="1101" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T13:11:33" updateDate="2019-04-21T14:09:55" nodeName="How does the program work" urlName="how-does-the-program-work" path="-1,1065,1101,1103" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><subheading><![CDATA[Hvordan virker programmet?]]></subheading><isImportant>0</isImportant><body><![CDATA[<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>]]></body></simpleBox>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1108,N'<trainingOverview id="1108" key="99c11896-4c17-4c0d-a16c-031711784844" parentID="1065" level="2" creatorID="0" sortOrder="3" createDate="2019-04-21T14:10:31" updateDate="2019-04-21T14:10:31" nodeName="Training" urlName="training" path="-1,1065,1108" isDoc="" nodeType="1104" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingOverview" isPublished="true"><title><![CDATA[Træning]]></title></trainingOverview>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1109,N'<trainingDiary id="1109" key="9f222e2d-f6d9-4e0a-9217-6eaad912d7ca" parentID="1108" level="3" creatorID="0" sortOrder="0" createDate="2019-04-21T14:10:55" updateDate="2019-04-21T14:10:55" nodeName="Training Diary" urlName="training-diary" path="-1,1065,1108,1109" isDoc="" nodeType="1106" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingDiary" isPublished="true"><title><![CDATA[Træningsdagbog]]></title></trainingDiary>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1110,N'<trainingSurvey id="1110" key="fb55fb0e-aee4-4ce8-93ad-e04283aa8797" parentID="1108" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T14:11:11" updateDate="2019-04-25T13:29:08" nodeName="Training Survey" urlName="training-survey" path="-1,1065,1108,1110" isDoc="" nodeType="1105" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingSurvey" isPublished="true"><title><![CDATA[Spørgeskema]]></title><painLowestLabel><![CDATA[Ingen smerter]]></painLowestLabel><painHeading><![CDATA[Generelle skuldersmerter]]></painHeading><painLowSubheading><![CDATA[LAVESTE skuldersmerteniveau du har haft samlet set over den sidste uge]]></painLowSubheading><painQuestion><![CDATA[Hvis du samlet skal beskrive hvordan dine generelle skuldersmerter har været over den sidste uge, hvordan har du da haft det? ]]></painQuestion><painInformationBody><![CDATA[I de 3 nedenstående smerteskaler skal du beskrive dine skuldersmerter over den sidste uge når de har været lavest, når de  har været højest og det gennemsnitlige smerteniveau.]]></painInformationBody><painHighSubheading><![CDATA[HØJESTE  skuldersmerteniveau du har haft samlet set over den sidste uge]]></painHighSubheading><painHighestLabel><![CDATA[Værst tænkelige smerter]]></painHighestLabel><painInformationHelp><![CDATA[Hjælp til vurdering af smerter]]></painInformationHelp><painAverageSubheading><![CDATA[GENNEMSNITLIGE  skuldersmerte- niveau du har haft samlet set over den sidste uge]]></painAverageSubheading><surveyInformation><![CDATA[Spørgsmålene i dette spørgeskema omhandler dine smerter, dit forbrug af smertestillende medicin, sygedage og eventuel supplerende behandling for dine skuldergener inden for de sidste 7 dage.]]></surveyInformation><enterPiecesPlaceholder><![CDATA[Indtast antal]]></enterPiecesPlaceholder><medicationTypeAmountSubheading><![CDATA[Hvilket form for smertestillende har du taget og antal over den sidste uge?]]></medicationTypeAmountSubheading><daysOnMedicationSubheading><![CDATA[Hvor mange dage har du taget smertestillende for din skulder over den sidste uge?]]></daysOnMedicationSubheading><ipren200Label><![CDATA[Ipren/Ibumetin, 200 mg]]></ipren200Label><hasTakenMedicationSubheading><![CDATA[Har du over den sidste uge taget smertestillende medicin pga. din skulder?]]></hasTakenMedicationSubheading><pamol500Label><![CDATA[Pamol/Panodil, 500 mg]]></pamol500Label><medicationHeading><![CDATA[Smertestillende]]></medicationHeading><otherMedicationTypePlaceholder><![CDATA[Indtast type af medicin]]></otherMedicationTypePlaceholder><otherMedicationAmountLabel><![CDATA[Hvilken mængde?]]></otherMedicationAmountLabel><ipren600Label><![CDATA[Ipren/Ibumetin, 600 mg]]></ipren600Label><otherMedicationTypeLabel><![CDATA[Hvilken type medicin?]]></otherMedicationTypeLabel><otherLabel><![CDATA[Andet]]></otherLabel><otherMedicationAmountPlaceholder><![CDATA[Indtast antal]]></otherMedicationAmountPlaceholder><sicknessHeading><![CDATA[Sygefravær pga. skulderen]]></sicknessHeading><daysSickSubheading><![CDATA[Har du over den sidste uge haft nogen sygedage pga. din skulder?]]></daysSickSubheading><otherTreatmentPlaceholder><![CDATA[Hvilken behandling?]]></otherTreatmentPlaceholder><chiropractorLabel><![CDATA[Kiropraktor]]></chiropractorLabel><complimentaryTreatmentInformation><![CDATA[Supplerende behandling udover den du modtager som del af projektet.]]></complimentaryTreatmentInformation><complimentaryTreatmentsSubheading><![CDATA[Har du over den sidste uge modtaget én af følgende behandlinger ud over  det du modtager som en del af projektet?]]></complimentaryTreatmentsSubheading><physiotherapyLabel><![CDATA[Fysioterapi]]></physiotherapyLabel><acupunctureLabel><![CDATA[Akupunktur]]></acupunctureLabel><complimentaryTreatmentHeading><![CDATA[Supplerende behandling]]></complimentaryTreatmentHeading><massageLabel><![CDATA[Massage]]></massageLabel><hasSeenDoctorSubheading><![CDATA[Har du over den sidste uge opsøgt læge pga. din skulder?]]></hasSeenDoctorSubheading></trainingSurvey>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1133,N'<usersDirectory id="1133" key="534fb067-c741-44de-82d8-5c9d85bdaadb" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2019-04-22T13:41:57" updateDate="2019-04-22T13:41:57" nodeName="Users" urlName="users" path="-1,1133" isDoc="" nodeType="1132" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="usersDirectory" isPublished="true" />');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1135,N'<userA id="1135" key="c9a4163d-abc9-495f-9a16-1eb175a8592d" parentID="1133" level="2" creatorID="0" sortOrder="0" createDate="2019-04-22T13:44:32" updateDate="2019-04-22T13:44:32" nodeName="13685" urlName="13685" path="-1,1133,1135" isDoc="" nodeType="1130" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="userA" isPublished="true"><autheticationCode><![CDATA[13685]]></autheticationCode></userA>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1138,N'<submissionsDirectory id="1138" key="aca88fe8-6b4f-481a-9ca0-1b72eeab376a" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2019-04-22T14:06:35" updateDate="2019-04-22T14:06:35" nodeName="Submissions" urlName="submissions" path="-1,1138" isDoc="" nodeType="1129" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="submissionsDirectory" isPublished="true" />');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1154,N'<groupASurvey id="1154" key="d90ff2bb-d2b2-4bca-b37b-2ef76e62d66c" parentID="1138" level="2" creatorID="0" sortOrder="0" createDate="2019-04-23T12:15:29" updateDate="2019-04-26T14:30:48" nodeName="13685-23-04-2019-A-Survey" urlName="13685-23-04-2019-a-survey" path="-1,1138,1154" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>1</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[umb://document/c9a4163dabc9495f9a161eb175a8592d]]></user></groupASurvey>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1157,N'<groupASurvey id="1157" key="647d9437-5944-4033-8fc3-ffc233a75e7a" parentID="1138" level="2" creatorID="0" sortOrder="1" createDate="2019-04-25T13:06:39" updateDate="2019-04-25T13:06:39" nodeName="13685-25-04-2019-A-Survey" urlName="13685-25-04-2019-a-survey" path="-1,1138,1157" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-25T00:00:00</date><user><![CDATA[13685]]></user></groupASurvey>');
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (1,-49,N'Umbraco.TrueFalse',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (2,-51,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (3,-87,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (4,-88,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (5,-89,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (6,-90,N'Umbraco.UploadField',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (7,-92,N'Umbraco.NoEdit',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (8,-36,N'Umbraco.DateTime',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (9,-37,N'Umbraco.ColorPickerAlias',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (11,-39,N'Umbraco.DropDown.Flexible',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (12,-40,N'Umbraco.RadioButtonList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (13,-41,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (14,-42,N'Umbraco.DropDown.Flexible',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (15,-43,N'Umbraco.CheckBoxList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (22,1041,N'Umbraco.Tags',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (24,1043,N'Umbraco.ImageCropper',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-26,-95,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-27,-96,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (-28,-97,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (26,1046,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (27,1047,N'Umbraco.MemberPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (28,1048,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (29,1049,N'Umbraco.MediaPicker2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (30,1050,N'Umbraco.RelatedLinks2',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (40,1060,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (41,1068,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (42,1074,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (43,1076,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (44,1079,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (45,1080,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (46,1081,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (47,1082,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (48,1086,N'Umbraco.Decimal',N'Decimal');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (64,1134,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (50,1095,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (51,1096,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (65,1136,N'Umbraco.ContentPicker2',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (53,1114,N'Umbraco.Slider',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (66,1155,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (55,1116,N'Umbraco.Slider',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (56,1118,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (57,1119,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (58,1120,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (59,1121,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (60,1123,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (67,1156,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (62,1126,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (63,1127,N'Umbraco.TextboxMultiple',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (5,1041,N'Json',0,N'storageType');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-1,-97,N'10',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-2,-97,N'username',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-3,-97,N'asc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-4,-97,N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]',4,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-5,-96,N'100',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-6,-96,N'updateDate',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-7,-96,N'desc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-8,-96,N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]',4,N'layouts');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (-9,-96,N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]',5,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (6,1049,N'1',0,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (7,-42,N'0',0,N'multiple');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (8,-39,N'1',0,N'multiple');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (10,1060,N'32',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (118,1068,N'256',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (124,1074,N'256',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (13,1076,N'{
  "toolbar": [
    "removeformat",
    "undo",
    "redo",
    "cut",
    "copy",
    "paste",
    "styleselect",
    "bold",
    "italic",
    "underline",
    "strikethrough",
    "alignleft",
    "aligncenter",
    "alignright",
    "alignjustify",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "link",
    "unlink",
    "anchor",
    "umbmediapicker",
    "umbmacro",
    "umbembeddialog",
    "hr",
    "subscript",
    "superscript"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (14,1076,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (15,1079,N'64',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (16,1080,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (126,1081,N'64',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (123,1082,N'32',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (20,1086,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (21,1086,N'1',2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (22,1086,N'64',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (24,1095,N'1024',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (25,1095,N'5',2,N'rows');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (26,1096,N'{
  "toolbar": [
    "removeformat",
    "undo",
    "redo",
    "cut",
    "copy",
    "paste",
    "styleselect",
    "bold",
    "italic",
    "underline",
    "strikethrough",
    "alignleft",
    "aligncenter",
    "alignright",
    "alignjustify",
    "bullist",
    "numlist",
    "outdent",
    "indent",
    "subscript",
    "superscript",
    "charmap"
  ],
  "stylesheets": [],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',1,N'editor');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (27,1096,N'0',2,N'hideLabel');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (105,1134,N'32',1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (108,1136,N'0',1,N'showOpenButton');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (49,1114,N'0',1,N'enableRange');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (50,1114,N'horizontal',2,N'orientation');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (51,1114,N'1',3,N'initVal1');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (52,1114,NULL,4,N'initVal2');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (53,1114,N'1',5,N'minVal');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (54,1114,N'10',6,N'maxVal');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (55,1114,N'1',7,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (56,1114,NULL,8,N'precision');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (57,1114,NULL,9,N'handle');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (58,1114,N'show',10,N'tooltip');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (59,1114,N'0',11,N'tooltipSplit');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (60,1114,N'{0}',12,N'tooltipFormat');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (61,1114,NULL,13,N'tooltipPosition');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (62,1114,N'0',14,N'reversed');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (63,1114,NULL,15,N'ticks');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (64,1114,NULL,16,N'ticksPositions');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (65,1114,NULL,17,N'ticksLabels');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (66,1114,NULL,18,N'ticksSnapBounds');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (103,1127,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (104,1127,NULL,2,N'rows');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (69,1116,N'0',1,N'enableRange');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (70,1116,N'horizontal',2,N'orientation');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (71,1116,N'0',3,N'initVal1');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (72,1116,NULL,4,N'initVal2');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (73,1116,N'0',5,N'minVal');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (74,1116,N'7',6,N'maxVal');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (75,1116,N'1',7,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (76,1116,NULL,8,N'precision');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (77,1116,NULL,9,N'handle');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (78,1116,N'show',10,N'tooltip');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (79,1116,N'0',11,N'tooltipSplit');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (80,1116,N'{0}',12,N'tooltipFormat');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (81,1116,NULL,13,N'tooltipPosition');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (82,1116,N'0',14,N'reversed');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (83,1116,NULL,15,N'ticks');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (84,1116,NULL,16,N'ticksPositions');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (85,1116,NULL,17,N'ticksLabels');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (86,1116,NULL,18,N'ticksSnapBounds');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (90,1118,N'1',1,N'min');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (91,1118,N'1',2,N'step');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (92,1118,N'48',3,N'max');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (93,1119,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (94,1120,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (95,1121,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (110,1123,N'DD-MM-YYYY',1,N'format');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (109,1136,N'umb://document/534fb067c74144de82d85c9d85bdaadb',2,N'startNodeId');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (99,1126,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (100,1126,NULL,2,N'rows');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (111,1123,N'1',2,N'defaultEmpty');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (121,1155,NULL,1,N'maxChars');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (122,1155,NULL,2,N'rows');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (125,1156,NULL,1,N'maxChars');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1065,0,0,'ed0b1adb-f05a-4f1e-8f3d-66763303c624',N'Oversigt',NULL,NULL,{ts '2019-04-09 10:02:55.510'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1066,0,0,'4208b58d-bea2-4c32-8f7f-685815ac4e99',N'Vejledning',NULL,NULL,{ts '2019-04-09 10:04:03.353'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1066,0,0,'cb74c60d-c135-4977-aa9e-2afea4d2c848',N'Guide',NULL,NULL,{ts '2019-04-09 10:06:16.710'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1071,1,0,'608ce508-8f97-48f3-aaf8-7f605e86ae4f',N'About program',NULL,NULL,{ts '2019-04-09 10:26:10.283'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1072,0,0,'a2a30b40-1124-4ad2-a481-9d72b0cefd9d',N'Exercises',NULL,NULL,{ts '2019-04-09 10:26:28.410'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1073,1,0,'37de678b-a2ea-4087-9867-5129b0964997',N'About training',NULL,NULL,{ts '2019-04-09 10:26:50.580'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1066,1,0,'a17b3c3b-e560-48a4-9685-6cd0cdaa9130',N'Guide',NULL,NULL,{ts '2019-04-09 10:27:00.540'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1065,1,0,'7495b6c1-e670-4ad0-94c2-989fc71d40f3',N'Overview',NULL,NULL,{ts '2019-04-09 10:27:13.707'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1077,1,0,'0d990451-9edb-49c8-a9a5-89c44f183d9d',N'How does the program work?',NULL,NULL,{ts '2019-04-09 10:53:52.320'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1078,0,0,'9cc76e30-af8f-457b-aff4-2c635cd4bfe7',N'General recommendations',NULL,NULL,{ts '2019-04-09 10:53:17.997'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1078,1,0,'5aa34b8b-6185-4224-9adc-f7ea7e9b580c',N'General recommendations',NULL,NULL,{ts '2019-04-09 10:53:46.620'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1084,0,0,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',N'Login',NULL,NULL,{ts '2019-04-10 20:24:13.157'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1084,0,0,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',N'Login',NULL,NULL,{ts '2019-04-10 20:32:19.303'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1084,0,0,'99c295cc-0c8d-428f-9e40-22101e968622',N'Login',NULL,NULL,{ts '2019-04-10 20:32:19.363'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1085,0,0,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',N'Login',NULL,NULL,{ts '2019-04-10 20:45:56.890'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1093,0,0,'b1a59788-0947-48dc-8985-fa47f70409ca',N'Exercises (1)',NULL,NULL,{ts '2019-04-11 10:36:11.367'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1072,0,0,'05728fed-4e38-4483-9387-4ce906173b8b',N'Exercises',NULL,NULL,{ts '2019-04-11 10:36:18.603'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1072,0,0,'3a61df9c-c1ac-4b49-bdd4-048ce397d02b',N'Exercises',NULL,NULL,{ts '2019-04-11 10:36:18.627'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1093,0,0,'489bbff2-90eb-4bb1-a48c-06f297c00332',N'Exercises',NULL,NULL,{ts '2019-04-11 10:36:47.957'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1093,1,0,'546f9d52-694c-47c9-b42d-2126a768cd9b',N'Exercises',NULL,NULL,{ts '2019-04-21 13:18:30.977'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1097,1,0,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',N'Exercise 1',NULL,NULL,{ts '2019-04-21 13:18:26.487'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1101,0,0,'363d3eff-fc10-4039-8b77-0eb3ddce60ed',N'Guide Intro',NULL,NULL,{ts '2019-04-21 13:08:43.363'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1102,0,0,'7a30fc8d-ef7c-441b-8ef4-b6d32f168a5a',N'Read through',NULL,NULL,{ts '2019-04-21 13:09:49.310'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1102,1,0,'68d04a58-cbad-4293-b309-0d4f675d5ed9',N'Read through',NULL,NULL,{ts '2019-04-21 13:10:50.447'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1103,0,0,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',N'How does to program work',NULL,NULL,{ts '2019-04-21 13:11:33.150'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1085,1,0,'c1be7205-3171-4d08-afbd-9a4dd738696d',N'Login',NULL,NULL,{ts '2019-04-21 13:58:29.793'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1101,1,0,'d7062020-04e5-439e-8cbd-271271d5e086',N'Guide Intro',NULL,NULL,{ts '2019-04-21 14:09:43.467'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1103,1,0,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',N'How does the program work',NULL,NULL,{ts '2019-04-21 14:09:55.347'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1108,1,0,'81a60f88-67ed-4522-ab6a-8bc80ee79c52',N'Training',NULL,NULL,{ts '2019-04-21 14:10:31.473'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1109,1,0,'1594b85e-6cca-45c5-ace0-d024c7cd351e',N'Training Diary',NULL,NULL,{ts '2019-04-21 14:10:55.340'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1110,0,0,'92357437-57d3-4d39-a66a-6264f5d838fb',N'Survey',NULL,NULL,{ts '2019-04-21 14:11:11.960'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1133,1,0,'a2763692-e746-4b0d-89bf-0f4493ebb0d7',N'Users',NULL,NULL,{ts '2019-04-22 13:41:57.787'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1135,1,0,'d8415c10-041c-4740-b2fd-8090e57697f3',N'13685',NULL,NULL,{ts '2019-04-22 13:44:32.973'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1138,1,0,'6b0e6f1e-fb98-4d08-96e3-0181898ce554',N'Submissions',NULL,NULL,{ts '2019-04-22 14:06:35.413'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1139,0,0,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',N'13685-22-04-2019-A-Survey',NULL,NULL,{ts '2019-04-22 14:09:55.310'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1139,0,0,'2945df94-904e-49cf-b074-ccb60d45bd6f',N'13685-22-04-2019-A-Survey',NULL,NULL,{ts '2019-04-22 14:48:17.830'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1140,0,0,'48de405d-67d8-43c8-9c4d-003e703d9216',N'Glen´s content',NULL,NULL,{ts '2019-04-22 14:26:44.717'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1141,0,0,'a4dabd7b-876d-492d-af14-1497d8639f8b',N'Glen´s content (1)',NULL,NULL,{ts '2019-04-22 14:37:44.317'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1142,0,0,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',N'Glen´s content (2)',NULL,NULL,{ts '2019-04-22 15:05:10.687'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1143,0,0,'58ede83f-be59-4ffc-8982-e1e30678a97e',N'Glen´s content (3)',NULL,NULL,{ts '2019-04-22 15:05:52.853'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1144,0,0,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',N'Glen´s content (4)',NULL,NULL,{ts '2019-04-22 15:07:46.390'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1145,0,0,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',N'Kurt',NULL,NULL,{ts '2019-04-22 15:20:14.660'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1146,0,0,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',N'testwhere',NULL,NULL,{ts '2019-04-23 10:15:36.377'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1147,0,0,'ca336733-37ad-4646-92ba-54d7640c4255',N'testwhere2',NULL,NULL,{ts '2019-04-23 10:16:44.507'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1148,0,0,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',N'testwhere2 (1)',NULL,NULL,{ts '2019-04-23 10:34:55.910'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1149,0,0,'e2a72aea-e134-47ad-b666-ef0db1449652',N'test3',NULL,NULL,{ts '2019-04-23 10:37:27.103'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1150,0,0,'444bbf02-ec88-49d3-95fa-11b32fea40e7',N'test3 (1)',NULL,NULL,{ts '2019-04-23 11:49:06.737'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1151,0,0,'a86c74da-7f93-433c-a289-e429121e73f1',N'98537-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 11:51:04.540'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1152,0,0,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',N'13685-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 11:55:38.090'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1153,0,0,'a6784aa3-636d-4120-b08e-d2a96ae768df',N'13685-23-04-2019-A-Survey (1)',NULL,NULL,{ts '2019-04-23 11:58:00.183'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1139,0,0,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',N'13685-22-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:08:12.300'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1139,0,0,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',N'13685-22-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:08:12.367'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1140,0,0,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',N'Glen´s content',NULL,NULL,{ts '2019-04-23 12:08:18.323'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1141,0,0,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',N'Glen´s content (1)',NULL,NULL,{ts '2019-04-23 12:08:23.667'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1142,0,0,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',N'Glen´s content (2)',NULL,NULL,{ts '2019-04-23 12:08:28.713'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1142,0,0,'4b4dd7bc-c26b-4fdb-828f-886575006e52',N'Glen´s content (2)',NULL,NULL,{ts '2019-04-23 12:08:28.747'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1143,0,0,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',N'Glen´s content (3)',NULL,NULL,{ts '2019-04-23 12:08:34.120'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1143,0,0,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',N'Glen´s content (3)',NULL,NULL,{ts '2019-04-23 12:08:34.150'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1144,0,0,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',N'Glen´s content (4)',NULL,NULL,{ts '2019-04-23 12:08:41.870'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1144,0,0,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',N'Glen´s content (4)',NULL,NULL,{ts '2019-04-23 12:08:41.897'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1145,0,0,'b16cb84f-9238-4978-bf9a-79a7e9266d26',N'Kurt',NULL,NULL,{ts '2019-04-23 12:08:47.917'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1145,0,0,'582dff84-3fab-415d-b229-5de612bff936',N'Kurt',NULL,NULL,{ts '2019-04-23 12:08:47.943'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1146,0,0,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',N'testwhere',NULL,NULL,{ts '2019-04-23 12:08:53.850'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1146,0,0,'b98293ff-05d8-42eb-b324-7cff32da6798',N'testwhere',NULL,NULL,{ts '2019-04-23 12:08:53.880'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1147,0,0,'7a6ec024-c17a-473d-bd57-53179e6ca938',N'testwhere2',NULL,NULL,{ts '2019-04-23 12:08:59.357'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1147,0,0,'627032a9-f9df-4d9a-987e-d114a176ef7f',N'testwhere2',NULL,NULL,{ts '2019-04-23 12:08:59.387'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1148,0,0,'14919419-780f-4348-bcb3-8e8723aa52f3',N'testwhere2 (1)',NULL,NULL,{ts '2019-04-23 12:09:05.417'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1148,0,0,'1bbad188-05eb-4976-a1c5-0883ac207817',N'testwhere2 (1)',NULL,NULL,{ts '2019-04-23 12:09:05.440'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1149,0,0,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',N'test3',NULL,NULL,{ts '2019-04-23 12:09:11.787'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1149,0,0,'931027ae-8141-4103-b287-10ddf6c2ce7e',N'test3',NULL,NULL,{ts '2019-04-23 12:09:11.833'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1150,0,0,'ac8e540e-c162-4cbf-910b-6994a398230d',N'test3 (1)',NULL,NULL,{ts '2019-04-23 12:09:18.053'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1150,0,0,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',N'test3 (1)',NULL,NULL,{ts '2019-04-23 12:09:18.087'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1151,0,0,'192817e8-d708-431f-a2e7-298364ad4df0',N'98537-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:09:24.597'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1151,0,0,'2ab87c0c-f101-4a24-a910-702ef663b52d',N'98537-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:09:24.623'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1152,0,0,'1842731c-7eb9-47a0-b231-da45e9bc6276',N'13685-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:09:30.197'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1152,0,0,'ede19a05-be9f-4bda-bba3-896bc9b651a9',N'13685-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:09:30.227'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1153,0,0,'2e7c8058-f731-4fdb-8873-ada898846d1f',N'13685-23-04-2019-A-Survey (1)',NULL,NULL,{ts '2019-04-23 12:09:36.873'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1153,0,0,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',N'13685-23-04-2019-A-Survey (1)',NULL,NULL,{ts '2019-04-23 12:09:36.903'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1154,0,0,'50237dae-576e-4e82-a469-765ea7e30491',N'13685-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-23 12:15:29.287'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1110,0,0,'64d9c2b0-55c2-4c17-b191-295bbade0b41',N'Training Survey',NULL,NULL,{ts '2019-04-23 12:53:52.527'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1157,1,0,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',N'13685-25-04-2019-A-Survey',NULL,NULL,{ts '2019-04-25 13:06:39.407'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1110,0,0,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',N'Training Survey',NULL,NULL,{ts '2019-04-25 13:27:20.957'},NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1110,1,0,'10657818-6709-43f7-9a32-73acfdfc38a2',N'Training Survey',NULL,NULL,{ts '2019-04-25 13:29:08.300'},NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (1154,1,0,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',N'13685-23-04-2019-A-Survey',NULL,NULL,{ts '2019-04-26 14:30:48.467'},NULL,1);
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsMemberType] ON;
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (1,1044,50,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (2,1044,51,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (3,1044,28,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (4,1044,29,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (5,1044,30,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (6,1044,31,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (7,1044,32,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (8,1044,33,0,0,0);
GO
INSERT INTO [cmsMemberType] ([pk],[NodeId],[propertytypeId],[memberCanEdit],[viewOnProfile],[isSensitive]) VALUES (9,1044,34,0,0,0);
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1065,'ed0b1adb-f05a-4f1e-8f3d-66763303c624',{ts '2019-04-09 10:02:55.530'},N'<home id="1065" key="7021da52-54ba-414d-9606-a0e4a2731d4e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2019-04-09T10:02:55" updateDate="2019-04-09T10:02:55" nodeName="Oversigt" urlName="oversigt" path="-1,1065" isDoc="" nodeType="1063" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="home" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1066,'4208b58d-bea2-4c32-8f7f-685815ac4e99',{ts '2019-04-09 10:04:03.363'},N'<page id="1066" key="8a182883-7e24-4e35-be1a-69e807dd0062" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2019-04-09T10:04:03" updateDate="2019-04-09T10:04:03" nodeName="Vejledning" urlName="vejledning" path="-1,1065,1066" isDoc="" nodeType="1061" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="page" isPublished="true"><title><![CDATA[Vejledning]]></title></page>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1066,'cb74c60d-c135-4977-aa9e-2afea4d2c848',{ts '2019-04-09 10:06:16.730'},N'<page id="1066" key="8a182883-7e24-4e35-be1a-69e807dd0062" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2019-04-09T10:04:03" updateDate="2019-04-09T10:06:16" nodeName="Guide" urlName="guide" path="-1,1065,1066" isDoc="" nodeType="1061" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="page" isPublished="true"><title><![CDATA[Vejledning]]></title></page>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1071,'608ce508-8f97-48f3-aaf8-7f605e86ae4f',{ts '2019-04-09 10:26:10.307'},N'<subPage id="1071" key="af5ba885-8ea1-470e-8c07-fd31fcea28dc" parentID="1066" level="3" creatorID="0" sortOrder="0" createDate="2019-04-09T10:26:10" updateDate="2019-04-09T10:26:10" nodeName="About program" urlName="about-program" path="-1,1065,1066,1071" isDoc="" nodeType="1069" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="subPage" isPublished="true"><heading><![CDATA[Om programmet]]></heading></subPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1072,'a2a30b40-1124-4ad2-a481-9d72b0cefd9d',{ts '2019-04-09 10:26:28.423'},N'<subPage id="1072" key="13125c61-b4b4-4938-899d-9837c736e68f" parentID="1066" level="3" creatorID="0" sortOrder="1" createDate="2019-04-09T10:26:28" updateDate="2019-04-09T10:26:28" nodeName="Exercises" urlName="exercises" path="-1,1065,1066,1072" isDoc="" nodeType="1069" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="subPage" isPublished="true"><heading><![CDATA[Øvelser]]></heading></subPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1073,'37de678b-a2ea-4087-9867-5129b0964997',{ts '2019-04-09 10:26:50.590'},N'<subPage id="1073" key="a2c82e34-4a27-446b-9c26-51bf6ed991a8" parentID="1066" level="3" creatorID="0" sortOrder="2" createDate="2019-04-09T10:26:50" updateDate="2019-04-09T10:26:50" nodeName="About training" urlName="about-training" path="-1,1065,1066,1073" isDoc="" nodeType="1069" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="subPage" isPublished="true"><heading><![CDATA[Om træningsdagbogen]]></heading></subPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1066,'a17b3c3b-e560-48a4-9685-6cd0cdaa9130',{ts '2019-04-09 10:27:00.557'},N'<page id="1066" key="8a182883-7e24-4e35-be1a-69e807dd0062" parentID="1065" level="2" creatorID="0" sortOrder="0" createDate="2019-04-09T10:04:03" updateDate="2019-04-09T10:27:00" nodeName="Guide" urlName="guide" path="-1,1065,1066" isDoc="" nodeType="1061" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="page" isPublished="true"><title><![CDATA[Vejledning]]></title></page>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1065,'7495b6c1-e670-4ad0-94c2-989fc71d40f3',{ts '2019-04-09 10:27:13.720'},N'<home id="1065" key="7021da52-54ba-414d-9606-a0e4a2731d4e" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2019-04-09T10:02:55" updateDate="2019-04-09T10:27:13" nodeName="Overview" urlName="overview" path="-1,1065" isDoc="" nodeType="1063" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="home" isPublished="true"><title><![CDATA[Oversigt]]></title></home>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1077,'0d990451-9edb-49c8-a9a5-89c44f183d9d',{ts '2019-04-09 10:53:52.327'},N'<contentBox id="1077" key="dd4a9fb3-c395-4db6-9c44-dd55a3a5b29b" parentID="1071" level="4" creatorID="0" sortOrder="0" createDate="2019-04-09T10:52:21" updateDate="2019-04-09T10:53:52" nodeName="How does the program work?" urlName="how-does-the-program-work" path="-1,1065,1066,1071,1077" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="contentBox" isPublished="true"><body><![CDATA[<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>]]></body><title><![CDATA[Hvordan virker programmet?]]></title></contentBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1078,'9cc76e30-af8f-457b-aff4-2c635cd4bfe7',{ts '2019-04-09 10:53:18.017'},N'<contentBox id="1078" key="51040a79-7abd-4fb1-b06d-3047907b8f89" parentID="1071" level="4" creatorID="0" sortOrder="1" createDate="2019-04-09T10:53:17" updateDate="2019-04-09T10:53:17" nodeName="General recommendations" urlName="general-recommendations" path="-1,1065,1066,1071,1078" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="contentBox" isPublished="true"><body><![CDATA[<p>Træning regelmæssigt er lige så vigtig som en sund livsstil, og der er ikke nogen<br />grund til at folk med hypermobile led ikke skal træne. Men finder du ud af, at<br />visse sportsgrene eller øvelser giver anledning til smerter, bør du stoppe disse<br />aktiviteter, indtil du ved hvorfor symptomerne opstår. Med de rigtige<br />styrkeøvelser kan det være muligt at vende tilbage til de bestemte aktiviteter<br />uden at øge symptomerne.</p>
<p>Kontrolleret styrketræning og holdningsøvelser kan derfor være godt for<br />kroppen.</p>]]></body><title><![CDATA[Generelle anbefalinger]]></title></contentBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1078,'5aa34b8b-6185-4224-9adc-f7ea7e9b580c',{ts '2019-04-09 10:53:46.637'},N'<contentBox id="1078" key="51040a79-7abd-4fb1-b06d-3047907b8f89" parentID="1071" level="4" creatorID="0" sortOrder="1" createDate="2019-04-09T10:53:17" updateDate="2019-04-09T10:53:46" nodeName="General recommendations" urlName="general-recommendations" path="-1,1065,1066,1071,1078" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="contentBox" isPublished="true"><body><![CDATA[<p>Træning regelmæssigt er lige så vigtig som en sund livsstil, og der er ikke nogen grund til at folk med hypermobile led ikke skal træne. Men finder du ud af, at visse sportsgrene eller øvelser giver anledning til smerter, bør du stoppe disse aktiviteter, indtil du ved hvorfor symptomerne opstår. Med de rigtige styrkeøvelser kan det være muligt at vende tilbage til de bestemte aktiviteter uden at øge symptomerne.</p>
<p>Kontrolleret styrketræning og holdningsøvelser kan derfor være godt for kroppen.</p>]]></body><title><![CDATA[Generelle anbefalinger]]></title></contentBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',{ts '2019-04-10 20:24:13.187'},N'<login id="1084" key="8cdb6763-a344-4679-a559-fd31cb6bc743" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2019-04-10T20:24:13" updateDate="2019-04-10T20:24:13" nodeName="Login" urlName="login" path="-1,1065,1084" isDoc="" nodeType="1083" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="login" isPublished="true"><loginButtonText><![CDATA[Log ind]]></loginButtonText><codePlaceholder><![CDATA[Indtast din brugerkode]]></codePlaceholder><title><![CDATA[Log ind]]></title><applicationName><![CDATA[SDU Træningsprogram]]></applicationName><instructions><![CDATA[Log ind med den kode du fik udleveret i din e-Boks.]]></instructions></login>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',{ts '2019-04-10 20:45:56.927'},N'<login id="1085" key="f3e29d38-b828-4524-8b5f-08f09f5b76a8" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2019-04-10T20:45:56" updateDate="2019-04-10T20:45:56" nodeName="Login" urlName="login" path="-1,1065,1085" isDoc="" nodeType="1083" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="login" isPublished="true"><loginButtonText><![CDATA[Log ind]]></loginButtonText><codePlaceholder><![CDATA[Indtast din brugerkode]]></codePlaceholder><title><![CDATA[Log ind]]></title><applicationName><![CDATA[SDU Træningsprogram]]></applicationName><instructions><![CDATA[Log ind med den kode du fik udleveret i din e-Boks.]]></instructions></login>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1093,'b1a59788-0947-48dc-8985-fa47f70409ca',{ts '2019-04-11 10:36:11.390'},N'<exercises id="1093" key="30ef99ce-9043-42a1-b5f3-71b690c0c5be" parentID="1066" level="3" creatorID="0" sortOrder="3" createDate="2019-04-11T10:36:11" updateDate="2019-04-11T10:36:11" nodeName="Exercises (1)" urlName="exercises-1" path="-1,1065,1066,1093" isDoc="" nodeType="1089" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercises" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1093,'489bbff2-90eb-4bb1-a48c-06f297c00332',{ts '2019-04-11 10:36:47.967'},N'<exercises id="1093" key="30ef99ce-9043-42a1-b5f3-71b690c0c5be" parentID="1066" level="3" creatorID="0" sortOrder="3" createDate="2019-04-11T10:36:11" updateDate="2019-04-11T10:36:47" nodeName="Exercises" urlName="exercises" path="-1,1065,1066,1093" isDoc="" nodeType="1089" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercises" isPublished="true"><heading><![CDATA[Øvelser]]></heading></exercises>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1093,'546f9d52-694c-47c9-b42d-2126a768cd9b',{ts '2019-04-21 13:18:30.983'},N'<exercises id="1093" key="30ef99ce-9043-42a1-b5f3-71b690c0c5be" parentID="1066" level="3" creatorID="0" sortOrder="1" createDate="2019-04-11T10:36:11" updateDate="2019-04-21T13:18:30" nodeName="Exercises" urlName="exercises" path="-1,1065,1066,1093" isDoc="" nodeType="1089" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercises" isPublished="true"><heading><![CDATA[Øvelser]]></heading></exercises>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',{ts '2019-04-21 13:18:26.517'},N'<exercise id="1097" key="1b0dfcb0-c3cb-4400-a6bb-9723d0a5f343" parentID="1093" level="4" creatorID="0" sortOrder="0" createDate="2019-04-11T11:41:31" updateDate="2019-04-21T13:18:26" nodeName="Exercise 1" urlName="exercise-1" path="-1,1065,1066,1093,1097" isDoc="" nodeType="1087" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="exercise" isPublished="true"><body><![CDATA[<p>Lorem ipsum</p>]]></body><intro><![CDATA[Udføres uge 1-4]]></intro><number>1</number><heading><![CDATA[Kropsholdning]]></heading></exercise>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1101,'363d3eff-fc10-4039-8b77-0eb3ddce60ed',{ts '2019-04-21 13:08:43.383'},N'<guideIntro id="1101" key="d87cc5c9-6eae-4be3-a044-5755ab397726" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2019-04-21T13:08:43" updateDate="2019-04-21T13:08:43" nodeName="Guide Intro" urlName="guide-intro" path="-1,1065,1101" isDoc="" nodeType="1100" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="guideIntro" isPublished="true"><title><![CDATA[Vejledning]]></title></guideIntro>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1102,'7a30fc8d-ef7c-441b-8ef4-b6d32f168a5a',{ts '2019-04-21 13:09:49.320'},N'<simpleBox id="1102" key="1bfb7e3a-6635-498b-bd7c-055422a5da17" parentID="1101" level="3" creatorID="0" sortOrder="0" createDate="2019-04-21T13:09:49" updateDate="2019-04-21T13:09:49" nodeName="Read through" urlName="read-through" path="-1,1065,1101,1102" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><isImportant>0</isImportant></simpleBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1102,'68d04a58-cbad-4293-b309-0d4f675d5ed9',{ts '2019-04-21 13:10:50.463'},N'<simpleBox id="1102" key="1bfb7e3a-6635-498b-bd7c-055422a5da17" parentID="1101" level="3" creatorID="0" sortOrder="0" createDate="2019-04-21T13:09:49" updateDate="2019-04-21T13:10:50" nodeName="Read through" urlName="read-through" path="-1,1065,1101,1102" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><subheading><![CDATA[Læs denne vejledning igennem inden du påbegynder dit træningsprogram.]]></subheading><isImportant>1</isImportant><body><![CDATA[<p>Du kan altid finde vejledningen igen, når du får brug for den på et senere tidspunkt.</p>]]></body></simpleBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1103,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',{ts '2019-04-21 13:11:33.160'},N'<simpleBox id="1103" key="0d777818-7f9f-400a-84b8-221dd7b44792" parentID="1101" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T13:11:33" updateDate="2019-04-21T13:11:33" nodeName="How does to program work" urlName="how-does-to-program-work" path="-1,1065,1101,1103" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><subheading><![CDATA[Hvordan virker programmet?]]></subheading><isImportant>0</isImportant><body><![CDATA[<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>]]></body></simpleBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',{ts '2019-04-21 13:58:29.833'},N'<login id="1085" key="f3e29d38-b828-4524-8b5f-08f09f5b76a8" parentID="1065" level="2" creatorID="0" sortOrder="1" createDate="2019-04-10T20:45:56" updateDate="2019-04-21T13:58:29" nodeName="Login" urlName="login" path="-1,1065,1085" isDoc="" nodeType="1083" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="login" isPublished="true"><title><![CDATA[Log ind]]></title><loginButtonText><![CDATA[Log ind]]></loginButtonText><codePlaceholder><![CDATA[Indtast din brugerkode]]></codePlaceholder><applicationName><![CDATA[SDU Træningsprogram]]></applicationName><instructions><![CDATA[Log ind med den kode du fik udleveret i din e-Boks.]]></instructions></login>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1101,'d7062020-04e5-439e-8cbd-271271d5e086',{ts '2019-04-21 14:09:43.480'},N'<guideIntro id="1101" key="d87cc5c9-6eae-4be3-a044-5755ab397726" parentID="1065" level="2" creatorID="0" sortOrder="2" createDate="2019-04-21T13:08:43" updateDate="2019-04-21T14:09:43" nodeName="Guide Intro" urlName="guide-intro" path="-1,1065,1101" isDoc="" nodeType="1100" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="guideIntro" isPublished="true"><title><![CDATA[Vejledning]]></title><nextButtonText><![CDATA[Videre]]></nextButtonText></guideIntro>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1103,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',{ts '2019-04-21 14:09:55.360'},N'<simpleBox id="1103" key="0d777818-7f9f-400a-84b8-221dd7b44792" parentID="1101" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T13:11:33" updateDate="2019-04-21T14:09:55" nodeName="How does the program work" urlName="how-does-the-program-work" path="-1,1065,1101,1103" isDoc="" nodeType="1075" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="simpleBox" isPublished="true"><subheading><![CDATA[Hvordan virker programmet?]]></subheading><isImportant>0</isImportant><body><![CDATA[<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>]]></body></simpleBox>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1108,'81a60f88-67ed-4522-ab6a-8bc80ee79c52',{ts '2019-04-21 14:10:31.487'},N'<trainingOverview id="1108" key="99c11896-4c17-4c0d-a16c-031711784844" parentID="1065" level="2" creatorID="0" sortOrder="3" createDate="2019-04-21T14:10:31" updateDate="2019-04-21T14:10:31" nodeName="Training" urlName="training" path="-1,1065,1108" isDoc="" nodeType="1104" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingOverview" isPublished="true"><title><![CDATA[Træning]]></title></trainingOverview>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1109,'1594b85e-6cca-45c5-ace0-d024c7cd351e',{ts '2019-04-21 14:10:55.350'},N'<trainingDiary id="1109" key="9f222e2d-f6d9-4e0a-9217-6eaad912d7ca" parentID="1108" level="3" creatorID="0" sortOrder="0" createDate="2019-04-21T14:10:55" updateDate="2019-04-21T14:10:55" nodeName="Training Diary" urlName="training-diary" path="-1,1065,1108,1109" isDoc="" nodeType="1106" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingDiary" isPublished="true"><title><![CDATA[Træningsdagbog]]></title></trainingDiary>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1110,'92357437-57d3-4d39-a66a-6264f5d838fb',{ts '2019-04-21 14:11:11.970'},N'<trainingSurvey id="1110" key="fb55fb0e-aee4-4ce8-93ad-e04283aa8797" parentID="1108" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T14:11:11" updateDate="2019-04-21T14:11:11" nodeName="Survey" urlName="survey" path="-1,1065,1108,1110" isDoc="" nodeType="1105" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingSurvey" isPublished="true"><title><![CDATA[Spørgeskema]]></title></trainingSurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1133,'a2763692-e746-4b0d-89bf-0f4493ebb0d7',{ts '2019-04-22 13:41:57.810'},N'<usersDirectory id="1133" key="534fb067-c741-44de-82d8-5c9d85bdaadb" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2019-04-22T13:41:57" updateDate="2019-04-22T13:41:57" nodeName="Users" urlName="users" path="-1,1133" isDoc="" nodeType="1132" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="usersDirectory" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1135,'d8415c10-041c-4740-b2fd-8090e57697f3',{ts '2019-04-22 13:44:32.983'},N'<userA id="1135" key="c9a4163d-abc9-495f-9a16-1eb175a8592d" parentID="1133" level="2" creatorID="0" sortOrder="0" createDate="2019-04-22T13:44:32" updateDate="2019-04-22T13:44:32" nodeName="13685" urlName="13685" path="-1,1133,1135" isDoc="" nodeType="1130" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="userA" isPublished="true"><autheticationCode><![CDATA[13685]]></autheticationCode></userA>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1138,'6b0e6f1e-fb98-4d08-96e3-0181898ce554',{ts '2019-04-22 14:06:35.423'},N'<submissionsDirectory id="1138" key="aca88fe8-6b4f-481a-9ca0-1b72eeab376a" parentID="-1" level="1" creatorID="0" sortOrder="2" createDate="2019-04-22T14:06:35" updateDate="2019-04-22T14:06:35" nodeName="Submissions" urlName="submissions" path="-1,1138" isDoc="" nodeType="1129" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="submissionsDirectory" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',{ts '2019-04-22 14:09:55.333'},N'<groupASurvey id="1139" key="fef744e4-c42f-4617-9fd1-83e1e7275940" parentID="1138" level="2" creatorID="0" sortOrder="0" createDate="2019-04-22T14:09:55" updateDate="2019-04-22T14:09:55" nodeName="13685-22-04-2019-A-Survey" urlName="13685-22-04-2019-a-survey" path="-1,1138,1139" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><daysOnMedication><![CDATA[1]]></daysOnMedication><pamol500>2</pamol500><daysSick><![CDATA[0]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><user><![CDATA[umb://document/c9a4163dabc9495f9a161eb175a8592d]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',{ts '2019-04-22 14:48:17.853'},N'<groupASurvey id="1139" key="fef744e4-c42f-4617-9fd1-83e1e7275940" parentID="1138" level="2" creatorID="0" sortOrder="0" createDate="2019-04-22T14:09:55" updateDate="2019-04-22T14:48:17" nodeName="13685-22-04-2019-A-Survey" urlName="13685-22-04-2019-a-survey" path="-1,1138,1139" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><daysOnMedication><![CDATA[1]]></daysOnMedication><pamol500>2</pamol500><daysSick><![CDATA[0]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-22T00:00:00</date><user><![CDATA[umb://document/c9a4163dabc9495f9a161eb175a8592d]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1140,'48de405d-67d8-43c8-9c4d-003e703d9216',{ts '2019-04-22 14:26:44.790'},N'<groupASurvey id="1140" key="83595e12-2a6d-419a-8baa-c520cd3bccb8" parentID="1138" level="2" creatorID="0" sortOrder="1" createDate="2019-04-22T14:26:44" updateDate="2019-04-22T14:26:44" nodeName="Glen´s content" urlName="glen-s-content" path="-1,1138,1140" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="false" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',{ts '2019-04-22 14:37:44.377'},N'<groupASurvey id="1141" key="b908c589-772a-4edb-83cd-c74d6da4fd07" parentID="1138" level="2" creatorID="0" sortOrder="2" createDate="2019-04-22T14:37:44" updateDate="2019-04-22T14:37:44" nodeName="Glen´s content (1)" urlName="glen-s-content-1" path="-1,1138,1141" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="false" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',{ts '2019-04-22 15:05:10.747'},N'<groupASurvey id="1142" key="adcd3ce6-78ec-4ea8-b1b4-d736d827df7b" parentID="1138" level="2" creatorID="0" sortOrder="3" createDate="2019-04-22T15:05:10" updateDate="2019-04-22T15:05:10" nodeName="Glen´s content (2)" urlName="glen-s-content-2" path="-1,1138,1142" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',{ts '2019-04-22 15:05:52.897'},N'<groupASurvey id="1143" key="8e8dd378-a43f-41ae-a144-f79d53dcf91e" parentID="1138" level="2" creatorID="0" sortOrder="4" createDate="2019-04-22T15:05:52" updateDate="2019-04-22T15:05:52" nodeName="Glen´s content (3)" urlName="glen-s-content-3" path="-1,1138,1143" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><user><![CDATA[97225]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',{ts '2019-04-22 15:07:46.447'},N'<groupASurvey id="1144" key="b7d62d62-5d46-45b8-84ae-10ccf179698b" parentID="1138" level="2" creatorID="0" sortOrder="5" createDate="2019-04-22T15:07:46" updateDate="2019-04-22T15:07:46" nodeName="Glen´s content (4)" urlName="glen-s-content-4" path="-1,1138,1144" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painLow><![CDATA[2]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',{ts '2019-04-22 15:20:14.710'},N'<groupASurvey id="1145" key="b2a31905-861a-459d-a64c-b2798d54535a" parentID="1138" level="2" creatorID="0" sortOrder="6" createDate="2019-04-22T15:20:14" updateDate="2019-04-22T15:20:14" nodeName="Kurt" urlName="kurt" path="-1,1138,1145" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painLow><![CDATA[7]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',{ts '2019-04-23 10:15:36.437'},N'<groupASurvey id="1146" key="133f1b03-1a30-4a23-8aa1-252ed2834c7a" parentID="1138" level="2" creatorID="0" sortOrder="7" createDate="2019-04-23T10:15:36" updateDate="2019-04-23T10:15:36" nodeName="testwhere" urlName="testwhere" path="-1,1138,1146" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painLow><![CDATA[7]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1147,'ca336733-37ad-4646-92ba-54d7640c4255',{ts '2019-04-23 10:16:44.547'},N'<groupASurvey id="1147" key="34c98de4-d24c-4cbd-b221-143e2b31a242" parentID="1138" level="2" creatorID="0" sortOrder="8" createDate="2019-04-23T10:16:44" updateDate="2019-04-23T10:16:44" nodeName="testwhere2" urlName="testwhere2" path="-1,1138,1147" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painLow><![CDATA[7]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',{ts '2019-04-23 10:34:55.967'},N'<groupASurvey id="1148" key="74de09a3-43d8-4451-9441-49218d3aca61" parentID="1138" level="2" creatorID="0" sortOrder="9" createDate="2019-04-23T10:34:55" updateDate="2019-04-23T10:34:55" nodeName="testwhere2 (1)" urlName="testwhere2-1" path="-1,1138,1148" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painLow><![CDATA[7]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1149,'e2a72aea-e134-47ad-b666-ef0db1449652',{ts '2019-04-23 10:37:27.143'},N'<groupASurvey id="1149" key="8dfdf04e-5353-4416-8c16-8c0e14bd4613" parentID="1138" level="2" creatorID="0" sortOrder="10" createDate="2019-04-23T10:37:27" updateDate="2019-04-23T10:37:27" nodeName="test3" urlName="test3" path="-1,1138,1149" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',{ts '2019-04-23 11:49:06.777'},N'<groupASurvey id="1150" key="23b8a628-98f9-4208-bf78-b68fdebb780e" parentID="1138" level="2" creatorID="0" sortOrder="11" createDate="2019-04-23T11:49:06" updateDate="2019-04-23T11:49:06" nodeName="test3 (1)" urlName="test3-1" path="-1,1138,1150" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>0001-01-01T00:00:00</date><user><![CDATA[98537]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1151,'a86c74da-7f93-433c-a289-e429121e73f1',{ts '2019-04-23 11:51:04.610'},N'<groupASurvey id="1151" key="9448c001-5dde-4851-9112-e37e8c8a9c8e" parentID="1138" level="2" creatorID="0" sortOrder="12" createDate="2019-04-23T11:51:04" updateDate="2019-04-23T11:51:04" nodeName="98537-23-04-2019-A-Survey" urlName="98537-23-04-2019-a-survey" path="-1,1138,1151" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[98537]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',{ts '2019-04-23 11:55:38.117'},N'<groupASurvey id="1152" key="0b2a36de-f587-44db-a2d0-50d65f56b89a" parentID="1138" level="2" creatorID="0" sortOrder="13" createDate="2019-04-23T11:55:38" updateDate="2019-04-23T11:55:38" nodeName="13685-23-04-2019-A-Survey" urlName="13685-23-04-2019-a-survey" path="-1,1138,1152" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[13685]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',{ts '2019-04-23 11:58:00.240'},N'<groupASurvey id="1153" key="d0a98c41-72f6-459e-ab91-313e12092547" parentID="1138" level="2" creatorID="0" sortOrder="14" createDate="2019-04-23T11:58:00" updateDate="2019-04-23T11:58:00" nodeName="13685-23-04-2019-A-Survey (1)" urlName="13685-23-04-2019-a-survey-1" path="-1,1138,1153" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[/13685/]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1154,'50237dae-576e-4e82-a469-765ea7e30491',{ts '2019-04-23 12:15:29.343'},N'<groupASurvey id="1154" key="d90ff2bb-d2b2-4bca-b37b-2ef76e62d66c" parentID="1138" level="2" creatorID="0" sortOrder="0" createDate="2019-04-23T12:15:29" updateDate="2019-04-23T12:15:29" nodeName="13685-23-04-2019-A-Survey" urlName="13685-23-04-2019-a-survey" path="-1,1138,1154" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[13685]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1110,'64d9c2b0-55c2-4c17-b191-295bbade0b41',{ts '2019-04-23 12:53:52.547'},N'<trainingSurvey id="1110" key="fb55fb0e-aee4-4ce8-93ad-e04283aa8797" parentID="1108" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T14:11:11" updateDate="2019-04-23T12:53:52" nodeName="Training Survey" urlName="training-survey" path="-1,1065,1108,1110" isDoc="" nodeType="1105" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingSurvey" isPublished="true"><title><![CDATA[Spørgeskema]]></title></trainingSurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',{ts '2019-04-25 13:06:39.440'},N'<groupASurvey id="1157" key="647d9437-5944-4033-8fc3-ffc233a75e7a" parentID="1138" level="2" creatorID="0" sortOrder="1" createDate="2019-04-25T13:06:39" updateDate="2019-04-25T13:06:39" nodeName="13685-25-04-2019-A-Survey" urlName="13685-25-04-2019-a-survey" path="-1,1138,1157" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>0</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-25T00:00:00</date><user><![CDATA[13685]]></user></groupASurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',{ts '2019-04-25 13:27:20.993'},N'<trainingSurvey id="1110" key="fb55fb0e-aee4-4ce8-93ad-e04283aa8797" parentID="1108" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T14:11:11" updateDate="2019-04-25T13:27:20" nodeName="Training Survey" urlName="training-survey" path="-1,1065,1108,1110" isDoc="" nodeType="1105" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingSurvey" isPublished="true"><title><![CDATA[Spørgeskema]]></title><painLowestLabel><![CDATA[Ingen smerter]]></painLowestLabel><painHeading><![CDATA[Generelle skuldersmerter]]></painHeading><painLowSubheading><![CDATA[LAVESTE skuldersmerteniveau du har haft samlet set over den sidste uge]]></painLowSubheading><painQuestion><![CDATA[Hvis du samlet skal beskrive hvordan dine generelle skuldersmerter har været over den sidste uge, hvordan har du da haft det? ]]></painQuestion><painInformationBody><![CDATA[I de 3 nedenstående smerteskaler skal du beskrive dine skuldersmerter over den sidste uge når de har været lavest, når de  har været højest og det gennemsnitlige smerteniveau.]]></painInformationBody><painHighSubheading><![CDATA[HØJESTE  skuldersmerteniveau du har haft samlet set over den sidste uge]]></painHighSubheading><painHighestLabel><![CDATA[Værst tænkelige smerter]]></painHighestLabel><painInformationHelp><![CDATA[Hjælp til vurdering af smerter]]></painInformationHelp><painAverageSubheading><![CDATA[GENNEMSNITLIGE  skuldersmerte- niveau du har haft samlet set over den sidste uge]]></painAverageSubheading><surveyInformation><![CDATA[Spørgsmålene i dette spørgeskema omhandler dine smerter, dit forbrug af smertestillende medicin, sygedage og eventuel supplerende behandling for dine skuldergener inden for de sidste 7 dage.]]></surveyInformation><enterPiecesPlaceholder><![CDATA[Indtast antal]]></enterPiecesPlaceholder><medicationTypeAmountSubheading><![CDATA[Hvilket form for smertestillende har du taget og antal over den sidste uge?]]></medicationTypeAmountSubheading><daysOnMedicationSubheading><![CDATA[Hvor mange dage har du taget smertestillende for din skulder over den sidste uge?]]></daysOnMedicationSubheading><ipren200Label><![CDATA[Ipren/Ibumetin, 200 mg]]></ipren200Label><hasTakenMedicationSubheading><![CDATA[Har du over den sidste uge taget smertestillende medicin pga. din skulder?]]></hasTakenMedicationSubheading><pamol500Label><![CDATA[Pamol/Panodil, 500 mg]]></pamol500Label><medicationHeading><![CDATA[Smertestillende]]></medicationHeading><otherMedicationTypePlaceholder><![CDATA[Indtast type af medicin]]></otherMedicationTypePlaceholder><otherMedicationAmountLabel><![CDATA[Hvilken mængde?]]></otherMedicationAmountLabel><ipren600Label><![CDATA[Ipren/Ibumetin, 600 mg]]></ipren600Label><otherMedicationTypeLabel><![CDATA[Hvilken type medicin?]]></otherMedicationTypeLabel><otherLabel><![CDATA[Andet]]></otherLabel><otherMedicationAmountPlaceholder><![CDATA[Indtast antal]]></otherMedicationAmountPlaceholder><sicknessHeading><![CDATA[Sygefravær pga. skulderen]]></sicknessHeading><daysSickSubheading><![CDATA[Har du over den sidste uge haft nogen sygedage pga. din skulder?]]></daysSickSubheading><otherTreatmentPlaceholder><![CDATA[Hvilken behandling?]]></otherTreatmentPlaceholder><chiropractorLabel><![CDATA[Kiropraktor]]></chiropractorLabel><complimentaryTreatmentInformation><![CDATA[Supplerende behandling udover den du modtager som del af projektet.]]></complimentaryTreatmentInformation><complimentaryTreatmentsSubheading><![CDATA[Har du over den sidste uge modtaget én af følgende behandlinger ud over  det du modtager som en del af projektet?]]></complimentaryTreatmentsSubheading><physiotherapyLabel><![CDATA[Fysioterapi]]></physiotherapyLabel><acupunctureLabel><![CDATA[Akupunktur]]></acupunctureLabel><complimentaryTreatmentHeading><![CDATA[Supplerende behandling]]></complimentaryTreatmentHeading><massageLabel><![CDATA[Massage]]></massageLabel></trainingSurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1110,'10657818-6709-43f7-9a32-73acfdfc38a2',{ts '2019-04-25 13:29:08.340'},N'<trainingSurvey id="1110" key="fb55fb0e-aee4-4ce8-93ad-e04283aa8797" parentID="1108" level="3" creatorID="0" sortOrder="1" createDate="2019-04-21T14:11:11" updateDate="2019-04-25T13:29:08" nodeName="Training Survey" urlName="training-survey" path="-1,1065,1108,1110" isDoc="" nodeType="1105" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="trainingSurvey" isPublished="true"><title><![CDATA[Spørgeskema]]></title><painLowestLabel><![CDATA[Ingen smerter]]></painLowestLabel><painHeading><![CDATA[Generelle skuldersmerter]]></painHeading><painLowSubheading><![CDATA[LAVESTE skuldersmerteniveau du har haft samlet set over den sidste uge]]></painLowSubheading><painQuestion><![CDATA[Hvis du samlet skal beskrive hvordan dine generelle skuldersmerter har været over den sidste uge, hvordan har du da haft det? ]]></painQuestion><painInformationBody><![CDATA[I de 3 nedenstående smerteskaler skal du beskrive dine skuldersmerter over den sidste uge når de har været lavest, når de  har været højest og det gennemsnitlige smerteniveau.]]></painInformationBody><painHighSubheading><![CDATA[HØJESTE  skuldersmerteniveau du har haft samlet set over den sidste uge]]></painHighSubheading><painHighestLabel><![CDATA[Værst tænkelige smerter]]></painHighestLabel><painInformationHelp><![CDATA[Hjælp til vurdering af smerter]]></painInformationHelp><painAverageSubheading><![CDATA[GENNEMSNITLIGE  skuldersmerte- niveau du har haft samlet set over den sidste uge]]></painAverageSubheading><surveyInformation><![CDATA[Spørgsmålene i dette spørgeskema omhandler dine smerter, dit forbrug af smertestillende medicin, sygedage og eventuel supplerende behandling for dine skuldergener inden for de sidste 7 dage.]]></surveyInformation><enterPiecesPlaceholder><![CDATA[Indtast antal]]></enterPiecesPlaceholder><medicationTypeAmountSubheading><![CDATA[Hvilket form for smertestillende har du taget og antal over den sidste uge?]]></medicationTypeAmountSubheading><daysOnMedicationSubheading><![CDATA[Hvor mange dage har du taget smertestillende for din skulder over den sidste uge?]]></daysOnMedicationSubheading><ipren200Label><![CDATA[Ipren/Ibumetin, 200 mg]]></ipren200Label><hasTakenMedicationSubheading><![CDATA[Har du over den sidste uge taget smertestillende medicin pga. din skulder?]]></hasTakenMedicationSubheading><pamol500Label><![CDATA[Pamol/Panodil, 500 mg]]></pamol500Label><medicationHeading><![CDATA[Smertestillende]]></medicationHeading><otherMedicationTypePlaceholder><![CDATA[Indtast type af medicin]]></otherMedicationTypePlaceholder><otherMedicationAmountLabel><![CDATA[Hvilken mængde?]]></otherMedicationAmountLabel><ipren600Label><![CDATA[Ipren/Ibumetin, 600 mg]]></ipren600Label><otherMedicationTypeLabel><![CDATA[Hvilken type medicin?]]></otherMedicationTypeLabel><otherLabel><![CDATA[Andet]]></otherLabel><otherMedicationAmountPlaceholder><![CDATA[Indtast antal]]></otherMedicationAmountPlaceholder><sicknessHeading><![CDATA[Sygefravær pga. skulderen]]></sicknessHeading><daysSickSubheading><![CDATA[Har du over den sidste uge haft nogen sygedage pga. din skulder?]]></daysSickSubheading><otherTreatmentPlaceholder><![CDATA[Hvilken behandling?]]></otherTreatmentPlaceholder><chiropractorLabel><![CDATA[Kiropraktor]]></chiropractorLabel><complimentaryTreatmentInformation><![CDATA[Supplerende behandling udover den du modtager som del af projektet.]]></complimentaryTreatmentInformation><complimentaryTreatmentsSubheading><![CDATA[Har du over den sidste uge modtaget én af følgende behandlinger ud over  det du modtager som en del af projektet?]]></complimentaryTreatmentsSubheading><physiotherapyLabel><![CDATA[Fysioterapi]]></physiotherapyLabel><acupunctureLabel><![CDATA[Akupunktur]]></acupunctureLabel><complimentaryTreatmentHeading><![CDATA[Supplerende behandling]]></complimentaryTreatmentHeading><massageLabel><![CDATA[Massage]]></massageLabel><hasSeenDoctorSubheading><![CDATA[Har du over den sidste uge opsøgt læge pga. din skulder?]]></hasSeenDoctorSubheading></trainingSurvey>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',{ts '2019-04-26 14:30:48.570'},N'<groupASurvey id="1154" key="d90ff2bb-d2b2-4bca-b37b-2ef76e62d66c" parentID="1138" level="2" creatorID="0" sortOrder="0" createDate="2019-04-23T12:15:29" updateDate="2019-04-26T14:30:48" nodeName="13685-23-04-2019-A-Survey" urlName="13685-23-04-2019-a-survey" path="-1,1138,1154" isDoc="" nodeType="1117" creatorName="Uffe Christiansen" writerName="Uffe Christiansen" writerID="0" template="0" nodeTypeAlias="groupASurvey" isPublished="true"><painAverage><![CDATA[5]]></painAverage><painHigh><![CDATA[8]]></painHigh><painLow><![CDATA[2]]></painLow><ipren600>1</ipren600><daysOnMedication><![CDATA[1]]></daysOnMedication><ipren200>1</ipren200><pamol500>1</pamol500><daysSick><![CDATA[1]]></daysSick><treatmentAcupuncture>0</treatmentAcupuncture><treatmentChiropractor>0</treatmentChiropractor><treatmentPhysiotherapy>0</treatmentPhysiotherapy><treatmentMassage>1</treatmentMassage><treatmentDoctor>0</treatmentDoctor><date>2019-04-23T00:00:00</date><user><![CDATA[umb://document/c9a4163dabc9495f9a161eb175a8592d]]></user></groupASurvey>');
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (3,1071,'608ce508-8f97-48f3-aaf8-7f605e86ae4f',54,NULL,NULL,NULL,N'Om programmet',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (4,1072,'a2a30b40-1124-4ad2-a481-9d72b0cefd9d',54,NULL,NULL,NULL,N'Øvelser',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (5,1073,'37de678b-a2ea-4087-9867-5129b0964997',54,NULL,NULL,NULL,N'Om træningsdagbogen',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (6,1066,'a17b3c3b-e560-48a4-9685-6cd0cdaa9130',53,NULL,NULL,NULL,N'Vejledning',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (7,1065,'7495b6c1-e670-4ad0-94c2-989fc71d40f3',53,NULL,NULL,NULL,N'Oversigt',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (8,1077,'0d990451-9edb-49c8-a9a5-89c44f183d9d',56,NULL,NULL,NULL,NULL,N'<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (44,1101,'363d3eff-fc10-4039-8b77-0eb3ddce60ed',53,NULL,NULL,NULL,N'Vejledning',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (10,1078,'9cc76e30-af8f-457b-aff4-2c635cd4bfe7',56,NULL,NULL,NULL,NULL,N'<p>Træning regelmæssigt er lige så vigtig som en sund livsstil, og der er ikke nogen<br />grund til at folk med hypermobile led ikke skal træne. Men finder du ud af, at<br />visse sportsgrene eller øvelser giver anledning til smerter, bør du stoppe disse<br />aktiviteter, indtil du ved hvorfor symptomerne opstår. Med de rigtige<br />styrkeøvelser kan det være muligt at vende tilbage til de bestemte aktiviteter<br />uden at øge symptomerne.</p>
<p>Kontrolleret styrketræning og holdningsøvelser kan derfor være godt for<br />kroppen.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (45,1102,'7a30fc8d-ef7c-441b-8ef4-b6d32f168a5a',69,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (12,1078,'5aa34b8b-6185-4224-9adc-f7ea7e9b580c',56,NULL,NULL,NULL,NULL,N'<p>Træning regelmæssigt er lige så vigtig som en sund livsstil, og der er ikke nogen grund til at folk med hypermobile led ikke skal træne. Men finder du ud af, at visse sportsgrene eller øvelser giver anledning til smerter, bør du stoppe disse aktiviteter, indtil du ved hvorfor symptomerne opstår. Med de rigtige styrkeøvelser kan det være muligt at vende tilbage til de bestemte aktiviteter uden at øge symptomerne.</p>
<p>Kontrolleret styrketræning og holdningsøvelser kan derfor være godt for kroppen.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (46,1102,'7a30fc8d-ef7c-441b-8ef4-b6d32f168a5a',56,NULL,NULL,NULL,NULL,N'');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (14,1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',61,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (15,1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',60,NULL,NULL,NULL,N'Indtast din brugerkode',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (34,1093,'b1a59788-0947-48dc-8985-fa47f70409ca',63,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (17,1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',57,NULL,NULL,NULL,N'SDU Træningsprogram',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (18,1084,'c9dcfd49-e78f-4423-9ab4-aad0cd569b6f',59,NULL,NULL,NULL,N'Log ind med den kode du fik udleveret i din e-Boks.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (19,1084,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',61,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (20,1084,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',60,NULL,NULL,NULL,N'Indtast din brugerkode',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (35,1072,'05728fed-4e38-4483-9387-4ce906173b8b',54,NULL,NULL,NULL,N'Øvelser',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (22,1084,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',57,NULL,NULL,NULL,N'SDU Træningsprogram',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (23,1084,'a4a4c7b3-7638-47cc-998f-a7871c4cd2e8',59,NULL,NULL,NULL,N'Log ind med den kode du fik udleveret i din e-Boks.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (24,1084,'99c295cc-0c8d-428f-9e40-22101e968622',61,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (25,1084,'99c295cc-0c8d-428f-9e40-22101e968622',60,NULL,NULL,NULL,N'Indtast din brugerkode',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (36,1072,'3a61df9c-c1ac-4b49-bdd4-048ce397d02b',54,NULL,NULL,NULL,N'Øvelser',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (27,1084,'99c295cc-0c8d-428f-9e40-22101e968622',57,NULL,NULL,NULL,N'SDU Træningsprogram',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (28,1084,'99c295cc-0c8d-428f-9e40-22101e968622',59,NULL,NULL,NULL,N'Log ind med den kode du fik udleveret i din e-Boks.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (29,1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',61,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (30,1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',60,NULL,NULL,NULL,N'Indtast din brugerkode',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (37,1093,'489bbff2-90eb-4bb1-a48c-06f297c00332',63,NULL,NULL,NULL,N'Øvelser',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (32,1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',57,NULL,NULL,NULL,N'SDU Træningsprogram',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (33,1085,'2767f4d0-8bd5-43eb-a15f-1fda380b02eb',59,NULL,NULL,NULL,N'Log ind med den kode du fik udleveret i din e-Boks.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (38,1093,'546f9d52-694c-47c9-b42d-2126a768cd9b',63,NULL,NULL,NULL,N'Øvelser',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (39,1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',67,NULL,NULL,NULL,NULL,N'<p>Lorem ipsum</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (66,1135,'d8415c10-041c-4740-b2fd-8090e57697f3',123,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (41,1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',66,NULL,NULL,NULL,NULL,N'Udføres uge 1-4');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (42,1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',62,NULL,1.000000,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (43,1097,'260bd9a9-6889-43c9-a924-57c7cf7d3c9b',64,NULL,NULL,NULL,N'Kropsholdning',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (47,1102,'68d04a58-cbad-4293-b309-0d4f675d5ed9',68,NULL,NULL,NULL,N'Læs denne vejledning igennem inden du påbegynder dit træningsprogram.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (48,1102,'68d04a58-cbad-4293-b309-0d4f675d5ed9',69,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (49,1102,'68d04a58-cbad-4293-b309-0d4f675d5ed9',56,NULL,NULL,NULL,NULL,N'<p>Du kan altid finde vejledningen igen, når du får brug for den på et senere tidspunkt.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (50,1103,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',68,NULL,NULL,NULL,N'Hvordan virker programmet?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (51,1103,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',69,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (52,1103,'1f29dbaa-49aa-4cb7-a4f9-793df35672fd',56,NULL,NULL,NULL,NULL,N'<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (53,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',53,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (54,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',61,NULL,NULL,NULL,N'Log ind',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (55,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',60,NULL,NULL,NULL,N'Indtast din brugerkode',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (56,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',57,NULL,NULL,NULL,N'SDU Træningsprogram',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (57,1085,'c1be7205-3171-4d08-afbd-9a4dd738696d',59,NULL,NULL,NULL,N'Log ind med den kode du fik udleveret i din e-Boks.',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (58,1101,'d7062020-04e5-439e-8cbd-271271d5e086',53,NULL,NULL,NULL,N'Vejledning',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (59,1101,'d7062020-04e5-439e-8cbd-271271d5e086',70,NULL,NULL,NULL,N'Videre',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (60,1103,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',68,NULL,NULL,NULL,N'Hvordan virker programmet?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (61,1103,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',69,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (62,1103,'3fc42094-b6e4-4248-b99f-fbaab7d1b681',56,NULL,NULL,NULL,NULL,N'<p>Programmets er designet for at øge stivhedsgraden i muskler og sener omkring skulderen og skulderbladet, således at du bedre kan kontrollere bevægelser i hverdagen.</p>
<p>De første fire uger er en tilvænningsfase, hvor belastningen gradvist øges. Derefter indledes styrkeprogrammet.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (63,1108,'81a60f88-67ed-4522-ab6a-8bc80ee79c52',53,NULL,NULL,NULL,N'Træning',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (64,1109,'1594b85e-6cca-45c5-ace0-d024c7cd351e',53,NULL,NULL,NULL,N'Træningsdagbog',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (65,1110,'92357437-57d3-4d39-a66a-6264f5d838fb',53,NULL,NULL,NULL,N'Spørgeskema',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (67,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (68,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (69,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (70,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (71,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (72,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (73,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (74,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (75,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',85,2,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (76,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',90,NULL,NULL,NULL,N'0',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (77,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (78,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (79,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (80,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (81,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (82,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (83,1139,'eac678cb-f5b3-4c56-8ce3-5e43815a7fed',126,NULL,NULL,NULL,N'umb://document/c9a4163dabc9495f9a161eb175a8592d',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (84,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (85,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (86,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (87,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (88,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (89,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (90,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (91,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (92,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',85,2,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (93,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',90,NULL,NULL,NULL,N'0',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (94,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (95,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (96,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (97,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (98,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (99,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (100,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',139,NULL,NULL,{ts '2019-04-22 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (101,1139,'2945df94-904e-49cf-b074-ccb60d45bd6f',126,NULL,NULL,NULL,N'umb://document/c9a4163dabc9495f9a161eb175a8592d',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (911,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',154,NULL,NULL,NULL,N'Pamol/Panodil, 500 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (912,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',150,NULL,NULL,NULL,N'Smertestillende',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (913,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',160,NULL,NULL,NULL,N'Indtast type af medicin',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (914,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',161,NULL,NULL,NULL,N'Hvilken mængde?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (915,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',156,NULL,NULL,NULL,N'Ipren/Ibumetin, 600 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (916,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',159,NULL,NULL,NULL,N'Hvilken type medicin?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (917,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',158,NULL,NULL,NULL,N'Andet',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (918,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',162,NULL,NULL,NULL,N'Indtast antal',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (919,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',163,NULL,NULL,NULL,N'Sygefravær pga. skulderen',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (920,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',164,NULL,NULL,NULL,N'Har du over den sidste uge haft nogen sygedage pga. din skulder?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (921,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',173,NULL,NULL,NULL,N'Hvilken behandling?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (922,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',172,NULL,NULL,NULL,N'Kiropraktor',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (923,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',166,NULL,NULL,NULL,NULL,N'Supplerende behandling udover den du modtager som del af projektet.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (924,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',167,NULL,NULL,NULL,N'Har du over den sidste uge modtaget én af følgende behandlinger ud over  det du modtager som en del af projektet?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (925,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',169,NULL,NULL,NULL,N'Fysioterapi',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (926,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',171,NULL,NULL,NULL,N'Akupunktur',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (927,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',165,NULL,NULL,NULL,N'Supplerende behandling',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (928,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',170,NULL,NULL,NULL,N'Massage',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (929,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',168,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (930,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',53,NULL,NULL,NULL,N'Spørgeskema',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (931,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',148,NULL,NULL,NULL,N'Ingen smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (932,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',141,NULL,NULL,NULL,N'Generelle skuldersmerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (933,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',145,NULL,NULL,NULL,N'LAVESTE skuldersmerteniveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (934,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',144,NULL,NULL,NULL,N'Hvis du samlet skal beskrive hvordan dine generelle skuldersmerter har været over den sidste uge, hvordan har du da haft det? ',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (935,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',142,NULL,NULL,NULL,NULL,N'I de 3 nedenstående smerteskaler skal du beskrive dine skuldersmerter over den sidste uge når de har været lavest, når de  har været højest og det gennemsnitlige smerteniveau.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (936,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',146,NULL,NULL,NULL,N'HØJESTE  skuldersmerteniveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (937,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',149,NULL,NULL,NULL,N'Værst tænkelige smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (938,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',143,NULL,NULL,NULL,N'Hjælp til vurdering af smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (939,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',147,NULL,NULL,NULL,N'GENNEMSNITLIGE  skuldersmerte- niveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (940,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',140,NULL,NULL,NULL,NULL,N'Spørgsmålene i dette spørgeskema omhandler dine smerter, dit forbrug af smertestillende medicin, sygedage og eventuel supplerende behandling for dine skuldergener inden for de sidste 7 dage.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (941,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',157,NULL,NULL,NULL,N'Indtast antal',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (942,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',153,NULL,NULL,NULL,N'Hvilket form for smertestillende har du taget og antal over den sidste uge?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (943,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',152,NULL,NULL,NULL,N'Hvor mange dage har du taget smertestillende for din skulder over den sidste uge?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (944,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',155,NULL,NULL,NULL,N'Ipren/Ibumetin, 200 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (945,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',151,NULL,NULL,NULL,N'Har du over den sidste uge taget smertestillende medicin pga. din skulder?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (946,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',154,NULL,NULL,NULL,N'Pamol/Panodil, 500 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (947,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',150,NULL,NULL,NULL,N'Smertestillende',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (948,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',160,NULL,NULL,NULL,N'Indtast type af medicin',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (949,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',161,NULL,NULL,NULL,N'Hvilken mængde?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (950,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',156,NULL,NULL,NULL,N'Ipren/Ibumetin, 600 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (951,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',159,NULL,NULL,NULL,N'Hvilken type medicin?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (952,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',158,NULL,NULL,NULL,N'Andet',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (953,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',162,NULL,NULL,NULL,N'Indtast antal',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (954,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',163,NULL,NULL,NULL,N'Sygefravær pga. skulderen',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (955,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',164,NULL,NULL,NULL,N'Har du over den sidste uge haft nogen sygedage pga. din skulder?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (956,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',173,NULL,NULL,NULL,N'Hvilken behandling?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (957,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',172,NULL,NULL,NULL,N'Kiropraktor',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (958,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',166,NULL,NULL,NULL,NULL,N'Supplerende behandling udover den du modtager som del af projektet.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (959,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',167,NULL,NULL,NULL,N'Har du over den sidste uge modtaget én af følgende behandlinger ud over  det du modtager som en del af projektet?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (960,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',169,NULL,NULL,NULL,N'Fysioterapi',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (961,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',171,NULL,NULL,NULL,N'Akupunktur',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (962,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',165,NULL,NULL,NULL,N'Supplerende behandling',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (963,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',170,NULL,NULL,NULL,N'Massage',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (964,1110,'10657818-6709-43f7-9a32-73acfdfc38a2',168,NULL,NULL,NULL,N'Har du over den sidste uge opsøgt læge pga. din skulder?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (965,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (966,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (967,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (968,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',87,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (969,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (970,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (971,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (972,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (973,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (974,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (975,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (976,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (977,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (978,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (979,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (980,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (981,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (982,1154,'e8dd7b6a-8b35-46dc-bf17-33a3d7fc014f',126,NULL,NULL,NULL,N'umb://document/c9a4163dabc9495f9a161eb175a8592d',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (102,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (103,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (104,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (105,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (106,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (107,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (108,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (109,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (110,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (111,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (112,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (113,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (114,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (115,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (116,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (117,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (118,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (119,1140,'48de405d-67d8-43c8-9c4d-003e703d9216',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (120,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (121,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (122,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (123,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (124,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (125,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (126,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (127,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (128,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (129,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (130,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (131,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (132,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (133,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (134,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (135,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (136,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (137,1141,'a4dabd7b-876d-492d-af14-1497d8639f8b',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (138,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (139,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (140,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (141,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (142,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (143,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (144,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (145,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (146,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (147,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (148,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (149,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (150,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (151,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (152,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (153,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (154,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (155,1142,'8e2b2335-67a9-4b7b-a340-19ac6996d88e',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (156,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (429,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (430,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (431,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (432,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (433,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (434,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (435,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (436,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (437,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (438,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (439,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (440,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (441,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (442,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (443,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (444,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (445,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (446,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (447,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (448,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (449,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (450,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (451,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (452,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (453,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (454,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (455,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (456,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (457,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (458,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (459,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (460,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (461,1142,'4b4dd7bc-c26b-4fdb-828f-886575006e52',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (462,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (463,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (464,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (465,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (466,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (467,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (468,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (469,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (470,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (471,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (472,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (473,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (474,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (475,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (476,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (477,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (478,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (479,1143,'eb45ec06-1335-4ccb-b745-ac35a31a62bc',126,NULL,NULL,NULL,N'97225',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (480,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (481,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (482,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (483,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (157,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (158,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (159,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (160,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (161,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (162,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (163,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (164,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (165,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (166,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (167,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (168,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (169,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (170,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (171,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (172,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (173,1143,'58ede83f-be59-4ffc-8982-e1e30678a97e',126,NULL,NULL,NULL,N'97225',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (174,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (175,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (176,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (177,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (178,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (179,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (180,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (181,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (182,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (183,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (184,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (185,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (186,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (187,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (188,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (189,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (190,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (191,1144,'c57a8e6b-e0b9-4314-ae26-6edce64c0ed6',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (192,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (193,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (194,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (195,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (196,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (197,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (198,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (199,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (200,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (201,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (202,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (203,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (204,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (205,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (206,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (207,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (208,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (209,1145,'8f88ba7b-fe5c-4db8-984e-8d0e1d69266e',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (210,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (211,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (212,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (213,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (214,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (215,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (216,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (217,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (218,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (219,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (220,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (221,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (222,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (223,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (224,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (225,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (226,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (227,1146,'cdfc0de5-a2e1-4bff-a570-05e7ad4a9bf5',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (228,1147,'ca336733-37ad-4646-92ba-54d7640c4255',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (229,1147,'ca336733-37ad-4646-92ba-54d7640c4255',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (230,1147,'ca336733-37ad-4646-92ba-54d7640c4255',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (231,1147,'ca336733-37ad-4646-92ba-54d7640c4255',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (232,1147,'ca336733-37ad-4646-92ba-54d7640c4255',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (233,1147,'ca336733-37ad-4646-92ba-54d7640c4255',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (234,1147,'ca336733-37ad-4646-92ba-54d7640c4255',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (235,1147,'ca336733-37ad-4646-92ba-54d7640c4255',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (236,1147,'ca336733-37ad-4646-92ba-54d7640c4255',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (237,1147,'ca336733-37ad-4646-92ba-54d7640c4255',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (238,1147,'ca336733-37ad-4646-92ba-54d7640c4255',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (239,1147,'ca336733-37ad-4646-92ba-54d7640c4255',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (240,1147,'ca336733-37ad-4646-92ba-54d7640c4255',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (241,1147,'ca336733-37ad-4646-92ba-54d7640c4255',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (242,1147,'ca336733-37ad-4646-92ba-54d7640c4255',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (243,1147,'ca336733-37ad-4646-92ba-54d7640c4255',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (244,1147,'ca336733-37ad-4646-92ba-54d7640c4255',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (245,1147,'ca336733-37ad-4646-92ba-54d7640c4255',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (246,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (247,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (248,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (249,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (250,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (251,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (252,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (253,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (254,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (255,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (256,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (257,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (258,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (259,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (260,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (261,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (262,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (263,1148,'be5fb8c5-5a1b-4be8-b9b7-42ab0fe2f06e',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (264,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (265,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (266,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (539,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (540,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (541,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (542,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (543,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (544,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (545,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (546,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (547,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (548,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (549,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (550,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (551,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (552,1145,'582dff84-3fab-415d-b229-5de612bff936',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (553,1145,'582dff84-3fab-415d-b229-5de612bff936',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (554,1145,'582dff84-3fab-415d-b229-5de612bff936',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (555,1145,'582dff84-3fab-415d-b229-5de612bff936',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (556,1145,'582dff84-3fab-415d-b229-5de612bff936',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (557,1145,'582dff84-3fab-415d-b229-5de612bff936',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (558,1145,'582dff84-3fab-415d-b229-5de612bff936',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (559,1145,'582dff84-3fab-415d-b229-5de612bff936',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (560,1145,'582dff84-3fab-415d-b229-5de612bff936',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (561,1145,'582dff84-3fab-415d-b229-5de612bff936',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (562,1145,'582dff84-3fab-415d-b229-5de612bff936',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (563,1145,'582dff84-3fab-415d-b229-5de612bff936',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (564,1145,'582dff84-3fab-415d-b229-5de612bff936',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (565,1145,'582dff84-3fab-415d-b229-5de612bff936',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (566,1145,'582dff84-3fab-415d-b229-5de612bff936',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (567,1145,'582dff84-3fab-415d-b229-5de612bff936',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (568,1145,'582dff84-3fab-415d-b229-5de612bff936',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (569,1145,'582dff84-3fab-415d-b229-5de612bff936',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (570,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (571,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (572,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (573,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (574,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (575,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (576,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (577,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (578,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (579,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (580,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (581,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (582,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (583,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (584,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (585,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (586,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (587,1146,'aa79cc48-f9e4-4ae9-b4f2-70107cc6eba5',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (588,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (589,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (590,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (591,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (592,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (593,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (267,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (268,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (269,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (270,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (271,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (272,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (273,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (274,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (275,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (276,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (277,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (278,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (279,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (280,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (281,1149,'e2a72aea-e134-47ad-b666-ef0db1449652',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (282,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (283,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (284,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (285,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (286,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (287,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (288,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (289,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (290,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (291,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (292,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (293,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (294,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (295,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (296,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (297,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (298,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (299,1150,'444bbf02-ec88-49d3-95fa-11b32fea40e7',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (300,1151,'a86c74da-7f93-433c-a289-e429121e73f1',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (301,1151,'a86c74da-7f93-433c-a289-e429121e73f1',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (302,1151,'a86c74da-7f93-433c-a289-e429121e73f1',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (303,1151,'a86c74da-7f93-433c-a289-e429121e73f1',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (304,1151,'a86c74da-7f93-433c-a289-e429121e73f1',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (305,1151,'a86c74da-7f93-433c-a289-e429121e73f1',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (306,1151,'a86c74da-7f93-433c-a289-e429121e73f1',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (307,1151,'a86c74da-7f93-433c-a289-e429121e73f1',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (308,1151,'a86c74da-7f93-433c-a289-e429121e73f1',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (309,1151,'a86c74da-7f93-433c-a289-e429121e73f1',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (310,1151,'a86c74da-7f93-433c-a289-e429121e73f1',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (311,1151,'a86c74da-7f93-433c-a289-e429121e73f1',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (312,1151,'a86c74da-7f93-433c-a289-e429121e73f1',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (313,1151,'a86c74da-7f93-433c-a289-e429121e73f1',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (314,1151,'a86c74da-7f93-433c-a289-e429121e73f1',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (315,1151,'a86c74da-7f93-433c-a289-e429121e73f1',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (316,1151,'a86c74da-7f93-433c-a289-e429121e73f1',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (317,1151,'a86c74da-7f93-433c-a289-e429121e73f1',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (318,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (319,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (320,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (649,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (650,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (651,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (652,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (653,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (654,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (655,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (656,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (657,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (658,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (659,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (660,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (661,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (662,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (663,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (664,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (665,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (666,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (667,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (668,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (669,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (670,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (671,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (672,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (673,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (674,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (675,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (676,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (677,1148,'1bbad188-05eb-4976-a1c5-0883ac207817',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (678,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (679,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (680,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (681,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (682,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (683,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (684,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (685,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (686,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (687,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (688,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (689,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (690,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (691,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (692,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (693,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (694,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (695,1149,'073e3e4e-1b3b-4392-89d4-fa4bde147b04',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (696,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (697,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (698,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (699,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (700,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (701,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (702,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (703,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (704,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (705,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (706,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (707,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (708,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (709,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (710,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (711,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (712,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (713,1149,'931027ae-8141-4103-b287-10ddf6c2ce7e',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (714,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (715,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (716,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (717,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (718,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (719,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (720,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (721,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (722,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (723,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (724,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (725,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (726,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (727,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (728,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (729,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (730,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (731,1150,'ac8e540e-c162-4cbf-910b-6994a398230d',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (732,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (733,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (734,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (735,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (736,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (737,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (738,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (739,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (740,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (741,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (742,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (743,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (744,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (745,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (746,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (747,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (748,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (749,1150,'f8582304-53ce-4e3a-b530-a21ae4b0f04c',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (750,1151,'192817e8-d708-431f-a2e7-298364ad4df0',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (751,1151,'192817e8-d708-431f-a2e7-298364ad4df0',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (752,1151,'192817e8-d708-431f-a2e7-298364ad4df0',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (753,1151,'192817e8-d708-431f-a2e7-298364ad4df0',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (754,1151,'192817e8-d708-431f-a2e7-298364ad4df0',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (755,1151,'192817e8-d708-431f-a2e7-298364ad4df0',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (756,1151,'192817e8-d708-431f-a2e7-298364ad4df0',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (757,1151,'192817e8-d708-431f-a2e7-298364ad4df0',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (321,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (322,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (323,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (324,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (325,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (326,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (327,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (328,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (329,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (330,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (331,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (332,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (333,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (334,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (335,1152,'d9eef728-8b30-4ca6-8124-324b4fd8d0f2',126,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (336,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (337,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (338,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (339,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (340,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (341,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (342,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (343,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (344,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (345,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (346,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (347,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (348,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (349,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (350,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (351,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (352,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (353,1153,'a6784aa3-636d-4120-b08e-d2a96ae768df',126,NULL,NULL,NULL,N'/13685/',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (354,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (355,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (356,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (357,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (358,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (359,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (360,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (361,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (362,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',85,2,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (363,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',90,NULL,NULL,NULL,N'0',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (364,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (365,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (366,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (367,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (368,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (369,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (370,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',139,NULL,NULL,{ts '2019-04-22 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (371,1139,'d29c87f8-1160-4f9e-b8ce-2aca1d614673',126,NULL,NULL,NULL,N'umb://document/c9a4163dabc9495f9a161eb175a8592d',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (372,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (373,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (758,1151,'192817e8-d708-431f-a2e7-298364ad4df0',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (759,1151,'192817e8-d708-431f-a2e7-298364ad4df0',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (760,1151,'192817e8-d708-431f-a2e7-298364ad4df0',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (761,1151,'192817e8-d708-431f-a2e7-298364ad4df0',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (762,1151,'192817e8-d708-431f-a2e7-298364ad4df0',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (763,1151,'192817e8-d708-431f-a2e7-298364ad4df0',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (764,1151,'192817e8-d708-431f-a2e7-298364ad4df0',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (765,1151,'192817e8-d708-431f-a2e7-298364ad4df0',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (766,1151,'192817e8-d708-431f-a2e7-298364ad4df0',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (767,1151,'192817e8-d708-431f-a2e7-298364ad4df0',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (768,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (769,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (770,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (771,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (772,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (773,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (774,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (775,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (776,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (777,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (778,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (779,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (780,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (781,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (782,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (783,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (784,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (785,1151,'2ab87c0c-f101-4a24-a910-702ef663b52d',126,NULL,NULL,NULL,N'98537',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (786,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (787,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (788,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (789,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (790,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (791,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (792,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (793,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (794,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (795,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (796,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (797,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (798,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (799,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (800,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (801,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (802,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (803,1152,'1842731c-7eb9-47a0-b231-da45e9bc6276',126,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (804,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (805,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (806,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (807,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (808,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (809,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (810,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (811,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (812,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (813,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (814,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (815,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (816,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (817,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (818,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (819,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (820,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (821,1152,'ede19a05-be9f-4bda-bba3-896bc9b651a9',126,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (822,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (823,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (824,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (825,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (826,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (827,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (828,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (829,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (830,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (831,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (832,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (833,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (834,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (835,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (836,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (837,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (838,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (839,1153,'2e7c8058-f731-4fdb-8873-ada898846d1f',126,NULL,NULL,NULL,N'/13685/',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (840,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (841,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (842,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (843,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (844,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (845,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (846,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (847,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (848,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (849,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (850,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (851,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (852,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (853,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (854,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (855,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (856,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (857,1153,'71bc05b2-1c2a-46e2-a20f-884fd1b0b895',126,NULL,NULL,NULL,N'/13685/',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (858,1154,'50237dae-576e-4e82-a469-765ea7e30491',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (859,1154,'50237dae-576e-4e82-a469-765ea7e30491',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (860,1154,'50237dae-576e-4e82-a469-765ea7e30491',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (861,1154,'50237dae-576e-4e82-a469-765ea7e30491',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (862,1154,'50237dae-576e-4e82-a469-765ea7e30491',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (863,1154,'50237dae-576e-4e82-a469-765ea7e30491',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (864,1154,'50237dae-576e-4e82-a469-765ea7e30491',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (865,1154,'50237dae-576e-4e82-a469-765ea7e30491',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (374,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (375,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (376,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (377,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (378,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (379,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (380,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',85,2,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (381,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',90,NULL,NULL,NULL,N'0',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (382,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (383,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (384,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (385,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (386,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (387,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (388,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',139,NULL,NULL,{ts '2019-04-22 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (389,1139,'a6bedd3a-1ffd-4800-9fc1-18715b1293bf',126,NULL,NULL,NULL,N'umb://document/c9a4163dabc9495f9a161eb175a8592d',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (390,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (391,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (392,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (393,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (394,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (395,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (396,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (397,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (398,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (399,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (400,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (401,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (402,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (403,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (404,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (405,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (406,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (407,1140,'491dcd3e-d6a8-475f-82c9-6b4b3ebf33c5',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (408,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (409,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (410,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (411,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (412,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (413,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (414,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (415,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (416,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (417,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (418,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (419,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (420,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (421,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (422,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (423,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (424,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (425,1141,'25cb7ea4-10a7-4358-82c2-ce21f69afaf3',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (426,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (427,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (428,1142,'232e53bf-f4c3-49c7-a4b6-6a201bf17639',80,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (484,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (485,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (486,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (487,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (488,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (489,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (490,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (491,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (492,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (493,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (494,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (495,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (496,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (497,1143,'1c9c2ed8-2c70-4a50-8eb2-2e1c96a53b46',126,NULL,NULL,NULL,N'97225',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (498,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (499,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (500,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (501,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (502,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (503,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (504,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (505,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (506,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (507,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (508,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (509,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (510,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (511,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (512,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (513,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (514,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (515,1144,'0160cda6-55e9-4c5b-908e-7fdad2a8f10b',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (516,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (517,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (518,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (519,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (520,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (521,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (522,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (523,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (524,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (525,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (526,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (527,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (528,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (529,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (530,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (531,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (532,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (533,1144,'fb5fe9e5-49d0-4a10-ae03-47278f98c61e',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (534,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (535,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (536,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (537,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (538,1145,'b16cb84f-9238-4978-bf9a-79a7e9266d26',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (594,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (595,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (596,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (597,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (598,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (599,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (600,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (601,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (602,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (603,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (604,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (605,1146,'b98293ff-05d8-42eb-b324-7cff32da6798',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (606,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (607,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (608,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (609,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (610,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (611,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (612,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (613,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (614,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (615,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (616,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (617,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (618,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (619,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (620,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (621,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (622,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (623,1147,'7a6ec024-c17a-473d-bd57-53179e6ca938',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (624,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (625,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (626,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (627,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (628,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (629,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (630,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (631,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (632,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',85,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (633,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',90,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (634,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (635,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (636,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (637,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (638,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',93,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (639,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (640,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',139,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (641,1147,'627032a9-f9df-4d9a-987e-d114a176ef7f',126,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (642,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',82,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (643,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',81,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (644,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',80,NULL,NULL,NULL,N'7',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (645,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',87,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (646,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',84,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (647,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',86,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (648,1148,'14919419-780f-4348-bcb3-8e8723aa52f3',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (866,1154,'50237dae-576e-4e82-a469-765ea7e30491',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (867,1154,'50237dae-576e-4e82-a469-765ea7e30491',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (868,1154,'50237dae-576e-4e82-a469-765ea7e30491',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (869,1154,'50237dae-576e-4e82-a469-765ea7e30491',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (870,1154,'50237dae-576e-4e82-a469-765ea7e30491',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (871,1154,'50237dae-576e-4e82-a469-765ea7e30491',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (872,1154,'50237dae-576e-4e82-a469-765ea7e30491',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (873,1154,'50237dae-576e-4e82-a469-765ea7e30491',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (874,1154,'50237dae-576e-4e82-a469-765ea7e30491',139,NULL,NULL,{ts '2019-04-23 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (875,1154,'50237dae-576e-4e82-a469-765ea7e30491',126,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (876,1110,'64d9c2b0-55c2-4c17-b191-295bbade0b41',53,NULL,NULL,NULL,N'Spørgeskema',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (877,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',82,NULL,NULL,NULL,N'5',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (878,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',81,NULL,NULL,NULL,N'8',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (879,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',80,NULL,NULL,NULL,N'2',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (880,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',87,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (881,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',84,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (882,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',86,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (883,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',89,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (884,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',88,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (885,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',85,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (886,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',90,NULL,NULL,NULL,N'1',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (887,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',94,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (888,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',95,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (889,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',92,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (890,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',96,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (891,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',93,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (892,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',91,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (893,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',139,NULL,NULL,{ts '2019-04-25 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (894,1157,'08a06d3d-35b2-478d-8e5b-cc86b8e9b399',126,NULL,NULL,NULL,N'13685',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (895,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',53,NULL,NULL,NULL,N'Spørgeskema',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (896,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',148,NULL,NULL,NULL,N'Ingen smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (897,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',141,NULL,NULL,NULL,N'Generelle skuldersmerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (898,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',145,NULL,NULL,NULL,N'LAVESTE skuldersmerteniveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (899,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',144,NULL,NULL,NULL,N'Hvis du samlet skal beskrive hvordan dine generelle skuldersmerter har været over den sidste uge, hvordan har du da haft det? ',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (900,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',142,NULL,NULL,NULL,NULL,N'I de 3 nedenstående smerteskaler skal du beskrive dine skuldersmerter over den sidste uge når de har været lavest, når de  har været højest og det gennemsnitlige smerteniveau.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (901,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',146,NULL,NULL,NULL,N'HØJESTE  skuldersmerteniveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (902,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',149,NULL,NULL,NULL,N'Værst tænkelige smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (903,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',143,NULL,NULL,NULL,N'Hjælp til vurdering af smerter',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (904,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',147,NULL,NULL,NULL,N'GENNEMSNITLIGE  skuldersmerte- niveau du har haft samlet set over den sidste uge',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (905,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',140,NULL,NULL,NULL,NULL,N'Spørgsmålene i dette spørgeskema omhandler dine smerter, dit forbrug af smertestillende medicin, sygedage og eventuel supplerende behandling for dine skuldergener inden for de sidste 7 dage.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (906,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',157,NULL,NULL,NULL,N'Indtast antal',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (907,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',153,NULL,NULL,NULL,N'Hvilket form for smertestillende har du taget og antal over den sidste uge?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (908,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',152,NULL,NULL,NULL,N'Hvor mange dage har du taget smertestillende for din skulder over den sidste uge?',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (909,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',155,NULL,NULL,NULL,N'Ipren/Ibumetin, 200 mg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (910,1110,'bc681236-3b03-4cdb-a1b6-9b666772fd1e',151,NULL,NULL,NULL,N'Har du over den sidste uge taget smertestillende medicin pga. din skulder?',NULL);
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (6,1043,1032,3,N'umbracoFile',N'Upload image',0,0,NULL,NULL,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',0,0,NULL,NULL,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (27,-96,1031,5,N'contents',N'Contents:',0,0,NULL,NULL,'0000001b-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (29,-92,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (32,-92,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (33,-92,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (34,-92,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (50,-92,1044,NULL,N'umbracoMemberPasswordRetrievalAnswer',N'Password Answer',0,0,NULL,NULL,'bd7141e5-4920-407e-a533-aec1ea89ab75');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (51,-92,1044,NULL,N'umbracoMemberPasswordRetrievalQuestion',N'Password Question',1,0,NULL,NULL,'25ac51ae-7619-45ee-8399-6988929e27c4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (54,1068,1069,14,N'heading',N'Heading',0,0,NULL,NULL,'b1dec9cf-9c94-405b-a425-543b4561959e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (53,1060,1064,13,N'title',N'Title',0,0,NULL,NULL,'f01fc48e-7588-414a-91b5-b19b3b58f752');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (69,-49,1075,15,N'isImportant',N'Is important',2,0,NULL,N'Attaches the simple box to the top of the page.','351385af-7f92-402f-bb46-4d5ef86012da');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (56,1076,1075,15,N'body',N'Body',1,0,NULL,NULL,'656da7cb-9df2-4d30-8813-c01a4292b040');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (57,1079,1083,16,N'applicationName',N'Application name',1,0,NULL,NULL,'10a81fd0-ff94-4b47-96fe-8784a9abdf93');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (64,1068,1087,17,N'heading',N'Heading',1,0,NULL,NULL,'bb43b984-9438-4e1f-9b64-6d62eb763b0f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (59,1080,1083,16,N'instructions',N'Instructions',2,0,NULL,NULL,'55fd470a-496a-4900-81a0-9e9bb69f04a0');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (60,1081,1083,16,N'codePlaceholder',N'Code placeholder',3,0,NULL,NULL,'ccb75256-da54-45c4-997a-3412471b9b53');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (61,1082,1083,16,N'loginButtonText',N'Login button text',4,0,NULL,NULL,'a23af896-52f6-489b-9eca-1be41c4362e0');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (62,1086,1087,17,N'number',N'Number',0,0,NULL,NULL,'caefbb89-afac-4149-b405-5588365d46db');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (63,1068,1091,18,N'heading',N'Heading',0,0,NULL,NULL,'a06689c5-3f7f-4b60-ade8-cb265a32eec3');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (123,1134,1130,32,N'autheticationCode',N'AutheticationCode',0,0,NULL,NULL,'6d1a8ec6-b26d-46da-a84b-2a5018fc3caf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (66,1095,1087,17,N'intro',N'Intro',3,0,NULL,NULL,'9ee18ddb-2206-45b1-af7f-516668e55518');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (67,1096,1087,17,N'body',N'Body',4,0,NULL,NULL,'6988b820-cec5-4d36-a7a5-10afa95b8820');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (68,1074,1098,19,N'subheading',N'Subheading',0,0,NULL,NULL,'205cea11-660d-4356-a7bd-949c70de9a19');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (70,1082,1100,20,N'nextButtonText',N'Next Button Text',1,0,NULL,NULL,'ed298f62-f53c-47dc-9f07-684895aa86cb');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (80,1114,1117,22,N'painLow',N'Pain Low',0,0,NULL,NULL,'09c0bf77-8e9e-4379-be06-e0b8c831c917');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (81,1114,1117,22,N'painHigh',N'Pain High',1,0,NULL,NULL,'a2ecb786-f282-488f-8aae-aa59c22ca127');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (82,1114,1117,22,N'painAverage',N'Pain Average',2,0,NULL,NULL,'ada883ce-2b38-4b0f-abf5-0d8e30ff0917');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (84,1116,1117,23,N'daysOnMedication',N'Days on Medication',1,0,NULL,NULL,'4364f918-4c19-47af-b8d6-3dcbcd807f01');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (85,1118,1117,23,N'pamol500',N'Pamol/Panodil 500mg',2,0,NULL,NULL,'4c2205ea-b436-4cad-978d-eac5524a2870');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (86,1118,1117,23,N'ipren200',N'Ipren/Ibumetin 200mg',3,0,NULL,NULL,'96cabc84-faff-497e-b160-491180dac3ee');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (87,1118,1117,23,N'ipren600',N'Ipren/Ibumetin 600mg',4,0,NULL,NULL,'8f3b9c57-6113-4408-b6ef-30566c4fa15c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (88,1119,1117,23,N'otherMedicationType',N'Other Medication Type',5,0,NULL,NULL,'65e9a111-ff87-430b-8066-d0420b198ffa');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (89,1120,1117,23,N'otherMedicationAmount',N'Other Medication Amount',6,0,NULL,NULL,'5d7194ec-dcbb-4879-acc5-7c9c7e0d2ca8');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (90,1116,1117,24,N'daysSick',N'Days Sick',0,0,NULL,NULL,'dbe88d27-9d5f-451a-a7e6-9c101b84113e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (91,-49,1117,25,N'treatmentDoctor',N'Treatment Doctor',0,0,NULL,NULL,'362b84a0-3bc0-44a9-9cd9-f7109435a9c0');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (92,-49,1117,25,N'treatmentPhysiotherapy',N'Treatment Physiotherapy',1,0,NULL,NULL,'5af36747-89a8-402f-baf8-ac4ad014b05c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (93,-49,1117,25,N'treatmentMassage',N'Treatment Massage',2,0,NULL,NULL,'55e46511-bfa0-4ce4-b36b-ca52fe0d4bf6');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (141,1068,1105,41,N'painHeading',N'Pain Heading',0,0,NULL,NULL,'a009f2d7-287c-424d-b095-73b35c2b4ddd');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (142,1155,1105,41,N'painInformationBody',N'Pain Information Body',1,0,NULL,NULL,'6317c81e-f219-4f41-acbb-af30b6a9ec5f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (143,1082,1105,41,N'painInformationHelp',N'Pain Information Help',2,0,NULL,NULL,'5b265b4d-386d-49bb-a80d-f4ad0d564e79');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (144,1074,1105,41,N'painQuestion',N'Pain Question',3,0,NULL,NULL,'1d606531-1811-4fda-98d5-aaaaa0e1ef7c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (145,1074,1105,41,N'painLowSubheading',N'Pain Low Subheading',4,0,NULL,NULL,'9c2ed97e-97f3-4315-a6a5-88d7bcada316');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (146,1074,1105,41,N'painHighSubheading',N'Pain High Subheading',5,0,NULL,NULL,'d4566d04-7182-4c03-bdcf-b6bf95b4f1d4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (147,1074,1105,41,N'painAverageSubheading',N'Pain Average Subheading',6,0,NULL,NULL,'4748fc53-dd1a-4adc-b341-f83d2d2a56d1');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (148,1156,1105,41,N'painLowestLabel',N'Pain Lowest Label',7,0,NULL,NULL,'e4d20943-9b00-462f-b513-47c57456ae94');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (149,1156,1105,41,N'painHighestLabel',N'Pain Highest Label',8,0,NULL,NULL,'8b80672b-c3ed-4d43-8916-caf0e019a485');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (150,1068,1105,43,N'medicationHeading',N'Medication Heading',0,0,NULL,NULL,'5767e0a3-d7cf-4c14-9505-944e75f087d6');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (151,1074,1105,43,N'hasTakenMedicationSubheading',N'Has Taken Medication Subheading',1,0,NULL,NULL,'7b4135ea-f2d9-433c-b572-7265af144d82');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (152,1074,1105,43,N'daysOnMedicationSubheading',N'Days On Medication Subheading',2,0,NULL,NULL,'17badb15-4ee8-420d-b3dc-4c052634cd31');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (153,1074,1105,43,N'medicationTypeAmountSubheading',N'Medication Type Amount Subheading',3,0,NULL,NULL,'856f794a-3fa4-4a83-950a-20720b095d9e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (154,1156,1105,43,N'pamol500Label',N'Pamol 500 Label',4,0,NULL,NULL,'e814fdbc-5fe2-46e4-ba12-797340923daf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (155,1156,1105,43,N'ipren200Label',N'Ipren 200 Label',5,0,NULL,NULL,'9b0def50-227e-47c0-99af-5ba700b1ea38');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (156,1156,1105,43,N'ipren600Label',N'Ipren 600 Label',6,0,NULL,NULL,'865859b9-9612-4b42-a2ab-d77cf770c765');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (157,1081,1105,43,N'enterPiecesPlaceholder',N'Enter Pieces Placeholder',7,0,NULL,NULL,'c6f3448e-7951-41c2-80c8-07a1d20da25f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (158,1156,1105,43,N'otherLabel',N'Other Label',8,0,NULL,NULL,'cacf580e-1a8e-43c1-84c6-ec113c1c9149');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (159,1156,1105,43,N'otherMedicationTypeLabel',N'Other Medication Type Label',9,0,NULL,NULL,'8cba8e2b-ae27-4c9a-bd21-dfa6b26ba2a2');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (160,1081,1105,43,N'otherMedicationTypePlaceholder',N'Other Medication Type Placeholder',10,0,NULL,NULL,'9deaedbd-0790-4ab7-a6af-96a8fb8f416b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (161,1156,1105,43,N'otherMedicationAmountLabel',N'Other Medication Amount Label',11,0,NULL,NULL,'20f32f5e-6a53-4304-9cc2-c0993bab1564');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (162,1081,1105,43,N'otherMedicationAmountPlaceholder',N'Other Medication Amount Placeholder',12,0,NULL,NULL,'d323d37e-6227-421b-9d4f-fdf92bd296a4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (163,1068,1105,44,N'sicknessHeading',N'Sickness Heading',0,0,NULL,NULL,'91bcce88-0447-476c-abe8-2b5bb664e316');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (164,1074,1105,44,N'daysSickSubheading',N'Days Sick Subheading',1,0,NULL,NULL,'fa9bed35-7a58-4d13-bff1-44cba6642f19');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (165,1068,1105,45,N'complimentaryTreatmentHeading',N'Complimentary Treatment Heading',0,0,NULL,NULL,'19b9cc0d-a01f-4374-9282-d9b9ebd668ce');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (166,1155,1105,45,N'complimentaryTreatmentInformation',N'Complimentary Treatment Information',1,0,NULL,NULL,'7cf1cf30-dd8f-49c2-a752-86f111c0234f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (167,1074,1105,45,N'complimentaryTreatmentsSubheading',N'Complimentary Treatments Subheading',2,0,NULL,NULL,'06c3ea68-cc8a-4e82-b9b1-bb2130b1f234');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (168,1074,1105,45,N'hasSeenDoctorSubheading',N'Has Seen Doctor Subheading',3,0,NULL,NULL,'40740d76-803b-4b62-89e6-f6afc82ebc9b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (169,1156,1105,45,N'physiotherapyLabel',N'Physiotherapy Label',4,0,NULL,NULL,'0c628df0-6241-4364-a616-c387271b7a9b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (170,1156,1105,45,N'massageLabel',N'Massage Label',5,0,NULL,NULL,'994a5b31-ecbc-4442-951d-e63ca50f8a99');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (171,1156,1105,45,N'acupunctureLabel',N'Acupuncture Label',6,0,NULL,NULL,'9d7d644d-d238-4b4b-b8d2-c5ff292ef74a');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (172,1156,1105,45,N'chiropractorLabel',N'Chiropractor Label',7,0,NULL,NULL,'7804ad56-3cd3-465a-9412-7134258120ac');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (173,1081,1105,45,N'otherTreatmentPlaceholder',N'Other Treatment Placeholder',8,0,NULL,NULL,'81663c73-fe36-4884-9ffb-20466486558d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (184,1136,1160,49,N'user',N'User',0,0,NULL,NULL,'ff566fc8-e693-41de-a329-967f1b6a7716');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (175,1114,1160,47,N'painBefore',N'Pain Before',0,0,NULL,NULL,'6d55f931-5d4e-4df3-b4e0-7ab866a6fc45');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (176,1119,1160,47,N'medicationTypeBefore',N'Medication Type Before',1,0,NULL,NULL,'0b0ab90e-1507-4452-a7db-d43d62f612dc');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (177,1120,1160,47,N'medicationAmountBefore',N'Medication Amount Before',2,0,NULL,NULL,'d61f8dd3-5178-4419-9169-abf6be81fb5d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (185,1123,1160,49,N'dateFilled',N'Date Filled',1,0,NULL,NULL,'a6d824ce-e608-45c9-816d-f6dd83fd7b41');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (179,1114,1160,48,N'painAfter',N'Pain After',0,0,NULL,NULL,'c23f0a95-f7fb-4a68-b066-add6b3619bc0');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (180,1119,1160,48,N'medicationTypeAfter',N'Medication Type After',1,0,NULL,NULL,'0b337ab7-ab59-45ef-9af2-fca44b2becd0');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (181,1120,1160,48,N'medicationAmountAfter',N'Medication Amount After',2,0,NULL,NULL,'19bfce85-3394-4d18-9026-fb9fb9f7746b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (94,-49,1117,25,N'treatmentAcupuncture',N'Treatment Acupuncture',3,0,NULL,NULL,'6e9ae8b5-cf56-42dc-bce1-0be5382dbb30');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (95,-49,1117,25,N'treatmentChiropractor',N'Treatment Chiropractor',4,0,NULL,NULL,'7753db0b-b1ed-497f-98e8-3b606729c2bf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (96,1121,1117,25,N'otherTreatment',N'Other Treatment',5,0,NULL,NULL,'de8f89eb-df1a-49e6-91ef-bc6bcc5d2a20');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (97,1114,1122,26,N'painAverage',N'Pain Average',2,0,NULL,NULL,'5c2827b5-a737-4505-a227-e607774185f5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (98,1114,1122,26,N'painHigh',N'Pain High',1,0,NULL,NULL,'a9cc9b4f-6b94-4fbd-bcbe-c494252c8712');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (99,1114,1122,26,N'painLow',N'Pain Low',0,0,NULL,NULL,'01fe36cb-ff4e-4d2d-aa16-dfb6c35cfd87');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (100,1118,1122,27,N'ipren600',N'Ipren/Ibumetin 600mg',4,0,NULL,NULL,'271d4a53-59fc-4ad7-83ff-a79aff8aba05');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (101,1116,1122,27,N'daysOnMedication',N'Days on Medication',1,0,NULL,NULL,'97e24e8d-e107-4214-b413-4378e870a7d9');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (102,1118,1122,27,N'ipren200',N'Ipren/Ibumetin 200mg',3,0,NULL,NULL,'ecf2a578-7914-4cc8-8b41-74c5e82f76a7');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (103,1120,1122,27,N'otherMedicationAmount',N'Other Medication Amount',6,0,NULL,NULL,'ea4505f7-ff5a-4e7e-abdb-9816c588fd7e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (104,1119,1122,27,N'otherMedicationType',N'Other Medication Type',5,0,NULL,NULL,'82a6c6be-7a47-4b6c-8747-3c30d3323c1e');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (105,1118,1122,27,N'pamol500',N'Pamol/Panodil 500mg',2,0,NULL,NULL,'7e60aecb-8821-4239-b61a-c726215938e9');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (106,1116,1122,28,N'daysSick',N'Days Sick',0,0,NULL,NULL,'ab226f47-d4d6-4655-b5e7-bf3cc1f963b4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (107,-49,1122,29,N'treatmentAcupuncture',N'Treatment Acupuncture',3,0,NULL,NULL,'69e8fdbf-e603-4882-afb8-0ee55cf35747');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (108,-49,1122,29,N'treatmentChiropractor',N'Treatment Chiropractor',4,0,NULL,NULL,'a8577927-284e-4da6-b1e1-47b580bc8d98');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (109,-49,1122,29,N'treatmentPhysiotherapy',N'Treatment Physiotherapy',1,0,NULL,NULL,'28f5bb32-971f-4a85-8e12-ed736e51e678');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (110,1121,1122,29,N'otherTreatment',N'Other Treatment',5,0,NULL,NULL,'3c8d886f-4e7f-4073-984c-a6aa4bee75ab');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (111,-49,1122,29,N'treatmentMassage',N'Treatment Massage',2,0,NULL,NULL,'8f2837a2-ea73-4d0d-a35a-b6933a93f184');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (112,-49,1122,29,N'treatmentDoctor',N'Treatment Doctor',0,0,NULL,NULL,'3be54de5-5f45-45f6-9907-e96ca34105be');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (182,1127,1160,48,N'sideEffects',N'Side Effects',3,0,NULL,NULL,'6320979b-3a46-42e2-8193-df25f3f0af21');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (183,1126,1160,48,N'comments',N'Comments',4,0,NULL,NULL,'eb2aae17-56a1-4bfd-9b36-f7eafc66b4c4');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (186,1136,1161,50,N'user',N'User',0,0,NULL,NULL,'0c9b0400-24ea-4fb3-8440-fc92b9d16621');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (187,1123,1161,50,N'dateFilled',N'Date Filled',1,0,NULL,NULL,'de439ef5-5e48-44d9-ab7f-0d1d61fe50da');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (124,1134,1131,33,N'autheticationCode',N'AutheticationCode',0,0,NULL,NULL,'1ddaef3c-0bd0-4130-a4bd-dfe76b88f9d2');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (126,1136,1117,35,N'user',N'User',0,0,NULL,NULL,'6d9f0e49-e17f-424d-923e-b842137bbac7');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (127,1136,1122,36,N'user',N'User',0,0,NULL,NULL,'74359a8d-0a08-4094-977a-fd6ac4fa7a53');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (128,-49,1137,37,N'isSupervised',N'Is Supervised',0,0,NULL,NULL,'777bf96b-cad8-4c60-8464-d8d851fba0f8');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (129,1120,1137,37,N'medicationAmountBefore',N'Medication Amount Before',4,0,NULL,NULL,'669000b7-d98d-4c1c-9155-6623e8d2e64d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (130,1123,1137,37,N'dateFilled',N'Date Filled',1,0,NULL,NULL,'9875dfc5-ee7a-4631-8234-540203a13cb3');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (131,1119,1137,37,N'medicationTypeBefore',N'Medication Type Before',3,0,NULL,NULL,'4dedc4f3-6726-4020-ae89-ebee014f9c4a');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (132,1114,1137,37,N'painBefore',N'Pain Before',2,0,NULL,NULL,'1e17b5e8-d343-4b9a-a436-5e12abfb3c82');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (133,1114,1137,38,N'painAfter',N'Pain After',0,0,NULL,NULL,'ba23715c-3903-4ad1-a0a4-6499a89ea496');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (134,1120,1137,38,N'medicationAmountAfter',N'Medication Amount After',2,0,NULL,NULL,'49293b6c-c6dc-4a00-a2db-dc239da70f4c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (135,1127,1137,38,N'sideEffects',N'Side Effects',3,0,NULL,NULL,'5767f735-8e1d-4ecc-8362-d1028ed7ca61');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (136,1119,1137,38,N'medicationTypeAfter',N'Medication Type After',1,0,NULL,NULL,'96c9411b-64cf-41c9-9dec-3ba9c4820fa3');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (137,1126,1137,38,N'comments',N'Comments',4,0,NULL,NULL,'3c5f88ab-b05a-41c6-862f-e39efff0256a');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (138,1136,1137,39,N'user',N'User',0,0,NULL,NULL,'2ff3b051-cbd6-464f-a9a2-379cea7c3921');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (139,1123,1117,35,N'date',N'Date',1,0,NULL,NULL,'28e10e3d-df9e-443b-aa21-5f35d313c819');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (140,1155,1105,42,N'surveyInformation',N'Survey Information',1,0,NULL,NULL,'e574c6cd-1012-434a-b907-576cfefca9fb');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (5,1031,N'Contents',1,'79995fa2-63ee-453c-a29b-2e66f324cdbe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (14,1069,N'Content',0,'4e93037e-4d02-49c7-92db-9dffe39b3462');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (13,1064,N'Content',0,'f390a7a3-8a86-4f57-8ad8-362f2435936b');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (15,1075,N'Content',0,'922c0877-714d-4ad1-9ee3-0e8c288a0cb4');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (16,1083,N'Content',0,'4a02cdd4-9c12-428f-8678-5d19c7c7a03d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (17,1087,N'Content',0,'bf7dd346-d7bd-488d-af2a-3618b56bfab3');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (18,1091,N'Content',0,'66e4db86-2907-435e-842a-ba00256c115c');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (19,1098,N'Content',0,'d8be3099-74e1-48ff-8210-28874cc6b62a');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (20,1100,N'Content',0,'512d3022-73f7-48e0-93ab-dd576c09329d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (22,1117,N'Pain Level',1,'9296732c-6d2a-452e-8a56-1a69b1dac21c');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (23,1117,N'Medication',2,'dfee3090-ab37-4131-85cf-bb82ef971353');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (24,1117,N'Work',3,'58fdc3f2-9675-40d9-bb59-5dd50886d9b8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (25,1117,N'Complimentary Treatment',4,'1e410127-4d01-4fd2-8792-bb1216d56a5a');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (26,1122,N'Pain Level',1,'16861de7-c8e0-473e-8ac9-7a90d61477d6');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (27,1122,N'Medication',2,'2a91a135-50e3-4977-aee4-a73c2b2def06');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (28,1122,N'Work',3,'6fc09875-4e25-4795-af94-e8f888f5781d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (29,1122,N'Complimentary Treatment',4,'54618e02-9af8-4053-9a14-c159ed385807');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (49,1160,N'About',0,'f639e3a7-71f1-438a-b91a-b9a58633820d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (50,1161,N'About',0,'d4b40cd3-0761-44f6-9f71-2c70f8749c08');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (32,1130,N'About',0,'05ad4473-206e-4108-b20c-4ec200a6c528');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (33,1131,N'About',0,'135a0810-85b4-4764-8fc0-670863bf330b');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (47,1160,N'Before Training',1,'c44129d2-572b-4f43-91f3-a8a6e72c62c2');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (35,1117,N'About',0,'87a4441b-aea2-4a49-b4a7-1a04fd488998');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (36,1122,N'About',0,'6e1f7e7f-23aa-42e4-879d-2e557ab03f75');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (37,1137,N'Before Training',1,'a74b8dc7-274b-45e9-99b3-8db032faf173');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (38,1137,N'After Training',2,'af4612a3-aa98-4377-88fb-2a740fdede64');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (39,1137,N'About',0,'9a715d37-92f0-49d5-9fa5-5cc3815d08fc');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (42,1105,N'Content',0,'015ebee3-9036-465d-a41f-a7db9e9127a2');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (41,1105,N'Pain',1,'64ff4be7-44bd-4ea4-b3cc-a681f62c8dcf');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (43,1105,N'Medication',2,'f5125d4d-3995-466c-84cf-18d740abe472');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (44,1105,N'Sickness/absence',3,'7ef589c3-092d-49a0-999b-a25b67dc264a');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (45,1105,N'Complimentary Treatment',4,'bfb7bd9e-5aff-43d2-b2f1-ec7e7d229202');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (48,1160,N'After Training',2,'b08905fd-0146-4967-a85c-d85cc745f652');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [umbracoAudit] ON;
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (1,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-09 07:59:37.183'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (2,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-09 07:59:37.360'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (3,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-04-09 08:19:15.467'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (4,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-04-09 08:19:15.630'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (5,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-09 09:19:26.987'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (6,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-09 09:19:27.153'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (7,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 17:29:29.673'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (8,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 17:29:29.870'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (9,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 18:00:29.750'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (10,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 18:00:29.917'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (11,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 18:21:01.087'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (12,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-10 18:21:01.320'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (13,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 07:19:25.897'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (14,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 07:19:26.067'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (15,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 07:42:06.300'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (16,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 07:42:06.500'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (17,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 08:13:17.710'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (18,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 08:13:17.813'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (19,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 09:33:12.267'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (20,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 09:33:12.427'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (21,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 09:55:25.107'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (22,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-11 09:55:25.290'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (23,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-12 07:58:46.397'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (24,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-12 07:58:46.573'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (25,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-21 11:00:39.100'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (26,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-21 11:00:39.263'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (27,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-22 10:16:42.383'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (28,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-22 10:16:42.540'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (29,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-04-22 10:36:23.453'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (30,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-04-22 10:36:23.617'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (31,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-22 12:48:04.267'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (32,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-22 12:48:04.417'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (33,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 08:12:06.723'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (34,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 08:12:06.913'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (35,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 08:35:20.517'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (36,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 08:35:20.673'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (37,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 09:50:10.127'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (38,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 09:50:10.277'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (39,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 10:53:10.033'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (40,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 10:53:10.217'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (41,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 11:44:25.040'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (42,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-23 11:44:25.140'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (43,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-25 11:05:48.733'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (44,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-25 11:05:48.950'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (45,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 12:24:27.200'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (46,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 12:24:27.493'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (47,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 12:50:30.367'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (48,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 12:50:30.580'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (49,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 13:25:51.460'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (50,0,N'User "SYSTEM" ',N'::1',{ts '2019-04-26 13:25:51.837'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (51,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 10:31:21.477'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (52,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 10:31:21.900'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (53,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-05-03 10:50:59.863'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (54,0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'::1',{ts '2019-05-03 10:51:00.217'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (55,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 11:22:41.313'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (56,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 11:22:41.347'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (57,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 11:22:41.357'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (58,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-03 11:22:41.447'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (59,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-06 09:54:38.073'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (60,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-06 09:54:38.557'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (61,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-06 10:02:53.067'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (62,0,N'User "SYSTEM" ',N'::1',{ts '2019-05-06 10:02:53.420'},0,N'User "Uffe Christiansen" <uffechristiansen@live.com>',N'umbraco/user/sign-in/login',N'login success');
GO
SET IDENTITY_INSERT [umbracoAudit] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] ON;
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (265,{ts '2019-05-03 11:31:26.883'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Alias\":\"groupADiary\",\"Id\":1124,\"PropertyTypeIds\":[],\"Type\":\"IContentType\",\"AliasChanged\":false,\"PropertyRemoved\":false,\"PropertyTypeAliasChanged\":false,\"DescendantPayloads\":[],\"WasDeleted\":false,\"IsNew\":false}]"}]',N'DESKTOP-NRI72M1//LM/W3SVC/2/ROOT [P16256/D2] D5756660EFDA4FDEAF3878D776281B4B',1);
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [umbracoConsent] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoLock] ON;
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (-331,1,N'Servers');
GO
SET IDENTITY_INSERT [umbracoLock] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,0,{ts '2019-04-09 10:00:45.107'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (2,0,1061,{ts '2019-04-09 10:00:53.290'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (3,0,0,{ts '2019-04-09 10:01:26.240'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (4,0,1063,{ts '2019-04-09 10:01:26.353'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (5,0,1062,{ts '2019-04-09 10:01:35.890'},N'Delete',N'Delete Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (6,0,1064,{ts '2019-04-09 10:02:13.877'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (7,0,1063,{ts '2019-04-09 10:02:28.977'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (8,0,1065,{ts '2019-04-09 10:02:55.547'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (9,0,1066,{ts '2019-04-09 10:04:03.370'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (10,0,1066,{ts '2019-04-09 10:06:16.733'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (11,0,1064,{ts '2019-04-09 10:19:57.960'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (12,0,1063,{ts '2019-04-09 10:20:10.310'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (13,0,1061,{ts '2019-04-09 10:20:33.537'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (14,0,1067,{ts '2019-04-09 10:21:09.487'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (15,0,-1,{ts '2019-04-09 10:21:34.227'},N'Delete',N'Delete Content of Types 1067 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (16,0,1067,{ts '2019-04-09 10:21:34.277'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (17,0,0,{ts '2019-04-09 10:23:06.167'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (18,0,1069,{ts '2019-04-09 10:24:33.600'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (19,0,1061,{ts '2019-04-09 10:25:10.817'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (20,0,1071,{ts '2019-04-09 10:26:10.320'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (21,0,1072,{ts '2019-04-09 10:26:28.427'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (22,0,1073,{ts '2019-04-09 10:26:50.593'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (23,0,1066,{ts '2019-04-09 10:27:00.560'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (24,0,1065,{ts '2019-04-09 10:27:13.723'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (25,0,1061,{ts '2019-04-09 10:37:24.003'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (26,0,1069,{ts '2019-04-09 10:37:36.597'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (27,0,-1,{ts '2019-04-09 10:44:20.063'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (28,0,1061,{ts '2019-04-09 10:44:20.073'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (29,0,-1,{ts '2019-04-09 10:44:32.907'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (30,0,1069,{ts '2019-04-09 10:44:32.907'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (31,0,1064,{ts '2019-04-09 10:47:44.727'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (32,0,0,{ts '2019-04-09 10:49:37.477'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (33,0,1075,{ts '2019-04-09 10:49:48.607'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (34,0,1069,{ts '2019-04-09 10:50:09.800'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (35,0,0,{ts '2019-04-09 10:51:37.430'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (36,0,1075,{ts '2019-04-09 10:51:44.127'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (37,0,1077,{ts '2019-04-09 10:52:21.333'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (38,0,1078,{ts '2019-04-09 10:53:18.020'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (39,0,1078,{ts '2019-04-09 10:53:46.640'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (40,0,1077,{ts '2019-04-09 10:53:52.330'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (41,0,1061,{ts '2019-04-10 19:30:24.533'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (42,0,1063,{ts '2019-04-10 19:30:48.337'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (43,0,1069,{ts '2019-04-10 19:31:26.757'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (44,0,1075,{ts '2019-04-10 19:32:36.057'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (45,0,1063,{ts '2019-04-10 19:32:46.837'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (46,0,0,{ts '2019-04-10 19:36:15.253'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (47,0,0,{ts '2019-04-10 19:38:17.493'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (48,0,0,{ts '2019-04-10 19:39:53.760'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (49,0,0,{ts '2019-04-10 19:41:00.537'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (50,0,1082,{ts '2019-04-10 19:41:09.010'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (51,0,1083,{ts '2019-04-10 19:42:07.050'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (100,0,1100,{ts '2019-04-21 13:07:42.300'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (101,0,1100,{ts '2019-04-21 13:07:53.363'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (102,0,1063,{ts '2019-04-21 13:08:19.693'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (103,0,1101,{ts '2019-04-21 13:08:43.390'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (104,0,1102,{ts '2019-04-21 13:09:49.323'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (105,0,1075,{ts '2019-04-21 13:10:23.953'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (106,0,1102,{ts '2019-04-21 13:10:50.467'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (107,0,1103,{ts '2019-04-21 13:11:33.163'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (108,0,1075,{ts '2019-04-21 13:13:11.327'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (109,0,1097,{ts '2019-04-21 13:18:26.530'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (110,0,1093,{ts '2019-04-21 13:18:30.987'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (111,0,1100,{ts '2019-04-21 13:29:55.563'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (112,0,1100,{ts '2019-04-21 13:45:38.410'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (113,0,1085,{ts '2019-04-21 13:58:29.847'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (114,0,1104,{ts '2019-04-21 14:01:17.027'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (115,0,1105,{ts '2019-04-21 14:03:39.350'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (116,0,1106,{ts '2019-04-21 14:03:48.530'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (117,0,1107,{ts '2019-04-21 14:04:04.290'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (118,0,1104,{ts '2019-04-21 14:04:59.050'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (119,0,-1,{ts '2019-04-21 14:05:50.957'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (120,0,1106,{ts '2019-04-21 14:05:50.957'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (121,0,-1,{ts '2019-04-21 14:06:08.993'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (122,0,1105,{ts '2019-04-21 14:06:08.997'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (123,0,1104,{ts '2019-04-21 14:06:37.383'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (124,0,1107,{ts '2019-04-21 14:07:13.800'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (125,0,1106,{ts '2019-04-21 14:07:39.683'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (126,0,1106,{ts '2019-04-21 14:07:55.213'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (127,0,1104,{ts '2019-04-21 14:08:05.527'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (128,0,1105,{ts '2019-04-21 14:08:25.077'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (129,0,1063,{ts '2019-04-21 14:08:56.387'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (130,0,1083,{ts '2019-04-21 14:09:06.610'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (131,0,1063,{ts '2019-04-21 14:09:14.457'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (132,0,1101,{ts '2019-04-21 14:09:43.483'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (133,0,1103,{ts '2019-04-21 14:09:55.363'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (134,0,1108,{ts '2019-04-21 14:10:31.490'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (135,0,1109,{ts '2019-04-21 14:10:55.353'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (136,0,1110,{ts '2019-04-21 14:11:11.973'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (137,0,0,{ts '2019-04-22 12:44:49.630'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (138,0,1114,{ts '2019-04-22 12:45:08.277'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (139,0,0,{ts '2019-04-22 12:47:52.933'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (140,0,0,{ts '2019-04-22 12:49:46.470'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (141,0,1117,{ts '2019-04-22 12:55:10.110'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (142,0,0,{ts '2019-04-22 12:57:36.657'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (143,0,1118,{ts '2019-04-22 12:57:47.927'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (144,0,0,{ts '2019-04-22 13:01:07.240'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (145,0,0,{ts '2019-04-22 13:01:51.277'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (146,0,0,{ts '2019-04-22 13:10:01.400'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (147,0,1117,{ts '2019-04-22 13:10:36.983'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (148,0,-1,{ts '2019-04-22 13:11:22.480'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (149,0,1122,{ts '2019-04-22 13:11:22.483'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (294,0,1160,{ts '2019-05-03 12:47:47.667'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (295,0,-1,{ts '2019-05-03 12:48:39.120'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (296,0,1161,{ts '2019-05-03 12:48:39.123'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (297,0,1160,{ts '2019-05-03 12:49:36.807'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (298,0,1160,{ts '2019-05-03 12:52:34.737'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (299,0,1160,{ts '2019-05-03 12:52:43.747'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (300,0,1124,{ts '2019-05-03 12:53:47.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (301,0,1159,{ts '2019-05-03 12:53:50.927'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (302,0,1159,{ts '2019-05-03 12:54:01.700'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (303,0,1160,{ts '2019-05-03 13:02:19.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (304,0,1124,{ts '2019-05-03 13:03:50.790'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (305,0,1160,{ts '2019-05-03 13:04:06.997'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (306,0,1159,{ts '2019-05-03 13:26:41.227'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (307,0,-1,{ts '2019-05-03 13:26:49.907'},N'Delete',N'Delete Content of Types 1159 performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (308,0,1159,{ts '2019-05-03 13:26:49.980'},N'Delete',N'Delete ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (309,0,1160,{ts '2019-05-03 13:27:11.650'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (310,0,1124,{ts '2019-05-03 13:27:29.960'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (311,0,1160,{ts '2019-05-03 13:28:15.840'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (312,0,1161,{ts '2019-05-03 13:29:18.977'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (313,0,1124,{ts '2019-05-03 13:31:26.477'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (314,0,-1,{ts '2019-05-06 11:55:05.397'},N'PackagerInstall',N'Package ''Export SQL Server Compact'' installed. Package guid: bf31305f-ae50-400c-9fdb-9ed19cae73be');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (315,0,-1,{ts '2019-05-06 11:55:18.570'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (52,0,1063,{ts '2019-04-10 20:22:12.703'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (53,0,1063,{ts '2019-04-10 20:22:23.137'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (54,0,1063,{ts '2019-04-10 20:23:05.250'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (55,0,1084,{ts '2019-04-10 20:24:13.207'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (56,0,1084,{ts '2019-04-10 20:32:19.360'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (57,0,1084,{ts '2019-04-10 20:32:19.373'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (58,0,1084,{ts '2019-04-10 20:32:19.857'},N'Delete',N'Trashed content with Id: 1084 related to original parent content with Id: 1065');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (59,0,1085,{ts '2019-04-10 20:45:56.940'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (60,0,1069,{ts '2019-04-11 10:14:42.417'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (61,0,1069,{ts '2019-04-11 10:16:50.043'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (62,0,1075,{ts '2019-04-11 10:17:04.947'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (63,0,0,{ts '2019-04-11 10:22:04.247'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (64,0,1087,{ts '2019-04-11 10:22:19.963'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (65,0,1089,{ts '2019-04-11 10:24:10.753'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (66,0,1068,{ts '2019-04-11 10:25:24.487'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (67,0,-1,{ts '2019-04-11 10:26:09.420'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (68,0,1069,{ts '2019-04-11 10:26:09.423'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (69,0,1083,{ts '2019-04-11 10:26:49.093'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (70,0,-1,{ts '2019-04-11 10:27:26.387'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (71,0,1064,{ts '2019-04-11 10:27:26.393'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (72,0,1091,{ts '2019-04-11 10:29:09.183'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (73,0,1089,{ts '2019-04-11 10:30:07.637'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (74,0,1083,{ts '2019-04-11 10:34:50.417'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (75,0,1089,{ts '2019-04-11 10:35:15.980'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (76,0,1089,{ts '2019-04-11 10:35:24.937'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (77,0,1061,{ts '2019-04-11 10:35:51.170'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (78,0,1093,{ts '2019-04-11 10:36:11.397'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (79,0,1072,{ts '2019-04-11 10:36:18.627'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (80,0,1072,{ts '2019-04-11 10:36:18.633'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (81,0,1072,{ts '2019-04-11 10:36:18.960'},N'Delete',N'Trashed content with Id: 1072 related to original parent content with Id: 1066');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (82,0,1093,{ts '2019-04-11 10:36:42.637'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (83,0,1093,{ts '2019-04-11 10:36:47.967'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (84,0,1066,{ts '2019-04-11 10:37:21.043'},N'Sort',N'Sort child items performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (85,0,0,{ts '2019-04-11 11:35:51.157'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (86,0,0,{ts '2019-04-11 11:37:07.150'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (87,0,0,{ts '2019-04-11 11:39:12.603'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (88,0,-1,{ts '2019-04-11 11:39:24.970'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (89,0,1087,{ts '2019-04-11 11:39:24.973'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (90,0,1097,{ts '2019-04-11 11:41:31.750'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (91,0,-1,{ts '2019-04-21 13:02:21.007'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (92,0,1075,{ts '2019-04-21 13:02:21.010'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (93,0,1074,{ts '2019-04-21 13:03:28.607'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (94,0,1098,{ts '2019-04-21 13:03:54.597'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (95,0,-1,{ts '2019-04-21 13:04:21.317'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (96,0,1098,{ts '2019-04-21 13:04:21.320'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (97,0,0,{ts '2019-04-21 13:05:46.720'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (98,0,1075,{ts '2019-04-21 13:05:57.027'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (99,0,1100,{ts '2019-04-21 13:07:12.117'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (150,0,0,{ts '2019-04-22 13:14:44.030'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (151,0,1124,{ts '2019-04-22 13:19:04.297'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (152,0,0,{ts '2019-04-22 13:24:42.640'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (153,0,0,{ts '2019-04-22 13:25:12.717'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (154,0,0,{ts '2019-04-22 13:25:33.383'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (155,0,-1,{ts '2019-04-22 13:25:38.753'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (156,0,1124,{ts '2019-04-22 13:25:38.753'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (157,0,1115,{ts '2019-04-22 13:25:49.437'},N'Delete',N'Delete DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (158,0,1125,{ts '2019-04-22 13:27:37.567'},N'Delete',N'Delete DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (159,0,1127,{ts '2019-04-22 13:27:42.207'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (160,0,1094,{ts '2019-04-22 13:29:35.530'},N'Delete',N'Delete DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (161,0,1075,{ts '2019-04-22 13:31:10.160'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (162,0,1099,{ts '2019-04-22 13:31:20.803'},N'Delete',N'Delete DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (163,0,1129,{ts '2019-04-22 13:34:59.950'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (164,0,1129,{ts '2019-04-22 13:36:11.097'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (165,0,1124,{ts '2019-04-22 13:38:06.437'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (166,0,1130,{ts '2019-04-22 13:38:53.603'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (167,0,1131,{ts '2019-04-22 13:39:01.320'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (168,0,1132,{ts '2019-04-22 13:41:43.480'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (169,0,1133,{ts '2019-04-22 13:41:57.823'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (170,0,0,{ts '2019-04-22 13:43:39.717'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (171,0,1130,{ts '2019-04-22 13:43:43.853'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (172,0,1131,{ts '2019-04-22 13:44:07.490'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (173,0,1135,{ts '2019-04-22 13:44:32.990'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (174,0,0,{ts '2019-04-22 13:45:50.227'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (175,0,1124,{ts '2019-04-22 13:46:01.080'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (176,0,1117,{ts '2019-04-22 13:46:55.983'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (177,0,1136,{ts '2019-04-22 13:47:25.327'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (178,0,-1,{ts '2019-04-22 13:47:28.237'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (179,0,1124,{ts '2019-04-22 13:47:28.240'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (180,0,1117,{ts '2019-04-22 13:47:53.853'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (181,0,1122,{ts '2019-04-22 13:48:22.957'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (182,0,1122,{ts '2019-04-22 13:48:54.793'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (183,0,1117,{ts '2019-04-22 13:49:49.293'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (184,0,1117,{ts '2019-04-22 13:49:56.803'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (185,0,1124,{ts '2019-04-22 13:50:37.420'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (186,0,1124,{ts '2019-04-22 14:04:44.527'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (187,0,1129,{ts '2019-04-22 14:04:54.627'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (188,0,-1,{ts '2019-04-22 14:06:04.547'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (189,0,1137,{ts '2019-04-22 14:06:04.550'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (190,0,1129,{ts '2019-04-22 14:06:18.620'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (191,0,1138,{ts '2019-04-22 14:06:35.430'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (192,0,1139,{ts '2019-04-22 14:09:55.337'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (193,0,1123,{ts '2019-04-22 14:11:01.340'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (194,0,1117,{ts '2019-04-22 14:11:10.920'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (195,0,1139,{ts '2019-04-22 14:11:44.977'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (196,0,0,{ts '2019-04-22 14:26:44.847'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (197,0,0,{ts '2019-04-22 14:37:44.397'},N'Save',N'Save Content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (198,0,1139,{ts '2019-04-22 14:48:17.860'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (199,0,1142,{ts '2019-04-22 15:05:10.800'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (200,0,1143,{ts '2019-04-22 15:05:53.017'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (201,0,1144,{ts '2019-04-22 15:07:46.557'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (202,0,1145,{ts '2019-04-22 15:20:14.763'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (203,0,1146,{ts '2019-04-23 10:15:36.490'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (204,0,1147,{ts '2019-04-23 10:16:44.600'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (205,0,1148,{ts '2019-04-23 10:34:56.023'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (206,0,1149,{ts '2019-04-23 10:37:27.193'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (207,0,1150,{ts '2019-04-23 11:49:06.807'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (208,0,1151,{ts '2019-04-23 11:51:04.690'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (209,0,1124,{ts '2019-04-23 11:51:58.883'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (210,0,1117,{ts '2019-04-23 11:52:13.730'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (211,0,1137,{ts '2019-04-23 11:52:22.677'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (212,0,1122,{ts '2019-04-23 11:52:34.193'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (213,0,1130,{ts '2019-04-23 11:53:05.227'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (214,0,1131,{ts '2019-04-23 11:53:21.327'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (215,0,1152,{ts '2019-04-23 11:55:38.123'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (216,0,1153,{ts '2019-04-23 11:58:00.297'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (217,0,1139,{ts '2019-04-23 12:08:12.360'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (218,0,1139,{ts '2019-04-23 12:08:12.390'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (219,0,1139,{ts '2019-04-23 12:08:12.870'},N'Delete',N'Trashed content with Id: 1139 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (220,0,1140,{ts '2019-04-23 12:08:18.353'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (221,0,1140,{ts '2019-04-23 12:08:18.567'},N'Delete',N'Trashed content with Id: 1140 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (222,0,1141,{ts '2019-04-23 12:08:23.687'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (223,0,1141,{ts '2019-04-23 12:08:23.897'},N'Delete',N'Trashed content with Id: 1141 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (224,0,1142,{ts '2019-04-23 12:08:28.743'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (225,0,1142,{ts '2019-04-23 12:08:28.763'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (226,0,1142,{ts '2019-04-23 12:08:29.110'},N'Delete',N'Trashed content with Id: 1142 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (227,0,1143,{ts '2019-04-23 12:08:34.147'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (228,0,1143,{ts '2019-04-23 12:08:34.167'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (229,0,1143,{ts '2019-04-23 12:08:34.473'},N'Delete',N'Trashed content with Id: 1143 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (230,0,1144,{ts '2019-04-23 12:08:41.897'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (231,0,1144,{ts '2019-04-23 12:08:41.913'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (232,0,1144,{ts '2019-04-23 12:08:42.217'},N'Delete',N'Trashed content with Id: 1144 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (233,0,1145,{ts '2019-04-23 12:08:47.940'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (234,0,1145,{ts '2019-04-23 12:08:47.957'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (235,0,1145,{ts '2019-04-23 12:08:48.253'},N'Delete',N'Trashed content with Id: 1145 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (236,0,1146,{ts '2019-04-23 12:08:53.880'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (237,0,1146,{ts '2019-04-23 12:08:53.897'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (238,0,1146,{ts '2019-04-23 12:08:54.203'},N'Delete',N'Trashed content with Id: 1146 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (239,0,1147,{ts '2019-04-23 12:08:59.387'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (240,0,1147,{ts '2019-04-23 12:08:59.403'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (241,0,1147,{ts '2019-04-23 12:08:59.727'},N'Delete',N'Trashed content with Id: 1147 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (242,0,1148,{ts '2019-04-23 12:09:05.440'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (243,0,1148,{ts '2019-04-23 12:09:05.457'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (244,0,1148,{ts '2019-04-23 12:09:05.773'},N'Delete',N'Trashed content with Id: 1148 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (245,0,1149,{ts '2019-04-23 12:09:11.830'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (246,0,1149,{ts '2019-04-23 12:09:11.850'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (247,0,1149,{ts '2019-04-23 12:09:12.137'},N'Delete',N'Trashed content with Id: 1149 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (248,0,1150,{ts '2019-04-23 12:09:18.083'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (249,0,1150,{ts '2019-04-23 12:09:18.103'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (250,0,1150,{ts '2019-04-23 12:09:18.393'},N'Delete',N'Trashed content with Id: 1150 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (251,0,1151,{ts '2019-04-23 12:09:24.623'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (252,0,1151,{ts '2019-04-23 12:09:24.643'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (253,0,1151,{ts '2019-04-23 12:09:24.937'},N'Delete',N'Trashed content with Id: 1151 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (254,0,1152,{ts '2019-04-23 12:09:30.227'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (255,0,1152,{ts '2019-04-23 12:09:30.253'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (256,0,1152,{ts '2019-04-23 12:09:30.577'},N'Delete',N'Trashed content with Id: 1152 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (257,0,1153,{ts '2019-04-23 12:09:36.903'},N'UnPublish',N'UnPublish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (258,0,1153,{ts '2019-04-23 12:09:36.920'},N'Move',N'Move Content to Recycle Bin performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (259,0,1153,{ts '2019-04-23 12:09:37.213'},N'Delete',N'Trashed content with Id: 1153 related to original parent content with Id: 1138');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (260,0,1154,{ts '2019-04-23 12:15:29.400'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (261,0,1110,{ts '2019-04-23 12:53:52.550'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (262,0,0,{ts '2019-04-23 13:50:59.750'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (263,0,1155,{ts '2019-04-23 13:51:36.883'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (264,0,1155,{ts '2019-04-23 13:51:53.110'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (265,0,1068,{ts '2019-04-23 13:53:41.080'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (266,0,1155,{ts '2019-04-23 13:55:23.660'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (267,0,1155,{ts '2019-04-23 13:55:48.763'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (268,0,1082,{ts '2019-04-23 13:56:42.490'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (269,0,1074,{ts '2019-04-23 13:57:57.690'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (270,0,0,{ts '2019-04-23 14:00:45.053'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (271,0,1105,{ts '2019-04-23 14:01:08.757'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (272,0,1105,{ts '2019-04-23 14:01:30.217'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (273,0,1157,{ts '2019-04-25 13:06:39.460'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (274,0,1081,{ts '2019-04-25 13:13:10.357'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (275,0,1105,{ts '2019-04-25 13:15:33.133'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (276,0,1105,{ts '2019-04-25 13:18:16.587'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (277,0,1110,{ts '2019-04-25 13:27:20.997'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (278,0,-1,{ts '2019-04-25 13:28:39.243'},N'Publish',N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (279,0,1105,{ts '2019-04-25 13:28:39.250'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (280,0,1110,{ts '2019-04-25 13:29:08.347'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (281,0,1154,{ts '2019-04-26 14:30:48.600'},N'Publish',N'Save and Publish performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (282,0,1130,{ts '2019-05-03 12:31:49.660'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (283,0,1131,{ts '2019-05-03 12:32:07.253'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (284,0,1124,{ts '2019-05-03 12:39:14.727'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (285,0,1124,{ts '2019-05-03 12:40:58.220'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (286,0,1137,{ts '2019-05-03 12:41:53.720'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (287,0,1158,{ts '2019-05-03 12:42:48.787'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (288,0,1158,{ts '2019-05-03 12:43:53.093'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (289,0,1159,{ts '2019-05-03 12:44:42.873'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (290,0,1159,{ts '2019-05-03 12:45:19.403'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (291,0,1159,{ts '2019-05-03 12:45:49.437'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (292,0,1159,{ts '2019-05-03 12:46:16.027'},N'Save',N'Save ContentType performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (293,0,1124,{ts '2019-05-03 12:47:01.257'},N'Save',N'Save ContentType performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoMigration] ON;
GO
INSERT INTO [umbracoMigration] ([id],[name],[createDate],[version]) VALUES (1,N'Umbraco',{ts '2019-04-09 09:30:25.657'},N'7.14.0');
GO
SET IDENTITY_INSERT [umbracoMigration] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2019-04-09 09:30:20.340'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2019-04-09 09:30:20.350'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2019-04-09 09:30:20.350'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'Checkbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-95,0,-1,0,1,N'-1,-95',2,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.360'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-96,0,-1,0,1,N'-1,-96',2,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-97,0,-1,0,1,N'-1,-97',2,'aa2c52a0-ce87-4e65-a47c-7df09358585d',N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2019-04-09 09:30:20.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2019-04-09 09:30:20.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2019-04-09 09:30:20.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1044,0,-1,0,1,N'-1,1044',0,'d59be02f-1df9-4228-aa1e-01917d806cda',N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1046,0,-1,0,1,N'-1,1046',2,'fd1e0da5-5606-4862-b679-5d0cf3a52a59',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1047,0,-1,0,1,N'-1,1047',2,'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1048,0,-1,0,1,N'-1,1048',2,'135d60e0-64d9-49ed-ab08-893c9ba44ae5',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1049,0,-1,0,1,N'-1,1049',2,'9dbbcbbb-2327-434a-b355-af1b84e5010a',N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.370'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1050,0,-1,0,1,N'-1,1050',2,'b4e3535a-1753-47e2-8568-602cf8cfee6f',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 09:30:20.370'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1060,0,1128,0,2,N'-1,1128,1060',9,'cb2014a7-b751-4e17-95ca-401545c3a458',N'Title textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 10:00:45.043'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1061,0,1090,0,2,N'-1,1090,1061',5,'bb5dc0ce-491a-4a3b-9e13-c6df0c1fd3f0',N'Guide','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-09 10:00:53.220'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1064,0,1070,0,2,N'-1,1070,1064',3,'bc4d7363-b890-4e05-b679-1e467abd068f',N'Base section','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-09 10:02:13.837'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1063,0,1090,0,2,N'-1,1090,1063',21,'accbb087-577f-42ac-b095-a44d62971bd4',N'Home','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-09 10:01:26.310'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1065,0,-1,0,1,N'-1,1065',0,'7021da52-54ba-414d-9606-a0e4a2731d4e',N'Overview','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:02:55.510'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1066,0,1065,0,2,N'-1,1065,1066',0,'8a182883-7e24-4e35-be1a-69e807dd0062',N'Guide','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:04:03.353'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1068,0,1128,0,2,N'-1,1128,1068',5,'89071cc0-7ba3-4ca2-9f78-98a710a3b96e',N'Heading','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 10:23:06.103'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1069,0,1088,0,2,N'-1,1088,1069',2,'4411b252-5f39-49fd-8674-723ab5e7ff42',N'Content box page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-09 10:24:33.550'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1070,0,-1,0,1,N'-1,1070',0,'d41d9f50-62c6-4a81-8f5b-694acd5d680b',N'Compositions','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-09 10:24:42.653'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1071,0,1066,0,3,N'-1,1065,1066,1071',0,'af5ba885-8ea1-470e-8c07-fd31fcea28dc',N'About program','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:26:10.283'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1072,1,-20,0,1,N'-1,-20,1072',2,'13125c61-b4b4-4938-899d-9837c736e68f',N'Exercises','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:26:28.410'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1073,0,1066,0,3,N'-1,1065,1066,1073',2,'a2c82e34-4a27-446b-9c26-51bf6ed991a8',N'About training','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:26:50.580'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1074,0,1128,0,2,N'-1,1128,1074',16,'314f4157-1a00-452b-bf89-5e7af22bb5be',N'Subheading','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 10:49:37.420'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1075,0,1092,0,2,N'-1,1092,1075',8,'4ad3ac4b-6d6f-426c-a5a3-a80eaa2be0cd',N'Simple box','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-09 10:49:48.557'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1076,0,1128,0,2,N'-1,1128,1076',17,'c19418e1-33e1-497b-b531-abd166a43106',N'Content box body','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-09 10:51:37.387'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1077,0,1071,0,4,N'-1,1065,1066,1071,1077',0,'dd4a9fb3-c395-4db6-9c44-dd55a3a5b29b',N'How does the program work?','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:52:21.297'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1078,0,1071,0,4,N'-1,1065,1066,1071,1078',1,'51040a79-7abd-4fb1-b06d-3047907b8f89',N'General recommendations','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-09 10:53:17.997'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1079,0,1128,0,2,N'-1,1128,1079',18,'2099a38a-b825-4b20-965c-a2ac4724c457',N'Application name textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-10 19:36:15.193'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1080,0,1128,0,2,N'-1,1128,1080',10,'2ff34458-cc15-43bc-a3fb-bdaadc87587d',N'Subheading textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-10 19:38:17.440'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1081,0,1128,0,2,N'-1,1128,1081',8,'f57e5445-3f80-460d-9b97-c4fdae087cf4',N'Input Placeholder','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-10 19:39:53.697'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1082,0,1128,0,2,N'-1,1128,1082',1,'d48a1152-ad34-486d-9246-2c0795475ec3',N'Button text','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-10 19:41:00.497'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1083,0,1090,0,2,N'-1,1090,1083',20,'d5674d58-5fb1-44fa-976d-a29ab944bee8',N'Login','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-10 19:42:06.977'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1084,1,-20,0,1,N'-1,-20,1084',1,'8cdb6763-a344-4679-a559-fd31cb6bc743',N'Login','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-10 20:24:13.157'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1085,0,1065,0,2,N'-1,1065,1085',1,'f3e29d38-b828-4524-8b5f-08f09f5b76a8',N'Login','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-10 20:45:56.890'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1086,0,1128,0,2,N'-1,1128,1086',4,'371b607e-9fcd-4e0e-9a3e-dde440215a4e',N'Exercise number decimal','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-11 10:22:04.187'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1087,0,1092,0,2,N'-1,1092,1087',3,'92f5d0c5-8d00-44f1-a6ad-4505f7067cdd',N'Exercise','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-11 10:22:19.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1088,0,-1,0,1,N'-1,1088',0,'ad127ddd-293c-471a-9421-36e07c2c50ba',N'Pages','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-11 10:23:30.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1089,0,1088,0,2,N'-1,1088,1089',4,'f4363dd9-146f-4fbc-8ec0-8b1faccf3af8',N'Exercises','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-11 10:24:10.713'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1090,0,-1,0,1,N'-1,1090',0,'b255c39c-2fd2-4af3-a9c0-bac34445a5cb',N'Sections','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-11 10:28:38.797'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1091,0,1070,0,2,N'-1,1070,1091',1,'e596bcb9-692e-4d60-8f72-b69c5d53631c',N'Base page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-11 10:29:09.133'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1092,0,-1,0,1,N'-1,1092',0,'bc5a34ab-da1a-462e-996a-ac36456cfaec',N'Components','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-11 10:32:27.150'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1093,0,1066,0,3,N'-1,1065,1066,1093',1,'30ef99ce-9043-42a1-b5f3-71b690c0c5be',N'Exercises','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-11 10:36:11.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1129,0,1111,0,2,N'-1,1111,1129',18,'f111f389-18c9-46a4-86a1-efa71e1a9832',N'Submissions Directory','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:34:59.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1095,0,1128,0,2,N'-1,1128,1095',6,'754023c4-8b0c-4249-bd5e-f9509eaba199',N'Intro textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-11 11:37:07.077'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1096,0,-1,0,1,N'-1,1096',35,'852e641c-5c91-430e-90f1-0431d5ad7027',N'Body rich text editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-11 11:39:12.563'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1097,0,1093,0,4,N'-1,1065,1066,1093,1097',0,'1b0dfcb0-c3cb-4400-a6bb-9723d0a5f343',N'Exercise 1','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-11 11:41:31.707'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1098,0,1070,0,2,N'-1,1070,1098',4,'96a7f899-4ab5-4f51-b81a-e346c04c3b6f',N'Base content box','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 13:03:54.540'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1130,0,1113,0,2,N'-1,1113,1130',7,'bcbd21f1-4a47-446a-b366-99601388694d',N'User A','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:38:53.553'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1100,0,1090,0,2,N'-1,1090,1100',10,'ec627788-7217-4362-ba5d-adb7d0cfff09',N'Guide Intro','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 13:07:12.077'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1101,0,1065,0,2,N'-1,1065,1101',2,'d87cc5c9-6eae-4be3-a044-5755ab397726',N'Guide Intro','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 13:08:43.363'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1102,0,1101,0,3,N'-1,1065,1101,1102',0,'1bfb7e3a-6635-498b-bd7c-055422a5da17',N'Read through','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 13:09:49.310'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1103,0,1101,0,3,N'-1,1065,1101,1103',1,'0d777818-7f9f-400a-84b8-221dd7b44792',N'How does the program work','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 13:11:33.150'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1104,0,1090,0,2,N'-1,1090,1104',17,'2bd01b6c-5ac4-485d-b3d7-168cc132947f',N'Training Overview','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 14:01:16.967'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1105,0,1090,0,2,N'-1,1090,1105',26,'f7f7b8d5-022c-473e-870d-ab38e6b41083',N'Training Survey','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 14:03:39.310'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1106,0,1090,0,2,N'-1,1090,1106',16,'4a00dc30-4a52-4304-8d20-950230a03ea1',N'Training Diary','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 14:03:48.490'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1107,0,1088,0,2,N'-1,1088,1107',6,'9c4066de-6e55-490e-b038-75920879747c',N'Repetition maximum','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-21 14:04:04.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1108,0,1065,0,2,N'-1,1065,1108',3,'99c11896-4c17-4c0d-a16c-031711784844',N'Training','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 14:10:31.473'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1109,0,1108,0,3,N'-1,1065,1108,1109',0,'9f222e2d-f6d9-4e0a-9217-6eaad912d7ca',N'Training Diary','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 14:10:55.340'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1110,0,1108,0,3,N'-1,1065,1108,1110',1,'fb55fb0e-aee4-4ce8-93ad-e04283aa8797',N'Training Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-21 14:11:11.960'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1111,0,-1,0,1,N'-1,1111',0,'40d188b5-aed6-4c31-a160-1f675eb0a71e',N'Submissions','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-22 12:36:41.137'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1113,0,-1,0,1,N'-1,1113',0,'b27c1973-d995-4d49-8402-021b6244ddc7',N'Users','2f7a2769-6b0b-4468-90dd-af42d64f7f16',{ts '2019-04-22 12:40:51.290'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1114,0,1128,0,2,N'-1,1128,1114',7,'b9c7dba9-d1fc-4d31-9f32-d095a85d0600',N'Pain level slider','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 12:44:49.547'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1128,0,-1,0,1,N'-1,1128',0,'393e26cd-6d0d-4449-99d3-c94e1a5849f4',N'Custom','521231e3-8b37-469c-9f9d-51afc91feb7b',{ts '2019-04-22 13:27:54.020'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1116,0,1128,0,2,N'-1,1128,1116',3,'78db7c7b-9ae7-47ed-8af2-753a7caa8b70',N'Days slider','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 12:49:46.423'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1117,0,1111,0,2,N'-1,1111,1117',21,'55c1907b-0162-4503-813e-fc90ccf02b37',N'Group A Survey','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 12:55:10.060'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1118,0,1128,0,2,N'-1,1128,1118',13,'fa35b06e-3935-4a17-886c-58a46e4cf473',N'Medicine Pieces Integer','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 12:57:36.613'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1119,0,1128,0,2,N'-1,1128,1119',14,'3203a86f-9b5a-4018-b889-4feb284e7f31',N'Other Medication Type','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:01:07.203'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1120,0,1128,0,2,N'-1,1128,1120',11,'aa4edd8a-b27f-4cb9-8256-41d6ba1b5c0d',N'Other Medication Amount','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:01:51.230'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1121,0,1128,0,2,N'-1,1128,1121',15,'e6f42efc-4fa9-4c67-b9e7-99e5e635ec31',N'Other Treatment','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:10:01.350'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1122,0,1111,0,2,N'-1,1111,1122',23,'574a50b7-eb66-423d-9ab2-9bf7acb0d7e4',N'Group B Survey','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:10:58.330'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1123,0,-1,0,1,N'-1,1123',44,'ae067000-68fb-4dca-a8f6-e3643a2bc082',N'Date','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:14:43.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1124,0,1111,0,2,N'-1,1111,1124',32,'287c7c1f-1ef4-48b5-9f11-e4ca456f1884',N'Group A Diary Week 1-4','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:19:04.247'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1126,0,1128,0,2,N'-1,1128,1126',2,'67244524-1e11-4500-9d0c-7431ecb15129',N'Comments','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:25:12.670'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1127,0,1128,0,2,N'-1,1128,1127',12,'98e08d8e-7717-46e4-9766-f526bb90ae9b',N'Side Effects','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:25:33.327'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1131,0,1113,0,2,N'-1,1113,1131',8,'dabb6bb9-f15b-4edc-9414-39484d9a8df6',N'User B','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:39:01.277'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1132,0,1113,0,2,N'-1,1113,1132',2,'ad86fe73-7ea2-401b-b154-0ab7e3649dfd',N'Users Directory','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 13:41:43.440'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1133,0,-1,0,1,N'-1,1133',1,'534fb067-c741-44de-82d8-5c9d85bdaadb',N'Users','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 13:41:57.787'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1134,0,-1,0,1,N'-1,1134',26,'116ab900-a0b5-4fbb-bbae-2319fca9fee2',N'AutheticationCode','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:43:39.667'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1135,0,1133,0,2,N'-1,1133,1135',0,'c9a4163d-abc9-495f-9a16-1eb175a8592d',N'13685','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 13:44:32.973'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1136,0,-1,0,1,N'-1,1136',27,'68b04731-bd5d-48c8-8eea-8c9747f6581d',N'User Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-22 13:45:50.160'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1137,0,1111,0,2,N'-1,1111,1137',26,'e8ff5827-aad0-41f4-9ecf-57a49a956c9b',N'Group B Diary','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-04-22 14:05:07.770'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1138,0,-1,0,1,N'-1,1138',2,'aca88fe8-6b4f-481a-9ca0-1b72eeab376a',N'Submissions','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 14:06:35.413'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1139,1,-20,0,1,N'-1,-20,1139',3,'fef744e4-c42f-4617-9fd1-83e1e7275940',N'13685-22-04-2019-A-Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 14:09:55.310'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1140,1,-20,0,1,N'-1,-20,1140',4,'83595e12-2a6d-419a-8baa-c520cd3bccb8',N'Glen´s content','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 14:26:44.717'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1141,1,-20,0,1,N'-1,-20,1141',5,'b908c589-772a-4edb-83cd-c74d6da4fd07',N'Glen´s content (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 14:37:44.317'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1142,1,-20,0,1,N'-1,-20,1142',6,'adcd3ce6-78ec-4ea8-b1b4-d736d827df7b',N'Glen´s content (2)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 15:05:10.687'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1143,1,-20,0,1,N'-1,-20,1143',7,'8e8dd378-a43f-41ae-a144-f79d53dcf91e',N'Glen´s content (3)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 15:05:52.853'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1144,1,-20,0,1,N'-1,-20,1144',8,'b7d62d62-5d46-45b8-84ae-10ccf179698b',N'Glen´s content (4)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 15:07:46.390'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1145,1,-20,0,1,N'-1,-20,1145',9,'b2a31905-861a-459d-a64c-b2798d54535a',N'Kurt','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-22 15:20:14.657'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1146,1,-20,0,1,N'-1,-20,1146',10,'133f1b03-1a30-4a23-8aa1-252ed2834c7a',N'testwhere','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 10:15:36.377'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1147,1,-20,0,1,N'-1,-20,1147',11,'34c98de4-d24c-4cbd-b221-143e2b31a242',N'testwhere2','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 10:16:44.507'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1148,1,-20,0,1,N'-1,-20,1148',12,'74de09a3-43d8-4451-9441-49218d3aca61',N'testwhere2 (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 10:34:55.910'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1149,1,-20,0,1,N'-1,-20,1149',13,'8dfdf04e-5353-4416-8c16-8c0e14bd4613',N'test3','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 10:37:27.103'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1150,1,-20,0,1,N'-1,-20,1150',14,'23b8a628-98f9-4208-bf78-b68fdebb780e',N'test3 (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 11:49:06.737'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1151,1,-20,0,1,N'-1,-20,1151',15,'9448c001-5dde-4851-9112-e37e8c8a9c8e',N'98537-23-04-2019-A-Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 11:51:04.540'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1152,1,-20,0,1,N'-1,-20,1152',16,'0b2a36de-f587-44db-a2d0-50d65f56b89a',N'13685-23-04-2019-A-Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 11:55:38.090'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1153,1,-20,0,1,N'-1,-20,1153',17,'d0a98c41-72f6-459e-ab91-313e12092547',N'13685-23-04-2019-A-Survey (1)','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 11:58:00.183'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1154,0,1138,0,2,N'-1,1138,1154',0,'d90ff2bb-d2b2-4bca-b37b-2ef76e62d66c',N'13685-23-04-2019-A-Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-23 12:15:29.287'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1158,0,1111,0,2,N'-1,1111,1158',27,'735b0e0c-c462-48e4-bb66-eb423eaa7ea5',N'Repetition Maximum (Group B)','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-05-03 12:42:48.677'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1155,0,-1,0,1,N'-1,1155',28,'38d3bc0a-7b74-4405-93e8-b1b2feaf4574',N'Body','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-23 13:50:59.690'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1156,0,-1,0,1,N'-1,1156',29,'520a1b2f-9590-49fe-beed-6f6471906fa9',N'Input Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2019-04-23 14:00:44.997'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1157,0,1138,0,2,N'-1,1138,1157',1,'647d9437-5944-4033-8fc3-ffc233a75e7a',N'13685-25-04-2019-A-Survey','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2019-04-25 13:06:39.407'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1160,0,1070,0,2,N'-1,1070,1160',17,'5e56f034-4656-4811-bcd0-94b94c7912c7',N'Base dairy submission','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-05-03 12:47:47.590'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1161,0,1070,0,2,N'-1,1070,1161',18,'998bdeea-4fa0-4fba-82ec-e4f24c965c2f',N'Base survey submission','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2019-05-03 12:48:13.403'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
INSERT INTO [umbracoRedirectUrl] ([id],[contentKey],[createDateUtc],[url],[urlHash]) VALUES ('5c7fb7d8-8c9c-47dd-af4e-a47a7cee2a81','8a182883-7e24-4e35-be1a-69e807dd0062',{ts '2019-04-09 08:06:16.967'},N'/vejledning',N'a0a00ef26c8dec7bde41188928764b1993029c46');
GO
INSERT INTO [umbracoRedirectUrl] ([id],[contentKey],[createDateUtc],[url],[urlHash]) VALUES ('8bff6d1f-bc41-4e16-92b2-f8b52f25282b','30ef99ce-9043-42a1-b5f3-71b690c0c5be',{ts '2019-04-11 08:36:42.883'},N'/guide/exercises-1',N'3adbef0ad7f7d1d57bca472294d70dbc4fc34da6');
GO
INSERT INTO [umbracoRedirectUrl] ([id],[contentKey],[createDateUtc],[url],[urlHash]) VALUES ('a644957d-a295-48ff-82af-f74c71db3c09','0d777818-7f9f-400a-84b8-221dd7b44792',{ts '2019-04-21 12:09:55.583'},N'/guide-intro/how-does-to-program-work',N'9c1445505c02e7dbcf100509bc47813db892d09e');
GO
INSERT INTO [umbracoRedirectUrl] ([id],[contentKey],[createDateUtc],[url],[urlHash]) VALUES ('8fcd0177-ba87-4fad-b62f-509b57830c0e','fb55fb0e-aee4-4ce8-93ad-e04283aa8797',{ts '2019-04-23 10:53:52.773'},N'/training/survey',N'3801dd1fcf5156fca3c45ef4d5cf033cb344b72c');
GO
SET IDENTITY_INSERT [umbracoRelation] ON;
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (1,1065,1084,2,{ts '2019-04-10 20:32:19.757'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (2,1066,1072,2,{ts '2019-04-11 10:36:18.870'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (3,1138,1139,2,{ts '2019-04-23 12:08:12.777'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (4,1138,1140,2,{ts '2019-04-23 12:08:18.470'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (5,1138,1141,2,{ts '2019-04-23 12:08:23.800'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (6,1138,1142,2,{ts '2019-04-23 12:08:29.007'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (7,1138,1143,2,{ts '2019-04-23 12:08:34.370'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (8,1138,1144,2,{ts '2019-04-23 12:08:42.123'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (9,1138,1145,2,{ts '2019-04-23 12:08:48.153'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (10,1138,1146,2,{ts '2019-04-23 12:08:54.107'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (11,1138,1147,2,{ts '2019-04-23 12:08:59.620'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (12,1138,1148,2,{ts '2019-04-23 12:09:05.673'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (13,1138,1149,2,{ts '2019-04-23 12:09:12.047'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (14,1138,1150,2,{ts '2019-04-23 12:09:18.307'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (15,1138,1151,2,{ts '2019-04-23 12:09:24.847'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (16,1138,1152,2,{ts '2019-04-23 12:09:30.483'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (17,1138,1153,2,{ts '2019-04-23 12:09:37.130'},N'');
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,'4cbeb612-e689-3563-b755-bf3ede295433',1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (2,'0cc3507c-66ab-3091-8913-3d998148e423',0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (3,'8307994f-faf2-3844-bab9-72d34514edf2',0,'b796f64c-1f99-4ffb-b886-4bf4bc011a9c','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',N'Relate Parent Media Folder On Delete',N'relateParentMediaFolderOnDelete');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (1,N'http://localhost:57286/umbraco',N'DESKTOP-NRI72M1//LM/W3SVC/2/ROOT',{ts '2019-04-09 09:30:52.083'},{ts '2019-05-06 12:04:55.637'},1,1);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (0,0,0,N'Uffe Christiansen',N'uffechristiansen@live.com',N'qeJnpafR2TpJJxf9Q8JhEw==zZpXGKFhKZH6G92rwXgGzgMnjQDeO82eTxkO2jrDOkk=',N'{"hashAlgorithm":"HMACSHA256"}',N'uffechristiansen@live.com',N'en-US',N'706a05ec-522a-4475-bacb-3a0f3dcf0efe',NULL,NULL,{ts '2019-04-09 09:30:28.007'},{ts '2019-05-06 12:02:52.633'},NULL,NULL,{ts '2019-04-09 09:30:24.273'},{ts '2019-05-06 12:02:52.803'},NULL,NULL);
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,1);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (0,5);
GO
SET IDENTITY_INSERT [umbracoUserGroup] ON;
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7ï',{ts '2019-04-09 09:30:26.123'},{ts '2019-04-09 09:30:26.123'},N'icon-medal',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (2,N'writer',N'Writers',N'CAH:F',{ts '2019-04-09 09:30:26.133'},{ts '2019-04-09 09:30:26.133'},N'icon-edit',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5Fï',{ts '2019-04-09 09:30:26.137'},{ts '2019-04-09 09:30:26.137'},N'icon-tools',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (4,N'translator',N'Translators',N'AF',{ts '2019-04-09 09:30:26.137'},{ts '2019-04-09 09:30:26.137'},N'icon-globe',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (5,N'sensitiveData',N'Sensitive data',N'',{ts '2019-04-09 09:30:26.140'},{ts '2019-04-09 09:30:26.140'},N'icon-lock',-1,-1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] OFF;
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'developer');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'member');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'settings');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'users');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (1,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (2,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (3,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (4,N'translation');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('837b39f7-1eca-4dd9-b441-b12f58dcae4e',0,{ts '2019-04-09 07:30:29.387'},{ts '2019-04-09 07:30:39.663'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('9a31f39e-643b-4d61-bdb8-fb502f9746b4',0,{ts '2019-04-09 07:59:37.850'},{ts '2019-04-09 08:19:14.400'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7d6d3e10-1d18-4bed-b9d0-7338927be65e',0,{ts '2019-04-09 08:19:16.100'},{ts '2019-04-09 08:53:46.373'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('46bb5473-0dc2-4603-bfa7-49d5ab82b598',0,{ts '2019-04-09 09:19:27.647'},{ts '2019-04-09 09:22:09.510'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('8a965f68-dd40-4606-8d61-ebbe2543a7b1',0,{ts '2019-04-10 17:29:30.517'},{ts '2019-04-10 17:42:06.803'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('b87582cf-21b6-4cea-a543-e59da8f9fb5e',0,{ts '2019-04-10 18:00:30.413'},{ts '2019-04-10 18:00:30.537'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('f26aabcd-d7c6-4290-b241-ef09c5fc7c77',0,{ts '2019-04-10 18:21:01.940'},{ts '2019-04-10 18:46:48.647'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('0f6c58ba-ab1f-4be0-9768-3e435116ffda',0,{ts '2019-04-11 07:19:26.460'},{ts '2019-04-11 07:23:59.343'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('a5ab0473-528f-4d9d-a15e-4fa98c94e968',0,{ts '2019-04-11 07:42:06.877'},{ts '2019-04-11 07:50:32.397'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7ab71a4c-9550-4e50-a228-9eca97ebb0f2',0,{ts '2019-04-11 08:13:18.007'},{ts '2019-04-11 09:04:10.713'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('c0503f09-3b12-44b5-a702-2846b7639553',0,{ts '2019-04-11 09:33:12.900'},{ts '2019-04-11 09:41:31.457'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('0547fc70-32fa-4653-be84-59414cfac30b',0,{ts '2019-04-11 09:55:25.697'},{ts '2019-04-11 09:55:25.850'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('70a0922d-73f4-411a-9ac1-27984c4fca7e',0,{ts '2019-04-12 07:58:46.913'},{ts '2019-04-12 08:08:10.650'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('a0a69ab7-3ec5-4e84-aa4c-e8be174a3f97',0,{ts '2019-04-21 11:00:39.777'},{ts '2019-04-21 12:10:31.213'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('7190a546-a90d-4170-8c30-3eb5d66ba3cb',0,{ts '2019-04-22 10:16:43.010'},{ts '2019-04-22 10:36:22.473'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('531f6a9b-84b1-4d31-944d-06dc8fa92c99',0,{ts '2019-04-22 10:36:24.047'},{ts '2019-04-22 12:27:01.307'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('f7168327-e450-4f59-aca0-2a45fb6fd907',0,{ts '2019-04-22 12:48:04.883'},{ts '2019-04-22 13:20:22.807'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('54ef3fe4-3fc5-43a0-8ffe-679b673dce3e',0,{ts '2019-04-23 08:12:07.653'},{ts '2019-04-23 08:16:50.780'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('ffc3fc96-6b8d-4bc2-b9ad-a4ad4a302d77',0,{ts '2019-04-23 08:35:21.193'},{ts '2019-04-23 09:02:44.053'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('ff052a34-acd0-4c1c-8684-15592cff8241',0,{ts '2019-04-23 09:50:10.720'},{ts '2019-04-23 10:09:19.787'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('530d55fa-afee-4f74-adcc-6b0358b5843c',0,{ts '2019-04-23 10:53:10.763'},{ts '2019-04-23 10:54:38.600'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('89ad0098-b378-45f4-879f-c4c8d796806c',0,{ts '2019-04-23 11:44:25.357'},{ts '2019-04-23 12:00:55.673'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('14495dc7-6c72-43ca-bb0f-a8d6a7cb1296',0,{ts '2019-04-25 11:05:49.717'},{ts '2019-04-25 11:28:38.643'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('5360836e-6f77-4906-913f-f88371aefe51',0,{ts '2019-04-26 12:24:28.240'},{ts '2019-04-26 12:30:30.113'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('c512872e-bae0-41af-a6a1-5d18a65a6852',0,{ts '2019-04-26 12:50:31.130'},{ts '2019-04-26 12:50:31.297'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('0fe86a60-f6fd-4c37-ab41-cefed85ac723',0,{ts '2019-04-26 13:25:52.493'},{ts '2019-04-26 13:25:52.693'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('bb864e51-8113-4499-a351-e8e87cfaf7de',0,{ts '2019-05-03 10:31:25.187'},{ts '2019-05-03 10:50:51.037'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('0f70a7bd-0d65-4821-9d6a-cf04ea2f9726',0,{ts '2019-05-03 10:51:00.700'},{ts '2019-05-03 11:04:06.613'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('69a787d7-0afe-4268-bab9-2ad6686bb983',0,{ts '2019-05-03 11:22:41.380'},{ts '2019-05-03 11:22:41.457'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('d62411c6-6c2f-4ec0-9bd8-d95553538c0b',0,{ts '2019-05-03 11:22:41.697'},{ts '2019-05-03 11:31:26.207'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('2bec2120-5aa5-4b73-a266-34a7fb063ad2',0,{ts '2019-05-06 09:54:39.127'},{ts '2019-05-06 09:58:06.977'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES ('14abab22-f874-42a3-997b-cddf3562f263',0,{ts '2019-05-06 10:02:53.710'},{ts '2019-05-06 10:06:38.907'},NULL,N'::1');
GO
SET IDENTITY_INSERT [umbracoUserStartNode] OFF;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [PK_cmsMedia] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAudit] ADD CONSTRAINT [PK_umbracoAudit] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoConsent] ADD CONSTRAINT [PK_umbracoConsent] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLock] ADD CONSTRAINT [PK_umbracoLock] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMigration] ADD CONSTRAINT [PK_umbracoMigration] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [PK_user2userGroup] PRIMARY KEY ([userId],[userGroupId]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [PK_userGroup2App] PRIMARY KEY ([userGroupId],[app]);
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY ([userGroupId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY ([sessionId]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [PK_userStartNode] PRIMARY KEY ([id]);
GO
CREATE UNIQUE INDEX [IX_cmsContent] ON [cmsContent] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentType] ON [cmsContentType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE INDEX [IX_cmsContentVersion_ContentId] ON [cmsContentVersion] ([ContentId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentVersion_VersionId] ON [cmsContentVersion] ([VersionId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDataType_nodeId] ON [cmsDataType] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDictionary_id] ON [cmsDictionary] ([id] ASC);
GO
CREATE INDEX [IX_cmsDictionary_key] ON [cmsDictionary] ([key] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDocument] ON [cmsDocument] ([nodeId] ASC,[versionId] ASC);
GO
CREATE INDEX [IX_cmsDocument_newest] ON [cmsDocument] ([newest] ASC);
GO
CREATE INDEX [IX_cmsDocument_published] ON [cmsDocument] ([published] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacro_UniqueId] ON [cmsMacro] ([uniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroPropertyAlias] ON [cmsMacro] ([macroAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_Alias] ON [cmsMacroProperty] ([macro] ASC,[macroPropertyAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [cmsMacroProperty] ([uniquePropertyId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsMedia] ON [cmsMedia] ([nodeId] ASC,[versionId] ASC,[mediaPath] ASC);
GO
CREATE INDEX [IX_cmsMember_LoginName] ON [cmsMember] ([LoginName] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyData_1] ON [cmsPropertyData] ([contentNodeId] ASC,[versionId] ASC,[propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsPropertyTypeAlias] ON [cmsPropertyType] ([Alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeUniqueID] ON [cmsPropertyType] ([UniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [cmsPropertyTypeGroup] ([uniqueID] ASC);
GO
CREATE INDEX [IX_cmsTags] ON [cmsTags] ([tag] ASC,[group] ASC);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId] ON [cmsTemplate] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccess_nodeId] ON [umbracoAccess] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoAccessRule] ON [umbracoAccessRule] ([ruleValue] ASC,[ruleType] ASC,[accessId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode] ON [umbracoLanguage] ([languageISOCode] ASC);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoMigration] ON [umbracoMigration] ([name] ASC,[version] ASC);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE INDEX [IX_umbracoNodePath] ON [umbracoNode] ([path] ASC);
GO
CREATE INDEX [IX_umbracoNodeTrashed] ON [umbracoNode] ([trashed] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoNodeUniqueID] ON [umbracoNode] ([uniqueID] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRedirectUrl] ON [umbracoRedirectUrl] ([urlHash] ASC,[contentKey] ASC,[createDateUtc] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelation_parentChildType] ON [umbracoRelation] ([parentId] ASC,[childId] ASC,[relType] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_alias] ON [umbracoRelationType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_name] ON [umbracoRelationType] ([name] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoRelationType_UniqueId] ON [umbracoRelationType] ([typeUniqueId] ASC);
GO
CREATE UNIQUE INDEX [IX_computerName] ON [umbracoServer] ([computerName] ASC);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupAlias] ON [umbracoUserGroup] ([userGroupAlias] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserGroup_userGroupName] ON [umbracoUserGroup] ([userGroupName] ASC);
GO
CREATE INDEX [IX_umbracoUser2NodePermission_nodeId] ON [umbracoUserGroup2NodePermission] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoUserStartNode_startNodeType] ON [umbracoUserStartNode] ([startNodeType] ASC,[startNode] ASC,[userId] ASC);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMedia] ADD CONSTRAINT [FK_cmsMedia_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY ([ParentId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY ([startNode]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

