USE epharmacy;

-- Question 3
create user 'pharma'@'localhost' identified by '1234'; 

-- Droits Question 4
grant select on epharmacy.users to 'pharma'@'localhost';
grant select on epharmacy.connection_history to 'pharma'@'localhost';

-- Droits Question 5
grant select on epharmacy.roles to 'pharma'@'localhost';

-- Droits Question 6
grant select on epharmacy.suppliers to 'pharma'@'localhost';
grant select on epharmacy.products to 'pharma'@'localhost';
grant select on epharmacy.stock_product to 'pharma'@'localhost';

-- Droits Question 7
grant select on epharmacy.orders to 'pharma'@'localhost';
grant select on epharmacy.carts to 'pharma'@'localhost';
grant select on epharmacy.cart_product to 'pharma'@'localhost';
grant select on epharmacy.warehouses to 'pharma'@'localhost';

-- Droits Question 8
grant alter on epharmacy.products to 'pharma'@'localhost';

-- Droits Question 9
grant alter on epharmacy.users to 'pharma'@'localhost';

-- Droits Question 10
-- Incapable de creer procedure dans l'instance pharma, donc ont la fait ici
DROP PROCEDURE IF EXISTS spProfileImage;
delimiter $
create procedure spProfileImage()
begin
    update users
    set image = 'male.jpg'
    where gender = 'male'
    and image = '';
    update users
    set image = 'female.jpg'
    where gender = 'female'
    and image is null;
    update users
    set image = 'other.jpg'
    where gender = 'other'
    and image is null;
end $
delimiter ;
grant execute on procedure epharmacy.spProfileImage to 'pharma'@'localhost';

-- Droits Question 12
grant insert on epharmacy.carts to 'pharma'@'localhost';
grant insert on epharmacy.cart_product to 'pharma'@'localhost';
grant insert on epharmacy.orders to 'pharma'@'localhost';
grant insert on epharmacy.products to 'pharma'@'localhost';
grant insert on epharmacy.invoices to 'pharma'@'localhost';
grant insert on epharmacy.invoice_elements to 'pharma'@'localhost';

 -- Modification des donnees 
grant update on epharmacy.users to 'pharma'@'localhost';