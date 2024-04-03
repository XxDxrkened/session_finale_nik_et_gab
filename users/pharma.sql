USE epharmacy;

-- Question 4 - Les noms complets utilisateurs de la e-pharmacie et la durée moyenne de chacun une fois connecté dans l’application ? 5pts
select concat(u.firstname, " ", u.lastname) as "nom complet", avg(c.onsite_time) as "temps moyen" from users u join connection_history c on u.id=c.user_id group by u.id;

-- Question 5 - Le rôle de l’utilisateur ayant passé le plus de temps étant connecté dans l’application ? 3pts
select concat(u.firstname, " ", u.lastname) as "nom complet", r.name as "role", sum(c.onsite_time) from roles r 
join users u on r.id=u.role_id
join connection_history c on u.id=c.user_id 
group by c.user_id 
order by sum(c.onsite_time) desc limit 1;

-- Question 6 - Les fournisseurs des 3 produits les plus commercialisés ? 7pts
select s.name as "nom fournisseur", p.name as "nom produit", sum(sp.quantity) as "quantite"from suppliers s 
join products p on s.id=p.supplier_id 
join stock_product sp on p.id=sp.product_id 
group by p.id order by sum(sp.quantity) desc limit 3;

-- Question 7 - Les chiffres d'affaires par entrepôts. 5pts
select w.name as "entrepot", sum(o.total_amount) as "somme des ventes"
from orders o
join carts c on o.cart_id = c.id
join cart_product cp on c.id = cp.cart_id
join products p on cp.product_id = p.id
join warehouses w on p.warehouse_id = w.id
group by w.name;

-- Question 8 - Modifier la table products de sorte à affecter l’image “medoc.jpg” comme image par défaut aux produits médicaux. 5pts
ALTER TABLE products ALTER column image SET DEFAULT "medoc.jpg";

-- Question 9 - Ajouter une colonne gender spécifiant le sexe des utilisateurs de l’application. Cette colonne doit être une énumération contenant pour valeur MALE, FEMALE et OTHER. 5pts
alter table users add gender enum("male", "female", "other");

-- Question 10 - Ecrire une procédure stockée spProfileImage permettant d'affecter une image de profil par défaut aux utilisateurs : 15pts
-- a. Les utilisateurs MALE auront pour image male.jpg
-- b. Les utilisateurs FEMALE auront pour image femage.jpg
-- c. Les autres auront utilisateur auront pour image other.jpg
call spProfileImage();

-- Question 11 - Ajouter une contrainte a la table users afin de garantir l’unicité des adresses électroniques(email) des utilisateurs de l’application 5pts
alter table users add constraint uc_email unique (email);

-- Question 12 - Effectuez sous forme de transactions toutes les insertions nécessaires pour passer les ventes représentées par la capture suivante :
-- a. Insérer un nouvel utilisateur au nom de Alain Foka avec un mot de passe correspondant à la chaine vide. 5pts
-- b. La date de chaque commande doit être à l’instant auquel la commande est insérée 5pts
-- c. Ces commandes sont éditées par l’administrateur Abdoulaye Mohamed 5pts
-- d. Calculez le total de chacune des commandes et insérer convenablement 5pts
-- e. Le taux d’impôt pour chacune des factures s’élève a 10% 5pts

START TRANSACTION;

INSERT INTO `products`(`id`, `name`, `description`, `code_product`, `supplier_id`, `warehouse_id`, `image`, `min_quantity`, `price`)
VALUES 
(6, 'Gravol', 'Produit pour les nausés', '', 1, 1, NULL, 1, 5.50),
(7, 'Ibuprophen', 'Produit anti-douleur', '', 1, 1, NULL, 1, 11),
(8, 'Multi-Vitamin', 'Produit pour la nutrition', '', 1, 1, NULL, 1, 25),
(9, 'Ducolax', 'Produit laxatif', '', 1, 1, NULL, 1, 10);

INSERT INTO `users` (`firstname`, `lastname`, `country`, `email`, `password`, `image`, `role_id`)
VALUES ('Alain', 'Foka', 'Canada', 'alainfoka@example.com', '', '', '3' );

-- User ID de Fati Amadou
SET @fati_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Fati' AND `lastname` = 'Amadou');

-- User ID de Alain Foka
SET @alain_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Alain' AND `lastname` = 'Foka');

-- User ID de l'admin Abdoulaye Mohamed
SET @admin_user_id = (SELECT `id` FROM `users` WHERE `firstname` = 'Abdoulaye' AND `lastname` = 'Mohamed');

-- ID des produits
SET @advil_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Advile');
SET @ducolax_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ducolax');
SET @paracetamol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Paracetamol2');
SET @gravol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Gravol');
SET @ibuprophen_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Ibuprophen');
SET @multivitamin_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Multi-Vitamine');
SET @tylenol_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Tilenol');
SET @bonkoga_product_id = (SELECT `id` FROM `products` WHERE `name` = 'Bon Koga');

-- Insertion des commandes pour Fati Amadou
INSERT INTO `orders` (`customer_id`, `order_date`, `total_amount`, `status`, `user_id`, `cart_id`)
VALUES
(),
(),
(),

-- pour Alain Foka
(),
(),
(),
(),

-- pour Fati Amadou encore
(),
(),
();

-- Insertion des utilisateurs a l'interieure de carts
INSERT INTO `carts` (`user_id`, `actif`)
VALUES
(@fati_user_id, 1),
(@alain_user_id, 1),
(@fati_user_id, 1);

-- Insertion des produits dans cart_product
INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity`, `total`, `tax`, `quantity_remainder`)
VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

-- Insertion des donnes dans la table invoices
INSERT INTO `invoices` (`montant`, `tax`, `users_id`)
VALUES
(),
(),
();

-- Insertion des invoices dans invoice_elements
INSERT INTO `invoice_elements` (`invoice_id`)
VALUES
(),
(),
();

-- Modification des donnes
update users set designation = "comptable", adress = "415 Av. de l'Universite", province = "NB",
postal_code = "E1A3E9", phone = "4065954526", email = "Ali@ccnb.ca"
where firstname = "Ali";

update users set designation = "RH", adress = "1750 Rue Crevier", province = "QC",
postal_code = "H4L2X5", phone = "5665954526", email = "Oumar@gmail.com"
where firstname = "Oumar";

update users set designation = "Consultant", adress = "674 Van horne", province = "NS",
postal_code = "B4V4V5", phone = "7854665265", email = "Foka@ccnb.ca"
where firstname = "Dupom";