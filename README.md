Challenge - Analytics Engineer

Challenge Engineer - Primera Parte – SQL

Puntos a evaluar 
•	Interpretación de la consigna 
•	Orden y comentarios del código 
•	Queries simples y efectivas 
•	Calidad del entregable 
•	Si pensás en otro punto que pueda sumar, sentite libre de agregarlo y comentarnos cuál es y por qué lo sumaste.

Objetivo
A partir de la siguiente necesidad, se requiere diseñar un DER que responda al modelo del negocio. Luego, se debe responder mediante SQL diferentes preguntas. 

Descripción de la necesidad 
Teniendo en cuenta el modelo de ecommerce que manejamos, tenemos algunas entidades básicas que queremos representar: Customer, Order, Item y Category. 
•	Customer: Es la entidad donde se encuentran todos nuestros usuarios, ya sean Buyers o Sellers del Site. Los principales atributos son email, nombre, apellido, sexo, dirección, fecha de nacimiento, teléfono, entre otros. 
•	Item: Es la entidad donde se encuentran los productos publicados en nuestro marketplace. El volumen es muy grande debido a que se encuentran todos los productos que en algún momento fueron publicados. Mediante el estado del ítem o fecha de baja se puede detectar los ítems activos del marketplace.  
•	Category: Es la entidad donde se encuentra la descripción de cada categoría con su respectivo path. Cada ítem tiene asociado una categoría. 
•	Order: La order es la entidad que refleja las transacciones generadas dentro del site (cada compra es una order). En este caso no vamos a contar con un flujo de carrito de compras por lo tanto cada ítem que se venda será reflejado en una order independientemente de la cantidad que se haya comprado.






Flujo de Compras
•	Un usuario ingresa al sitio de Mercado Libre para comprar dos dispositivos móviles iguales. 
•	Realiza la búsqueda navegando por la categorías Tecnología > Celulares y Teléfonos > Celulares y Smartphones, y finalmente encuentra el producto que necesita comprar. 
•	Procede con la compra del mismo seleccionado dos unidades, el cual genera una orden de compra.


A resolver
1.	Listar los usuarios que cumplan años el día de hoy cuya cantidad de ventas realizadas en enero 2020 sea superior a 1500. 
2.	Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. 
3.	Se solicita poblar una nueva tabla con el precio y estado de los Ítems a fin del día. Tener en cuenta que debe ser reprocesable. Vale resaltar que en la tabla Item, vamos a tener únicamente el último estado informado por la PK definida. (Se puede resolver a través de StoredProcedure) 

Backlog de Tareas
A partir de la situación planteada, te pedimos: 
•	Diseñar un DER del modelo de datos que logre responder cada una de las preguntas mencionadas anteriormente.
•	Generar el script DDL para la creación de cada una de las tablas representadas en el DER. Enviarlo con el nombre “create_tables.sql”. 
•	Generar el código SQL para responder cada una de las situaciones mencionadas anteriormente sobre el modelo diseñado. Nombre solicitado:  “respuestas_negocio.sql”

