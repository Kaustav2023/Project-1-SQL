


--a. Get all the details from the person table including email ID, phone
number and phone number type

SELECT Person.FirstName,Person.MiddleName,Person.LastName,Email.EmailAddress,Phone.PhoneNumber,PhoneType.Name AS [Phone Number Type]
from Person.Person AS Person
full outer join Person.EmailAddress AS Email on Person.BusinessEntityID=Email.BusinessEntityID
full outer Join Person.PersonPhone AS Phone on Person.BusinessEntityID=Phone.BusinessEntityID
full outer Join Person.PhoneNumberType AS PhoneType on Phone.PhoneNumberTypeID=PhoneType.PhoneNumberTypeID


--b. Get the details of the sales 
header order made in May 2011

Select * from Sales.SalesOrderHeader AS SOH
where Year(OrderDate)=2011 AND Month(OrderDate)=5

--c. Get the details of the sales details order made in the month of May 2011

SELECT SOD.SalesOrderID,SOD.SalesOrderDetailID,SOD.CarrierTrackingNumber,SOD.OrderQty,SOD.ProductID,SOD.SpecialOfferID
      ,SOD.UnitPrice,SOD.UnitPriceDiscount,SOD.LineTotal,SOD.rowguid,SOD.ModifiedDate 
FROM Sales.SalesOrderDetail AS SOD 
FULL OUTER JOIN Sales.SalesOrderHeader AS SOH 
ON SOD.SalesOrderID=SOH.SalesOrderId 
WHERE  Year(SOH.OrderDate)=2011 AND Month(SOH.OrderDate)=5


--d. Get the total sales made in May 2011

Select SUM(LineTotal) AS[Total Sales Made in MAY 2011]
from Sales.SalesOrderDetail AS SOD
left join Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID=SOH.SalesOrderID
Where Year(SOH.OrderDate)=2011 AND Month(SOH.OrderDate)=5

--e. Get the total sales made in the year 2011 by month order by
increasing sales

Select Format(SOH.OrderDate,'MMMMM') AS [MONTH],SUM(LineTotal) AS[Total Sales]
from Sales.SalesOrderDetail AS SOD
left join Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID=SOH.SalesOrderID
Where Year(SOH.OrderDate)=2011 
Group By Format(SOH.OrderDate,'MMMMM')
Order By Sum(LineTotal) ASC


--f. Get the total sales made to the customer with FirstName='Gustavo'
and lastname= 'Achong'

Select SUM(SP.SalesYTD + SP.SalesLastYear)AS[TOTAL SALES] 
From  Person.Person AS Person
left Join Sales.SalesPerson AS SP
ON Person.BusinessEntityID=SP.BusinessEntityID
Where Person.FirstName='Gustavo' And Person.LastName='Achong'


---could not figure the customer details through the tables