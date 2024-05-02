-- Explicación del paso a paso de las Querys en la documentación que se encuentra en el archivo Entregable donde explico mejor el detalle.


-- 1.Listar los usuarios que cumplan años el día de hoy cuya cantidad de ventas realizadas en enero 2020 sea superior a 1500. 

SELECT
    c.nombre,
    c.apellido,
    c.fecha_nacimiento,
    COUNT(o.order_id) AS cantidad_ventas,
    SUM(o.cantidad_productos) AS total_productos_vendidos,
    SUM(o.total_transaccion) AS total_transaccionado
FROM
    Customers c
JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    MONTH(c.fecha_nacimiento) = MONTH(CURDATE())
    AND DAY(c.fecha_nacimiento) = DAY(CURDATE())
    AND YEAR(o.fecha_transaccion) = 2020
    AND MONTH(o.fecha_transaccion) = 1
GROUP BY
    c.customer_id
HAVING
    COUNT(o.order_id) > 1500;
    
    
-- 2.Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. 

WITH ventas_celulares AS (
    SELECT
        MONTH(o.fecha_transaccion) AS mes,
        YEAR(o.fecha_transaccion) AS año,
        c.nombre,
        c.apellido,
        COUNT(o.order_id) AS cantidad_ventas,
        SUM(o.cantidad_productos) AS total_productos_vendidos,
        SUM(o.total_transaccion) AS total_transaccionado
    FROM
        Customers c
    JOIN
        Orders o ON c.customer_id = o.customer_id
    JOIN
        Items i ON o.item_id = i.item_id
    JOIN
        Categorys cat ON i.category_id = cat.category_id
    WHERE
        YEAR(o.fecha_transaccion) = 2020
        AND MONTH(o.fecha_transaccion) = 1
        AND cat.name = 'Celulares'
    GROUP BY
        c.customer_id, MONTH(o.fecha_transaccion), YEAR(o.fecha_transaccion)
)
SELECT
    v.mes,
    v.año,
    v.nombre,
    v.apellido,
    v.cantidad_ventas,
    v.total_productos_vendidos,
    v.total_transaccionado
FROM
    ventas_celulares v
ORDER BY
    v.año,
    v.mes,
    v.total_transaccionado DESC
LIMIT
    5;
    
    
-- 3.Se solicita poblar una nueva tabla con el precio y estado de los Ítems a fin del día. Tener en cuenta que debe ser reprocesable. Vale resaltar que en la tabla Item, vamos a tener únicamente el último estado informado por la PK definida. (Se puede resolver a través de StoredProcedure) 
CREATE TABLE PrecioEstadoItems (
  item_id INT PRIMARY KEY,
  precio DECIMAL(10, 2),
  estado VARCHAR(50),
  fecha_actualizacion DATE
);

DELIMITER //

CREATE PROCEDURE ActualizarPrecioEstadoItems()
BEGIN
    -- Eliminar los registros anteriores de la tabla
    TRUNCATE TABLE PrecioEstadoItems;

    -- Insertar los precios y estados más recientes de los ítems
    INSERT INTO PrecioEstadoItems (item_id, precio, estado, fecha_actualizacion)
    SELECT
        item_id,
        precio,
        estado,
        CURDATE() AS fecha_actualizacion
    FROM
        Items
    WHERE
        (item_id, fecha_actualizacion) IN (
            SELECT
                item_id,
                MAX(fecha_actualizacion)
            FROM
                Items
            GROUP BY
                item_id
        );
END //

DELIMITER ;

