--View--
 create view vBookStatus
as select BOOKS.ISBN ,BOOKS.B_State, bookinfo.Author
from BOOKS,bookinfo
WHERE bookinfo.ISBN1=BOOKS.ISBN and BOOKS.B_State ='Available';

Select * FROM vBookStatus;
