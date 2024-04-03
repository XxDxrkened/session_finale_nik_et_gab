-- Question 4
select concat(u.firstname, " ", u.lastname) as "nom complet", avg(c.onsite_time) as "temps moyen" from users u join connection_history c on u.id=c.user_id group by u.id;

-- Question 5
select concat(u.firstname, " ", u.lastname) as "nom complet", r.name as "role", sum(c.onsite_time) from roles r 
join users u on r.id=u.role_id
join connection_history c on u.id=c.user_id 
group by c.user_id 
order by sum(c.onsite_time) desc limit 1;

-- Question 6
select s.name as "nom fournisseur", p.name as "nom produit", sum(sp.quantity) as "quantite"from suppliers s 
join products p on s.id=p.supplier_id 
join stock_product sp on p.id=sp.product_id 
group by p.id order by sum(sp.quantity) desc limit 3;

-- Question 7
select w.name as "entrepot", sum(o.total_amount) as "somme des ventes"
from orders o
join carts c on o.cart_id = c.id
join cart_product cp on c.id = cp.cart_id
join products p on cp.product_id = p.id
join warehouses w on p.warehouse_id = w.id
group by w.name;

-- Question 8
ALTER TABLE products ALTER column image SET DEFAULT "medoc.jpg";

-- Question 9
alter table users add gender enum("male", "female", "other");

-- Question 10
call spProfileImage();

-- Question 11
alter table users add constraint uc_email unique (email);

-- Question 12
start transaction;
insert into products(id, name, description, code_product, supplier_id, warehouse_id, image, min_quantity, price)
values
(6, 'Gravol', '', '', 1, 1, "", 1, 1),
(7, 'Ibuprophen', '', '', 1, 1, "", 1, 10),
(8, 'Multi-Vitamin', '', '', 1, 1, "", 1, 10),
(9, 'Ducolax', '', '', 1, 1, "", 1, 20);

insert into users (firstname, lastname, country, email, password, image, role_id)
values ('Alain', 'Foka', '', '', '', '', 1 );

insert into carts (id, user_id) 
values 
(2, 4),
(3, 7),
(4, 4);

insert into cart_product (cart_id, product_id, quantity, total, tax, quantity_remainder) values
(2, 3, 4, 175.48, 17.55, 21),
(2, 2, 5, 60.95, 6.10, 0),
(2, 6, 7, 7, 0.70, 0),
(3, 7, 5, 50, 5,0),
(3, 9, 3, 60, 6, 0),
(3, 1, 4, 93.6, 9.36, 43),
(3, 6, 7, 7, 0.7, 0),
(4, 8, 1, 10, 1, 0),
(4, 4, 2, 70.2, 7.02, 31),
(4, 6, 10, 10, 1, 0);

insert into orders (customer_id, order_date, total_amount, status, user_id, cart_id) 
values 
(4, current_timestamp(), 267.78, 0, 2, 2),
(7, current_timestamp(), 231.66, 0, 2, 3),
(4, current_timestamp(), 99.22, 0, 2, 4);

insert into invoices (id, montant, tax, users_id)
values
(1, 243.43, 24.35, 4),
(2, 210.6, 21.06, 7),
(3, 90.2, 9.02, 4);

insert into invoice_elements (invoice_id, stocks_id) 
values 
(1, 2),
(2, 2),
(3, 1);
commit;



-- Modification de donnees 
update users set designation = "comptable", adress = "415 Av. de l'Universite", province = "NB",
postal_code = "E1A3E9", phone = "4065954526", email = "Ali@ccnb.ca"
where firstname = "Ali";

update users set designation = "RH", adress = "1750 Rue Crevier", province = "QC",
postal_code = "H4L2X5", phone = "5665954526", email = "Oumar@gmail.com"
where firstname = "Oumar";

update users set designation = "Consultant", adress = "674 Van horne", province = "NS",
postal_code = "B4V4V5", phone = "7854665265", email = "Foka@ccnb.ca"
where firstname = "Dupom";  