select b.BorrowerName,
       GROUP_CONCAT(bk.BookName order by bk.BookName SEPARATOR ',') AS BorrowedBooks
from Books bk
INNER JOIN Borrowers b
ON bk.BookID = b.BookID
GROUP BY b.BorrowerName
ORDER BY b.BorrowerName;