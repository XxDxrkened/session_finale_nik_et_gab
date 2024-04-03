USE epharmacy;

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
