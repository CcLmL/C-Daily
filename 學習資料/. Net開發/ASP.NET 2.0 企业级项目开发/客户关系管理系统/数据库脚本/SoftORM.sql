/*==============================================================*/
/* Database name:  SoftCRM                                      */
/* DBMS name:      sqlServer2000(Extend)                        */
/* Created on:     2006-8-27 8:51:35                            */
/*==============================================================*/


/*==============================================================*/
/* Table: Area                                                  */
/*==============================================================*/
create table Area (
AreaID               int                  identity
      /*AreaID*/,
AreaName             nvarchar(20)         not null
      /*AreaName*/,
constraint PK_AREA primary key  (AreaID)
 
)
go


/*==============================================================*/
/* Table: Bargain                                               */
/*==============================================================*/
create table Bargain (
BargainID            int                  identity
      /*BargainID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
BargainBeginDate     datetime             not null
      /*BargainBeginDate*/,
BargainEndDate       datetime             not null
      /*BargainEndDate*/,
BargainNote          nvarchar(100)        null
      /*BargainNote*/,
constraint PK_BARGAIN primary key  (BargainID)
 
)
go


/*==============================================================*/
/* Table: City                                                  */
/*==============================================================*/
create table City (
CityID               int                  identity
      /*CityID*/,
AreaID               int                  null
      /*AreaID*/,
CityName             nvarchar(20)         not null
      /*CityName*/,
constraint PK_CITY primary key  (CityID)
 
)
go


/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
DepartID             int                  identity
      /*DepartID*/,
DepartName           nvarchar(20)         not null
      /*DepartName*/,
constraint PK_DEPARTMENT primary key  (DepartID)
 
)
go


/*==============================================================*/
/* Table: EmployeeInfo                                          */
/*==============================================================*/
create table EmployeeInfo (
EmployeeID           int                  identity
      /*EmployeeID*/,
DepartID             int                  not null
      /*DepartID*/,
EmployeeName         nvarchar(20)         not null
      /*EmployeeName*/,
EmployeePhone        nvarchar(20)         null
      /*EmployeePhone*/,
EmployeeEMail        nvarchar(20)         null
      /*EmployeeEMail*/,
EmployeeBirthday     datetime             null
      /*EmployeeBirthday*/,
EmployeeSex          bit                  null
      /*EmployeeSex*/,
Note                 nvarchar(50)         null
      /*Note*/,
constraint PK_EMPLOYEEINFO primary key  (EmployeeID)
 
)
go


/*==============================================================*/
/* Table: Implement                                             */
/*==============================================================*/
create table Implement (
ImplementID          int                  identity
      /*ImplementID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
SoftVersion          nvarchar(20)         not null
      /*SoftVersion*/,
ImplementBeginDate   datetime             not null
      /*ImplementBeginDate*/,
ImplementEndDate     datetime             not null
      /*ImplementEndDate*/,
ImplementSumUp       nvarchar(100)        not null
      /*ImplementSumUp*/,
Note                 nvarchar(100)        null
      /*Note*/,
constraint PK_IMPLEMENT primary key  (ImplementID)
 
)
go


/*==============================================================*/
/* Table: LinkRecord                                            */
/*==============================================================*/
create table LinkRecord (
LinkRecordID         int                  identity
      /*LinkRecordID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
LinkDate             datetime             not null
      /*LinkDate*/,
LinkNote             nvarchar(100)        not null
      /*LinkNote*/,
constraint PK_LINKRECORD primary key  (LinkRecordID)
 
)
go


/*==============================================================*/
/* Table: Linkman                                               */
/*==============================================================*/
create table Linkman (
UserID               int                  null
      /*UserID*/,
LinkmanID            int                  identity
      /*LinkmanID*/,
LinkmanName          nvarchar(20)         not null
      /*LinkmanName*/,
LinkmanPhone         nvarchar(20)         null
      /*LinkmanPhone*/,
LinkmanEMail         nvarchar(20)         null
      /*LinkmanEMail*/,
LinkmanQQ            nvarchar(20)         null
      /*LinkmanQQ*/,
LinkmanBirthday      datetime             null
      /*LinkmanBirthday*/,
LinkmanLike          nvarchar(50)         null
      /*LinkmanLike*/,
LinkmanSex           bit                  null
      /*LinkmanSex*/,
note                 nvarchar(50)         null
      /*note*/,
constraint PK_LINKMAN primary key  (LinkmanID)
 
)
go


/*==============================================================*/
/* Table: Notion                                                */
/*==============================================================*/
create table Notion (
NotionID             int                  identity
      /*NotionID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
NotionContent        nvarchar(100)        null
      /*NotionContent*/,
HandleContent        nvarchar(100)        null
      /*HandleContent*/,
NotionDate           datetime             null
      /*NotionDate*/,
HandleDate           datetime             null
      /*HandleDate*/,
constraint PK_NOTION primary key  (NotionID)
 
)
go


/*==============================================================*/
/* Table: Requirement                                           */
/*==============================================================*/
create table Requirement (
RequirementID        int                  identity
      /*RequirementID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
RequirementContent   nvarchar(100)        null
      /*RequirementContent*/,
HandleContent        nvarchar(100)        null
      /*HandleContent*/,
RequirementDate      datetime             null
      /*RequirementDate*/,
HandleDate           datetime             null
      /*HandleDate*/,
constraint PK_REQUIREMENT primary key  (RequirementID)
 
)
go


