AppFuse Basic Struts Archetype
--------------------------------------------------------------------------------
If you're reading this then you've created your new project using Maven and
dq.  You have only created the shell of an AppFuse Java EE
application.  The project object model (pom) is defined in the file pom.xml.
The application is ready to run as a web application. The pom.xml file is
pre-defined with Hibernate as a persistence model and Struts 2 as the web
framework.

To get started, please complete the following steps:

1. Download and install a MySQL 5.x database from 
   http://dev.mysql.com/downloads/mysql/5.0.html#downloads.

2. Run "mvn jetty:run" and view the application at http://localhost:8080.

3. More information can be found at:

   http://appfuse.org/display/APF/AppFuse+QuickStart

mvn appfuse:remove -Dentity=EnumerationType
mvn appfuse:gen -Dentity=EnumerationType
mvn appfuse:gen -Dentity=Enumeration

mvn appfuse:gen -Dentity=StatusType
mvn appfuse:gen -Dentity=StatusItem
mvn appfuse:gen -Dentity=StatusValidChange

mvn appfuse:gen -Dentity=PartyRelationshipType
mvn appfuse:gen -Dentity=PartyRelationship

mvn appfuse:gen -Dentity=UomType
mvn appfuse:gen -Dentity=Uom
mvn appfuse:gen -Dentity=UomConversion

mvn appfuse:gen -Dentity=RoleType

mvn appfuse:gen -Dentity=PartyGroup
mvn appfuse:gen -Dentity=Person

mvn appfuse:gen -Dentity=Facility
mvn appfuse:gen -Dentity=Product
mvn appfuse:gen -Dentity=Price
mvn appfuse:gen -Dentity=ShipCar

mvn appfuse:gen -Dentity=SalePlan
mvn appfuse:gen -Dentity=SalePlanDtl
mvn appfuse:gen -Dentity=Shipment
mvn appfuse:gen -Dentity=FacilityTransition

mvn appfuse:gen -Dentity=TbCarePeople
mvn appfuse:gen -Dentity=TbProvide
mvn appfuse:gen -Dentity=TbProvideDtl
mvn appfuse:gen -Dentity=DqHui

mvn appfuse:gen -Dentity=ApprovalProj
mvn appfuse:gen -Dentity=TzDhbz
mvn appfuse:gen -Dentity=TzDyzth
mvn appfuse:gen -Dentity=TzFwqz
mvn appfuse:gen -Dentity=TzGfmz
mvn appfuse:gen -Dentity=TzHjmd
mvn appfuse:gen -Dentity=TzZtjj
mvn appfuse:gen -Dentity=CpCharge
mvn appfuse:gen -Dentity=Petition
mvn appfuse:gen -Dentity=PetitionFlow