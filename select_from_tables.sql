-- Панфилов Павел Андреевич
-- Вариант 3

-- Выберите номера стеллажей, а также объём одного места и суммарный объём всех мест на каждом из них.
SELECT
    storage_id,
    "number",
    ROUND((height * width * length)::numeric, 3) AS place_volume,
    ROUND((height * width * length * space)::numeric, 3) AS total_volume
FROM public."Стеллаж / E2"
ORDER BY storage_id, "number";

-- Выберите номера помещений и суммарный объём всех мест всех стеллажей в каждом из них, оставив только те помещения суммарный объем всех стеллажей которых больше 50 м3.
SELECT
    storage_id,
    ROUND(SUM(height * width * length * space)::numeric, 3) AS total_volume
FROM public."Стеллаж / E2"
GROUP BY storage_id
HAVING SUM(height * width * length * space) > 50
ORDER BY storage_id;
