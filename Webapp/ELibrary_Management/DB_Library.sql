CREATE TABLE Author (
	[AuthorID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[Authorname] NVARCHAR(50) NULL
)

CREATE TABLE Publisher (
	[PublisherID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[Publishername] NVARCHAR(100) NULL
)

CREATE TABLE [User] (
	[UserID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[FullName] NVARCHAR(100) NULL,
	[UserNumberID] NVARCHAR(100) NULL,
	[Sex] INTEGER NULL,
	[Dob] DATETIME NULL,
	[Phone] NVARCHAR(100) NULL,
	[Email] NVARCHAR(100) NULL,
	[FullAddress] NVARCHAR(100) NULL,
	[Password] NVARCHAR(100) NULL,
	[Image] NVARCHAR(100) NULL,
	[AccountStatus] INTEGER NULL,
	[IsAdmin] INTEGER NULL
)

CREATE TABLE BookMaster (
	[BookID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[BookName] NVARCHAR(100) NULL,
	[Genre] NVARCHAR(100) NULL,
	[AuthorID] INTEGER REFERENCES dbo.Author(AuthorId),
	[PublisherID] INTEGER REFERENCES dbo.Publisher(PublisherId),
	[PublishDate] DATETIME NULL,
	[Language] NVARCHAR(100) NULL,
	[Edition] NVARCHAR(100) NULL,
	[BookCost] INTEGER NULL,
	[NoOfPages] INTEGER NULL,
	[BookDescription] NVARCHAR(MAX) NULL,
	[Available] INTEGER NULL,
	[BookImage] NVARCHAR(100),
	[CanBorrow] INTEGER NULL
)

CREATE TABLE [BookIssue] (
	[BookIssueID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[UserID] INTEGER REFERENCES dbo.[User](UserID),
	[BookID] INTEGER REFERENCES dbo.BookMaster(BookID),
	[BorrowedTotal] INTEGER NULL,
	[BorrowedDate] DATETIME NULL,
	[DueDate] DATETIME NULL,
	[ReturnDate] DATETIME NULL,
	[Status] INTEGER NULL
)

CREATE TABLE [Penalty] (
	[PenaltyID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[BookIssueID] INTEGER REFERENCES dbo.BookIssue(BookIssueID),
	[Price] INTEGER NULL,
	[Detail] NVARCHAR(500) NULL
)

CREATE TABLE [Reservation] (
	[ReservationID] INTEGER IDENTITY(1,1) PRIMARY KEY,
	[UserID] INTEGER REFERENCES dbo.[User](UserID),
	[BookID] INTEGER REFERENCES dbo.BookMaster(BookID),
	[Quantity] INTEGER NULL,
	[Date] DATETIME NULL,
	[Status] INTEGER NULL
)


INSERT INTO Author VALUES('Clair Seine');
INSERT INTO Author VALUES('Adrian Dripps');
INSERT INTO Author VALUES('Jesse Falkous');
INSERT INTO Author VALUES('Georgianna Chastenet');
INSERT INTO Author VALUES('Kiel Twidle');
INSERT INTO Author VALUES('Aloysia Cuzen');
INSERT INTO Author VALUES('Edsel McReynold');
INSERT INTO Author VALUES('Chrystal Longcaster');
INSERT INTO Author VALUES('Merrick Veelers');
INSERT INTO Author VALUES('Issie Merriman');

INSERT INTO Publisher VALUES('Seven Stories Press');
INSERT INTO Publisher VALUES('New Directions');
INSERT INTO Publisher VALUES('Candlewick Press');
INSERT INTO Publisher VALUES('Akashic Books');
INSERT INTO Publisher VALUES('Puffin Books');
INSERT INTO Publisher VALUES('Harper Collins');
INSERT INTO Publisher VALUES('Hachette Livre');
INSERT INTO Publisher VALUES('Hachette Book Group');
INSERT INTO Publisher VALUES('Macmillan');
INSERT INTO Publisher VALUES('Kim Dong');

INSERT INTO [User] VALUES('Admin','IA485361','1','2004-03-20 18:02:15','483-447-3159','admin@gmail.com','157 6th Hill','123','avatar-3.jpg','1','1');
INSERT INTO [User] VALUES('Silvia Templman','DG497751','0','2004-03-07 02:04:24','180-497-8826','block@gmail.com','5882 Parkside Alley','123','avatar-1.jpg','1','0');
INSERT INTO [User] VALUES('Rodrique Sherrum','MK204718','0','2001-12-17 22:30:39','899-221-0258','block1@gmail.com','1729 Linden Circle','123','avatar-2.jpg','0','0');
INSERT INTO [User] VALUES('Timothee Oaten','IS154458','0','2001-12-03 09:11:35','534-591-2548','toaten3@opensource.org','75 Evergreen Place','sIwFA28Md','avatar-1.jpg','1','0');
INSERT INTO [User] VALUES('Bronson Bufton','HE366297','1','2004-04-01 14:14:48','427-534-9212','bbufton4@skyrock.com','06 Victoria Alley','SxSiCLML','avatar-2.jpg','1','0');
INSERT INTO [User] VALUES('Neron Matias','DG491945','0','2003-11-17 04:37:29','835-561-5266','nmatias5@networkadvertising.org','47512 Ramsey Trail','Hu0vfPypJ','avatar-1.jpg','1','0');
INSERT INTO [User] VALUES('Stormy Blood','IA630279','0','2000-09-28 04:17:52','724-922-0517','sblood6@tiny.cc','8325 Killdeer Plaza','4DhPC4E7XCSZ','avatar-5.jpg','1','0');
INSERT INTO [User] VALUES('Denver Dawid','HS406817','0','2004-06-12 14:42:02','660-152-2318','ddawid7@wikispaces.com','10 Maryland Parkway','WKX40Gmxp','avatar-1.jpg','1','1');
INSERT INTO [User] VALUES('Jerrylee Egan','HS834925','1','2004-10-18 20:40:14','745-473-5749','jegan8@psu.edu','415 Packers Place','HncPML','avatar-3.jpg','1','0');
INSERT INTO [User] VALUES('Emili Meadmore','HS632402','1','2003-02-23 07:47:13','664-617-6955','emeadmore9@tamu.edu','7046 Armistice Circle','KrNoN18','avatar-1.jpg','0','0');
INSERT INTO [User] VALUES('Alika Worsnap','IS874888','1','2003-08-01 20:19:01','563-502-6626','aworsnapa@com.com','38677 Knutson Parkway','tG1xeFUpFujL','avatar-1.jpg','0','1');
INSERT INTO [User] VALUES('Chrysler Mil','HE429093','1','2000-12-08 02:03:40','891-548-8082','cmilb@lycos.com','95 Grover Crossing','FhBfHXkqJ','avatar-4.jpg','0','0');
INSERT INTO [User] VALUES('Inger Lamanby','AI799748','1','1999-10-17 01:38:27','857-443-3758','ilamanbyc@ca.gov','796 Welch Road','pcfhkm3MZm','avatar-1.jpg','1','0');
INSERT INTO [User] VALUES('Kariotta Sarsons','IA125725','0','2003-07-04 03:13:21','502-107-9987','ksarsonsd@sakura.ne.jp','2527 Rusk Way','9Zx6l4ncCyjx','avatar-1.jpg','1','1');
INSERT INTO [User] VALUES('Elsey Sorley','HE961136','0','2002-06-05 04:48:20','938-197-0463','esorleye@nih.gov','086 Valley Edge Alley','Bmr84mF','avatar-5.jpg','1','0');
INSERT INTO [User] VALUES('Leigha Garbutt','DG726469','1','2004-03-19 03:24:51','225-412-7728','lgarbuttf@webs.com','33795 Tomscot Avenue','fFPDYb','avatar-1.jpg','1','0');
INSERT INTO [User] VALUES('Sancho Decort','MK511626','0','1999-10-09 14:07:39','340-669-4390','sdecortg@github.com','353 Westerfield Junction','bwce5xBl','avatar-4.jpg','1','0');
INSERT INTO [User] VALUES('Frazer Hawkridge','HE412659','0','1999-03-14 22:23:44','743-278-4281','fhawkridgeh@dailymotion.com','5 Lindbergh Alley','oGpgGgWgMB','avatar-1.jpg','0','0');
INSERT INTO [User] VALUES('Katrine Maddox','IS340243','0','1999-04-06 19:37:17','874-750-9212','kmaddoxi@uol.com.br','23 Lotheville Pass','kl5YChEi63V','avatar-3.jpg','0','0');
INSERT INTO [User] VALUES('Jacky Ferron','HS644593','1','2003-02-14 21:44:53','284-996-5200','jferronj@yahoo.com','3833 Maryland Park','MBV5OwMwou','avatar-1.jpg','0','0');

INSERT INTO BookMaster VALUES('ASP.NET 4.5 in c# and VB','Education, IT','9','5','2019-06-14 00:00:00','English','1st','351','448','curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum','5','1.jpg','0');
INSERT INTO BookMaster VALUES('The Complete Reference ASP.Net','Education, IT','5','4','2019-06-06 00:00:00','English','2nd','461','306','libero nullam sit amet turpis elementum ligula vehicula consequat morbi','18','2.jpg','1');
INSERT INTO BookMaster VALUES('Programming Microsoft ASP.NET MVC','Education, IT','6','8','2019-05-09 00:00:00','English','1st','254','209','nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor','12','3.jpg','0');
INSERT INTO BookMaster VALUES('THE POWER OF YOUR SUBCONSCIOUS MIND','Self Help, Motivation','3','5','2019-08-07 00:00:00','English','3rd','476','343','interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae','0','4.jpg','0');
INSERT INTO BookMaster VALUES('HOW TO WIN FRIENDS INFLUENCE PEOPLE','Self Help','4','1','2019-09-22 00:00:00','English','1st','253','262','consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu','8','5.jpg','1');
INSERT INTO BookMaster VALUES('PAST FORWARD','Fiction, Romance','2','7','2019-04-15 00:00:00','English','1st','399','284','sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum','1','6.jpg','1');
INSERT INTO BookMaster VALUES('JAVA - HOW TO PROGRAM','Education, IT','7','5','2019-03-11 00:00:00','English','2nd','403','388','viverra diam vitae quam suspendisse potenti nullam porttitor lacus at','5','7.jpg','1');
INSERT INTO BookMaster VALUES('Programming Microsoft SQL Server 2012','Education, IT','8','1','2019-08-05 00:00:00','English','1st','411','287','urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam','8','8.jpg','0');
INSERT INTO BookMaster VALUES('Microsoft SQL Server 2014','Education, IT','1','10','2019-02-07 00:00:00','English','2nd','279','213','in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae','0','9.jpg','1');

INSERT INTO BookIssue VALUES('5','7','5','2021-09-12 20:36:43','2021-12-22 20:18:14','2021-12-20 20:18:14','1');
INSERT INTO BookIssue VALUES('7','1','4','2021-09-12 10:31:16','2021-12-26 08:31:47','2021-12-30 08:31:47','-1');
INSERT INTO BookIssue VALUES('4','3','1','2021-08-27 10:26:56','2021-11-03 10:03:45',NULL,'0');
INSERT INTO BookIssue VALUES('8','6','4','2021-10-05 04:33:28','2021-11-23 18:44:15',NULL,'0');
INSERT INTO BookIssue VALUES('10','7','4','2021-10-07 20:12:47','2021-11-07 06:07:38',NULL,'0');
INSERT INTO BookIssue VALUES('8','6','5','2021-09-10 02:55:49','2021-12-07 17:36:57',NULL,'0');
INSERT INTO BookIssue VALUES('9','8','1','2021-09-27 10:42:47','2021-12-05 23:06:12',NULL,'0');
INSERT INTO BookIssue VALUES('10','2','3','2021-09-22 18:59:24','2021-11-18 16:46:29',NULL,'0');
INSERT INTO BookIssue VALUES('2','3','2','2021-10-12 17:34:08','2021-11-23 18:26:27',NULL,'0');
INSERT INTO BookIssue VALUES('4','5','5','2021-09-14 13:18:02','2021-12-06 05:45:11',NULL,'0');

INSERT INTO Reservation VALUES('5','6','3','2021-10-07 20:12:47','0');
INSERT INTO Reservation VALUES('2','6','3','2021-09-10 02:55:49','0');

INSERT INTO Penalty VALUES('2','12','return late 4 days');
