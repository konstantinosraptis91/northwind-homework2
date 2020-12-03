/*1. Βρείτε κωδικό παραγγελίας (OrderId), όνομα πελάτη (ContactName), όνομα
προϊόντος (ProductName), τιμή μονάδας (UnitPrice) και ποσότητα (Quantity) των
παραγγελιών που έχουν γίνει το έτος 1996 από πελάτες που προέρχονται από τη
χώρα ‘France’, ταξινομημένες κατά κωδικό παραγγελίας, όνομα πελάτη και όνομα
προϊόντος.*/

SELECT O.OrderID, C.ContactName, P.ProductName, OD.UnitPrice, OD.Quantity
FROM orders AS O,
     customers AS C,
     products AS P,
     `order details` AS OD
WHERE C.CustomerID = O.CustomerID
  AND P.ProductID = OD.ProductID
  AND O.OrderID = OD.OrderID
  AND EXTRACT(YEAR FROM O.OrderDate) = 1996
  AND C.Country = 'France'
ORDER BY O.OrderID, C.ContactName, P.ProductName;

/*SELECT O.OrderID, C.ContactName, P.ProductName, OD.UnitPrice, OD.Quantity
FROM orders AS O
         INNER JOIN customers as C
                    on C.CustomerID = O.CustomerID
         INNER JOIN `order details` AS OD
                    on O.OrderID = OD.OrderID
         INNER JOIN products AS P
                    ON OD.ProductID = P.ProductID
WHERE EXTRACT(YEAR FROM O.OrderDate) = 1996
  AND C.Country = 'France'
ORDER BY O.OrderID, C.ContactName, P.ProductName;*/

/*2. Βρείτε όνομα προϊόντος (ProductName) και όνομα κατηγορίας στην οποία ανήκει
(Description) για όσα προϊόντα έχουν λιγότερες από 75% μονάδες σε στοκ
(UnitsInStock) από μονάδες σε παραγγελία (UnitsOnOrder), ταξινομημένες κατά
όνομα προϊόντος.*/

SELECT P.ProductName, C.Description
FROM products AS P,
     categories AS C
WHERE P.CategoryID = C.CategoryID
  AND P.UnitsOnOrder - P.UnitsInStock < 75
GROUP BY P.ProductName;

/*3. Για κάθε πελάτη που συμμετέχει σε περισσότερες από 10 παραγγελίες να βρεθεί
ο κωδικός του πελάτη (CustomerId), το όνομά του (ContactName) και το πλήθος των
παραγγελιών στις οποίες συμμετέχει (με όνομα στήλης: 'NumberOfOrders'),
ταξινομημένα κατά όνομα πελάτη.*/

/*4. Να βρεθεί η λίστα με στήλες: ContactName, CompanyName, Type, όλων των
προμηθευτών που προμηθεύουν προϊόντα της κατηγορίας: 'Produce' και όλων των
πελατών που συμμετέχουν σε παραγγελίες για τις οποίες είναι υπεύθυνοι
εργαζόμενοι που έχουν κοινή χώρα προέλευσης με τους πελάτες, ταξινομημένη κατά
ContactName, CompanyName (Σημείωση: Η στήλη Type παίρνει τιμή 'SUPPLIER' όταν
πρόκειται για προμηθευτή, και τιμή 'CUSTOMER' όταν πρόκειται για πελάτη)*/

/*5. Να βρεθούν ο κωδικός πελάτη (CustomerId) και το όνομα πελάτη (ContactName)
όσων πελατών έχουν υποβάλει παραγελλίες με έκπτωση (Discount) μεγαλύτερο του
μέσου όρου έκπτωσης όλων των παραγγελιών, ταξινομημένα κατά.κωδικό πελάτη
(CustomerId) και όνομα πελάτη (ContactName).*/

/*6. Να βρεθούν ο κωδικός πελάτη (CustomerId), το όνομα πελάτη (ContactName), η
περιοχή (Region), ο κωδικός παραγγελίας (OrderId), το έτος παραγγελίας (βρίσκεται
με YEAR(OrderDate) και θέλουμε να βάλετε όνομα στήλης ‘YEAR’) και το ποσό
χρέωσης ανά παραγγελία (με όνομα στήλης ‘SUMMA’) στρογγυλοποιημένο στα 2
δεκαδικά ψηφία, για όσους πελάτες δεν έχουν καταχωρημένο αριθμό φαξ στη βάση
(Fax), ταξινομημένα ανά κωδικό πελάτη (CustomerId), όνομα πελάτη (ContactName),
και κωδικό παραγγελίας (OrderId). ΣΗΜΕΙΩΣΗ: Το ποσό χρέωσης ανά παραγγελία
προκύπτει αν για κάθε προϊόν της παραγγελίας πολλαπλασιάσουμε το UnitPrice με
το Quantity και σε αυτό το ποσό εφαρμόσουμε το ποσοστό έκπτωσης Discount, και
αθροίζοντας για όλα τα προϊόντα της παραγγελίας.*/

/*7. Ορίστε την παραπάνω επερώτηση ως όψη με το όνομα: VI_FILESDB και
χρησιμοποιήστε τη για να βρείτε τον κωδικό πελάτη (CustomerId), το έτος (YEAR), την
περιοχή (Region) και το συνολικό ύψος παραγγελιών (TOTAL) του καλύτερου πελάτη
μεταξύ των πελατών που επιλέγει η επερώτηση 6, με βάση το συνολικό ύψος των
παραγγελιών του κάθε πελάτη, ανά περιοχή (Region) και έτος (YEAR), ταξινομημένα
κατά έτος, περιοχή και κωδικό πελάτη. [ΠΡΟΣΟΧΗ: θα παραδώσετε ΜΟΝΟ το SQL
query όχι το CREATE VIEW]*/