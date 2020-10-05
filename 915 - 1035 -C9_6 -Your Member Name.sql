/*
	Problem 01: Find by customer, the total cost and the total cost after discount for each product on the order using TSQLV4?
	
*/

use TSQLV4;
go
select c.companyname
     , o.orderid
     , o.orderdate
     , p.productname
     , od.unitprice
     , od.qty
     , od.discount
     , TotalCost           = (od.unitprice * od.qty)
     , TotalDiscountedCost = (od.unitprice * od.qty) * (1 - od.discount)
from Sales.Customers               as c
    inner join Sales.Orders        as o
        on o.custid = c.custid
    inner join Sales.OrderDetails  as od
        on od.orderid = o.orderid
    inner join Production.Products as p
        on p.productid = od.productid
order by c.companyname
       , o.orderdate;


/*
	Problem 02:
*/
use