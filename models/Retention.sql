-- {{ config(materialized='table') }}

-- with data_json as (
--     SELECT _airbyte_data
--     id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
--   FROM
--    Export1._airbyte_raw_customer_retention


-- )


-- select

-- PARSE_DATE('%Y%m%d', JSON_VALUE(data_json_format.date)) as date,
-- JSON_VALUE(data_json_format.newVsReturning) as User_type,
-- JSON_VALUE(data_json_format.totalUsers) totalUsers,
-- JSON_VALUE(data_json_format.property_id) property_id,
-- JSON_VALUE(data_json_format.uuid) uuid
-- from data_json