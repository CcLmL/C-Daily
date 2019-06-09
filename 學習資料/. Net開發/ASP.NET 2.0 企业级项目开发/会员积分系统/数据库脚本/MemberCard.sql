/*==============================================================*/
/* Database name:  MemberSale                                   */
/* DBMS name:      sqlServer2000(Extend)                        */
/* Created on:     2006-8-18 10:10:03                           */
/*==============================================================*/


/*==============================================================*/
/* Table: BackStock                                             */
/*==============================================================*/
create table BackStock (
BackID               int                  identity
      /*BackID*/,
StockID              nvarchar(20)         null
      /*StockID*/,
StockCount           int                  not null
      /*StockCount*/,
BackDate             datetime             not null
      /*BackDate*/,
constraint PK_BACKSTOCK primary key  (BackID)
 
)
go


/*==============================================================*/
/* Index: BackID                                                */
/*==============================================================*/
create   index BackID on BackStock (
BackID
)
go


/*==============================================================*/
/* Table: CardHistory                                           */
/*==============================================================*/
create table CardHistory (
ConsumeID            int                  identity
      /*ConsumeID*/,
CardNum              nvarchar(20)         not null
      /*CardNum*/,
Mark                 int                  not null
      /*Mark*/,
Point                numeric              not null
      /*Point*/,
HandleDate           datetime             not null
      /*HandleDate*/,
constraint PK_CARDHISTORY primary key  (ConsumeID)
 
)
go


/*==============================================================*/
/* Index: ConsumeID                                             */
/*==============================================================*/
create   index ConsumeID on CardHistory (
ConsumeID
)
go


/*==============================================================*/
/* Table: CardType                                              */
/*==============================================================*/
create table CardType (
CardID               int                  identity
      /*CardID*/,
CardTypeName         nvarchar(20)         not null
      /*CardTypeName*/,
CardRule             int                  not null
      /*CardRule*/,
constraint PK_CARDTYPE primary key  (CardID)
 
)
go


/*==============================================================*/
/* Index: CardID                                                */
/*==============================================================*/
create   index CardID on CardType (
CardID
)
go


/*==============================================================*/
/* Table: FreeStock                                             */
/*==============================================================*/
create table FreeStock (
FreeID               int                  identity
      /*FreeID*/,
StockID              nvarchar(20)         null
      /*StockID*/,
FreeDate             datetime             not null
      /*FreeDate*/,
constraint PK_FREESTOCK primary key  (FreeID)
 
)
go


/*==============================================================*/
/* Index: FreeID                                                */
/*==============================================================*/
create   index FreeID on FreeStock (
FreeID
)
go


/*==============================================================*/
/* Table: GiftRule                                              */
/*==============================================================*/
create table GiftRule (
RuleID               int                  identity
      /*RuleID*/,
StockID              nvarchar(20)         null
      /*StockID*/,
CardCount            numeric              not null
      /*CardCount*/,
constraint PK_GIFTRULE primary key  (RuleID)
 
)
go


/*==============================================================*/
/* Index: RuleID                                                */
/*==============================================================*/
create   index RuleID on GiftRule (
RuleID
)
go


/*==============================================================*/
/* Table: MemberInfo                                            */
/*==============================================================*/
create table MemberInfo (
MemberID             int                  identity
      /*MemberID*/,
CardID               int                  not null
      /*CardID*/,
CardNum              nvarchar(20)         not null
      /*CardNum*/,
CustName             nvarchar(20)         not null
      /*CustName*/,
custIdentity         nvarchar(20)         not null
      /*custIdentity*/,
CustPhone            nvarchar(20)         null
      /*CustPhone*/,
CustAddress          nvarchar(100)        null
      /*CustAddress*/,
CardDate             datetime             not null
      /*CardDate*/,
constraint PK_MEMBERINFO primary key  (MemberID, CardNum)
 
)
go


/*==============================================================*/
/* Index: MemberID                                              */
/*==============================================================*/
create   index MemberID on MemberInfo (
MemberID
)
go


/*==============================================================*/
/* Table: Sale                                                  */
/*==============================================================*/
create table Sale (
SaleID               int                  identity
      /*SaleID*/,
StockID              nvarchar(20)         null
      /*StockID*/,
StockCount           int                  not null
      /*StockCount*/,
SaleDate             datetime             not null
      /*SaleDate*/,
constraint PK_SALE primary key  (SaleID)
 
)
go


/*==============================================================*/
/* Index: SaleID                                                */
/*==============================================================*/
create   index SaleID on Sale (
SaleID
)
go


/*==============================================================*/
/* Table: Stock                                                 */
/*==============================================================*/
create table Stock (
StockID              nvarchar(20)         not null
      /*StockID*/,
StockName            nvarchar(50)         not null
      /*StockName*/,
StockPrice           float                not null
      /*StockPrice*/,
StockCount           int                  not null
      /*StockCount*/,
constraint PK_STOCK primary key  (StockID)
 
)
go


/*==============================================================*/
/* Index: StockID                                               */
/*==============================================================*/
create   index StockID on Stock (
StockID
)
go


alter table BackStock
   add constraint FK_BACKSTOC_REFERENCE_STOCK foreign key (StockID)
      references Stock (StockID)
go


alter table FreeStock
   add constraint FK_FREESTOC_REFERENCE_STOCK foreign key (StockID)
      references Stock (StockID)
go


alter table GiftRule
   add constraint FK_GIFTRULE_REFERENCE_STOCK foreign key (StockID)
      references Stock (StockID)
go


alter table MemberInfo
   add constraint FK_MEMBERIN_REFERENCE_CARDTYPE foreign key (CardID)
      references CardType (CardID)
go


alter table Sale
   add constraint FK_SALE_REFERENCE_STOCK foreign key (StockID)
      references Stock (StockID)
go