/*==============================================================*/
/* Table: Task                                                  */
/*==============================================================*/
create table Task (
TaskID               int                  identity
      /*TaskID*/,
EmployeeID           int                  null
      /*EmployeeID*/,
UserID               int                  null
      /*UserID*/,
TaskTitle            nvarchar(20)         not null
      /*TaskTitle*/,
TaskBeginDate        datetime             null
      /*TaskBeginDate*/,
TaskEndDate          datetime             null
      /*TaskEndDate*/,
TaskNote             nvarchar(100)        not null
      /*TaskNote*/,
constraint PK_TASK primary key  (TaskID)
 
)
go


/*==============================================================*/
/* Table: UserGrade                                             */
/*==============================================================*/
create table UserGrade (
GradeID              int                  identity
      /*GradeID*/,
GradeName            nvarchar(20)         not null
      /*GradeName*/,
constraint PK_USERGRADE primary key  (GradeID)
 
)
go


/*==============================================================*/
/* Table: UserInfo                                              */
/*==============================================================*/
create table UserInfo (
UserID               int                  identity
      /*UserID*/,
CityID               int                  not null
      /*CityID*/,
GradeID              int                  not null
      /*GradeID*/,
StateID              int                  not null
      /*StateID*/,
TypeID               int                  not null
      /*TypeID*/,
UserName             nvarchar(50)         not null
      /*UserName*/,
UserAddress          nvarchar(100)        null
      /*UserAddress*/,
SoftVersion          nvarchar(50)         not null
      /*SoftVersion*/,
UserLinkman          nvarchar(20)         null
      /*UserLinkman*/,
UserPhone            nvarchar(20)         null
      /*UserPhone*/,
EMail                nvarchar(20)         null
      /*EMail*/,
QQ                   nvarchar(20)         null
      /*QQ*/,
Fax                  nvarchar(20)         null
      /*Fax*/,
PeopleAmount         int                  null
      /*PeopleAmount*/,
constraint PK_USERINFO primary key  (UserID)
 
)
go


/*==============================================================*/
/* Table: UserState                                             */
/*==============================================================*/
create table UserState (
StateID              int                  identity
      /*StateID*/,
StateName            nvarchar(20)         not null
      /*StateName*/,
constraint PK_USERSTATE primary key  (StateID)
 
)
go


/*==============================================================*/
/* Table: UserType                                              */
/*==============================================================*/
create table UserType (
TypeID               int                  identity
      /*TypeID*/,
TypeName             nvarchar(20)         not null
      /*TypeName*/,
constraint PK_USERTYPE primary key  (TypeID)
 
)
go


/*==============================================================*/
/* Table: WorkLog                                               */
/*==============================================================*/
create table WorkLog (
LogID                int                  identity
      /*LogID*/,
EmployeeID           int                  not null
      /*EmployeeID*/,
LogTitle             nvarchar(20)         not null
      /*LogTitle*/,
LogContent           nvarchar(100)        not null
      /*LogContent*/,
LogDate              datetime             not null
      /*LogDate*/,
constraint PK_WORKLOG primary key  (LogID)
 
)
go


alter table Bargain
   add constraint FK_BARGAIN_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table Bargain
   add constraint FK_BARGAIN_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table City
   add constraint FK_CITY_REFERENCE_AREA foreign key (AreaID)
      references Area (AreaID)
go


alter table EmployeeInfo
   add constraint FK_EMPLOYEE_REFERENCE_DEPARTME foreign key (DepartID)
      references Department (DepartID)
go


alter table Implement
   add constraint FK_IMPLEMEN_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table Implement
   add constraint FK_IMPLEMEN_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table LinkRecord
   add constraint FK_LINKRECO_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table LinkRecord
   add constraint FK_LINKRECO_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table Linkman
   add constraint FK_LINKMAN_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table Notion
   add constraint FK_NOTION_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table Notion
   add constraint FK_NOTION_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table Requirement
   add constraint FK_REQUIREM_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table Requirement
   add constraint FK_REQUIREM_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table Task
   add constraint FK_TASK_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


alter table Task
   add constraint FK_TASK_REFERENCE_USERINFO foreign key (UserID)
      references UserInfo (UserID)
go


alter table UserInfo
   add constraint FK_USERINFO_RE4_USERSTAT foreign key (StateID)
      references UserState (StateID)
go


alter table UserInfo
   add constraint FK_USERINFO_REFERENCE_CITY foreign key (CityID)
      references City (CityID)
go


alter table UserInfo
   add constraint FK_USERINFO_REFERENCE_USERGRAD foreign key (GradeID)
      references UserGrade (GradeID)
go


alter table UserInfo
   add constraint FK_USERINFO_REFERENCE_USERTYPE foreign key (TypeID)
      references UserType (TypeID)
go


alter table WorkLog
   add constraint FK_WORKLOG_REFERENCE_EMPLOYEE foreign key (EmployeeID)
      references EmployeeInfo (EmployeeID)
go


