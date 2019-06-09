/*==============================================================*/
/* Database name:  SimpleOA                                     */
/* DBMS name:      sqlServer2000(Extend)                        */
/* Created on:     2006-8-27 8:57:53                            */
/*==============================================================*/


/*==============================================================*/
/* Table: Affiche                                               */
/*==============================================================*/
create table Affiche (
AfficheID            int                  identity
      /*AfficheID*/,
AfficheContent       nvarchar(100)        not null
      /*AfficheContent*/,
AfficheTime          datetime             not null
      /*AfficheTime*/,
constraint PK_AFFICHE primary key  (AfficheID)
 
)
go


/*==============================================================*/
/* Table: Calendar                                              */
/*==============================================================*/
create table Calendar (
CalendarID           numeric              identity
      /*CalendarID*/,
EmployeeName         nvarchar(20)         not null
      /*EmployeeName*/,
CalendarTitle        nvarchar(20)         not null
      /*CalendarTitle*/,
CalendarContent      nvarchar(100)        not null
      /*CalendarContent*/,
CalendarDate         datetime             not null
      /*CalendarDate*/,
constraint PK_CALENDAR primary key  (CalendarID)
 
)
go


/*==============================================================*/
/* Table: Checks                                                */
/*==============================================================*/
create table Checks (
CheckID              int                  identity
      /*CheckID*/,
EmployeeName         nvarchar(20)         not null
      /*EmployeeName*/,
CheckData            nvarchar(50)         not null
      /*CheckData*/,
CheckDate            datetime             not null
      /*CheckDate*/,
constraint PK_CHECKS primary key  (CheckID)
 
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
/* Table: Invite                                                */
/*==============================================================*/
create table Invite (
InviteID             int                  identity
      /*InviteID*/,
DepartID             int                  null
      /*DepartID*/,
OpeningJob           nvarchar(20)         not null
      /*OpeningJob*/,
PeopleAmount         int                  not null
      /*PeopleAmount*/,
Require              nvarchar(200)        not null
      /*Require*/,
Finished             bit                  null
      /*Finished*/,
Note                 nvarchar(100)        null
      /*Note*/,
constraint PK_INVITE primary key  (InviteID)
 
)
go


/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message (
MsgID                int                  identity
      /*MsgID*/,
Receive              nvarchar(20)         not null
      /*Receive*/,
Send                 nvarchar(20)         not null
      /*Send*/,
MsgTitle             nvarchar(20)         not null
      /*MsgTitle*/,
MsgContent           nvarchar(100)        not null
      /*MsgContent*/,
IsRead               bit                  null
      /*IsRead*/,
constraint PK_MESSAGE primary key  (MsgID)
 
)
go


/*==============================================================*/
/* Table: Salary                                                */
/*==============================================================*/
create table Salary (
SalaryID             int                  identity
      /*SalaryID*/,
YearSet              nvarchar(4)          not null
      /*YearSet*/,
MonthSet             nvarchar(2)          not null
      /*MonthSet*/,
EndSalary            money                null
      /*EndSalary*/,
EmployeeName         nvarchar(20)         not null
      /*EmployeeName*/,
GangWei              money                null
      /*GangWei*/,
CheBu                money                null
      /*CheBu*/,
FanBu                money                null
      /*FanBu*/,
Tax                  float                null
      /*Tax*/,
Encourage            money                null
      /*Encourage*/,
Punish               money                null
      /*Punish*/,
Note                 nvarchar(100)        null
      /*Note*/,
constraint PK_SALARY primary key  (SalaryID)
 
)
go


/*==============================================================*/
/* Table: SalarySet                                             */
/*==============================================================*/
create table SalarySet (
SetID                int                  identity
      /*SetID*/,
Formula              nvarchar(50)         not null
      /*Formula*/,
constraint PK_SALARYSET primary key  (SetID)
 
)
go


/*==============================================================*/
/* Table: SmtpSet                                               */
/*==============================================================*/
create table SmtpSet (
SmtpID               int                  identity
      /*SmtpID*/,
Host                 nvarchar(20)         not null
      /*Host*/,
Port                 int                  not null default 25
      /*Port*/,
UserName             nvarchar(20)         not null
      /*UserName*/,
UserMail             nvarchar(50)         not null
      /*UserMail*/,
UserPass             nvarchar(50)         not null
      /*UserPass*/,
constraint PK_SMTPSET primary key  (SmtpID)
 
)
go


/*==============================================================*/
/* Table: TimeSet                                               */
/*==============================================================*/
create table TimeSet (
TimeSetID            int                  identity
      /*TimeSetID*/,
Begintime            nvarchar(5)          not null
      /*Begintime*/,
EndTime              nvarchar(5)          not null
      /*EndTime*/,
Note                 nvarchar(50)         null
      /*Note*/,
constraint PK_TIMESET primary key  (TimeSetID)
 
)
go


/*==============================================================*/
/* Table: TimeTable                                             */
/*==============================================================*/
create table TimeTable (
TimeID               int                  identity
      /*TimeID*/,
EmployeeName         nvarchar(20)         not null
      /*EmployeeName*/,
OnDuty               nvarchar(5)          null
      /*OnDuty*/,
OffDuty              nvarchar(5)          null
      /*OffDuty*/,
DutyDate             datetime             not null
      /*DutyDate*/,
Note                 nvarchar(50)         null
      /*Note*/,
constraint PK_TIMETABLE primary key  (TimeID)
 
)
go


/*==============================================================*/
/* Table: Train                                                 */
/*==============================================================*/
create table Train (
TrainID              int                  identity
      /*TrainID*/,
TrainTitle           nvarchar(20)         not null
      /*TrainTitle*/,
TrainContent         nvarchar(200)        not null
      /*TrainContent*/,
TrainDate            datetime             not null
      /*TrainDate*/,
TrainPeople          nvarchar(100)        not null
      /*TrainPeople*/,
Note                 nvarchar(100)        null
      /*Note*/,
constraint PK_TRAIN primary key  (TrainID)
 
)
go


alter table Invite
   add constraint FK_INVITE_REFERENCE_DEPARTME foreign key (DepartID)
      references Department (DepartID)
go


