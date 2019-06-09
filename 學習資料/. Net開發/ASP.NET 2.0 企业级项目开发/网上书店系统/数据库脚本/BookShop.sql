/*==============================================================*/
/* Database name:  BookShop                                     */
/* DBMS name:      sqlServer2000(Extend)                        */
/* Created on:     2006-8-27 9:07:10                            */
/*==============================================================*/


/*==============================================================*/
/* Table: Account                                               */
/*==============================================================*/
create table Account (
ProfileID            int                  not null
      /*ProfileID*/,
UserName             nvarchar(50)         not null
      /*UserName*/,
Address              nvarchar(100)        not null
      /*Address*/,
Phone                nvarchar(20)         not null
      /*Phone*/,
Mail                 nvarchar(50)         not null
      /*Mail*/,
Country              nvarchar(20)         not null
      /*Country*/,
Code                 nvarchar(20)         not null
      /*Code*/
 
)
go


/*==============================================================*/
/* Table: Cart                                                  */
/*==============================================================*/
create table Cart (
ItemID               int                  not null
      /*ItemID*/,
ProfileID            int                  not null
      /*ProfileID*/,
ProductID            int                  not null
      /*ProductID*/,
ProductName          nvarchar(50)         not null
      /*ProductName*/,
Price                decimal(10,2)        not null
      /*Price*/,
Quantity             int                  not null
      /*Quantity*/
 
)
go


/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
CategoryID           int                  identity
      /*CategoryID*/,
CategoryName         nvarchar(50)         not null
      /*CategoryName*/,
CategoryDescription  nvarchar(300)        not null
      /*CategoryDescription*/,
constraint PK_CATEGORY primary key  (CategoryID)
 
)
go


/*==============================================================*/
/* Table: Item                                                  */
/*==============================================================*/
create table Item (
ItemID               int                  identity
      /*ItemID*/,
ProductID            int                  null
      /*ProductID*/,
SupplierID           int                  null
      /*SupplierID*/,
Price                decimal(10,2)        not null
      /*Price*/,
ProductName          nvarchar(50)         not null
      /*ProductName*/,
ProductImage         nvarchar(100)        not null
      /*ProductImage*/,
constraint PK_ITEM primary key  (ItemID)
 
)
go


/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem (
OrderID              int                  null
      /*OrderID*/,
ItemID               int                  not null
      /*ItemID*/,
LineNumber           int                  not null
      /*LineNumber*/,
Quantity             int                  not null
      /*Quantity*/,
Price                decimal(10,2)        not null
      /*Price*/
 
)
go


/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders (
OrderID              int                  identity
      /*OrderID*/,
OrderDate            datetime             not null
      /*OrderDate*/,
UserName             nvarchar(50)         not null
      /*UserName*/,
BillAddress          nvarchar(100)        not null
      /*BillAddress*/,
BillCode             nvarchar(20)         not null
      /*BillCode*/,
BillCountry          nvarchar(20)         not null
      /*BillCountry*/,
ShipAddress          nvarchar(100)        not null
      /*ShipAddress*/,
ShipCode             nvarchar(20)         not null
      /*ShipCode*/,
ShipCountry          nvarchar(20)         not null
      /*ShipCountry*/,
BillToName           nvarchar(50)         not null
      /*BillToName*/,
ShipToName           nvarchar(50)         not null
      /*ShipToName*/,
TotalPrice           decimal(10,2)        not null
      /*TotalPrice*/,
constraint PK_ORDERS primary key  (OrderID)
 
)
go


/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product (
ProductID            int                  identity
      /*ProductID*/,
CategoryID           int                  null
      /*CategoryID*/,
ProductName          nvarchar(50)         not null
      /*ProductName*/,
ProductDescription   nvarchar(300)        not null
      /*ProductDescription*/,
ProductImage         nvarchar(100)        not null
      /*ProductImage*/,
constraint PK_PRODUCT primary key  (ProductID)
 
)
go


/*==============================================================*/
/* Table: ProductCount                                          */
/*==============================================================*/
create table ProductCount (
ItemID               int                  null
      /*ItemID*/,
Count                int                  not null
      /*Count*/
 
)
go


/*==============================================================*/
/* Table: Profiles                                              */
/*==============================================================*/
create table Profiles (
ProfileID            int                  identity
      /*ProfileID*/,
UserName             nvarchar(50)         not null
      /*UserName*/,
LastActivityDate     datetime             not null
      /*LastActivityDate*/,
LastUpdateDate       datetime             not null
      /*LastUpdateDate*/,
ApplicationName      nvarchar(50)         not null
      /*ApplicationName*/,
constraint PK_PROFILES primary key  (ProfileID)
 
)
go


/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
create table Supplier (
SupplierID           int                  identity
      /*SupplierID*/,
SupplierName         nvarchar(50)         not null
      /*SupplierName*/,
Address              nvarchar(100)        not null
      /*Address*/,
Phone                nvarchar(20)         not null
      /*Phone*/,
constraint PK_SUPPLIER primary key  (SupplierID)
 
)
go


alter table Account
   add constraint FK_ACCOUNT_REFERENCE_PROFILES foreign key (ProfileID)
      references Profiles (ProfileID)
go


alter table Cart
   add constraint FK_CART_REFERENCE_ITEM foreign key (ItemID)
      references Item (ItemID)
go


alter table Cart
   add constraint FK_CART_REFERENCE_PROFILES foreign key (ProfileID)
      references Profiles (ProfileID)
go


alter table Item
   add constraint FK_ITEM_REFERENCE_PRODUCT foreign key (ProductID)
      references Product (ProductID)
go


alter table Item
   add constraint FK_ITEM_REFERENCE_SUPPLIER foreign key (SupplierID)
      references Supplier (SupplierID)
go


alter table OrderItem
   add constraint FK_ORDERITE_REFERENCE_ORDERS foreign key (OrderID)
      references Orders (OrderID)
go


alter table Product
   add constraint FK_PRODUCT_REFERENCE_CATEGORY foreign key (CategoryID)
      references Category (CategoryID)
go


alter table ProductCount
   add constraint FK_PRODUCTC_REFERENCE_ITEM foreign key (ItemID)
      references Item (ItemID)
go


