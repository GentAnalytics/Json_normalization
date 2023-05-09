
-- with second_json as (
--     SELECT _airbyte_data
--     id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
--   FROM
--    Export1._airbyte_raw_customer_retention_monthly
-- ),


-- second_part_of_data as (
--     select
-- -- PARSE_DATE('%Y%m%d', JSON_VALUE(data_json_format.month)) as month2,
-- CONCAT(JSON_VALUE(data_json_format,'$.year'), JSON_VALUE(data_json_format,'$.month')) YearMonth2,
-- JSON_VALUE(data_json_format.streamName) streamName2,
-- -- JSON_VALUE(data_json_format.newVsReturning) as User_type,
-- JSON_VALUE(data_json_format.totalUsers) totalReturningUsers
-- -- JSON_VALUE(data_json_format.property_id) property_id,
-- -- JSON_VALUE(data_json_format.uuid) uuid

-- FROM Export1._airbyte_raw_customer_retention_monthly,
--       UNNEST([SAFE.PARSE_JSON(_airbyte_data)]) AS data_json_format
--     WHERE JSON_VALUE(data_json_format.newVsReturning) = 'returning' 
-- -- from data_json
-- -- WHERE JSON_VALUE(data_json_format.newVsReturning)='returning'
-- )

-- select * from second_part_of_data


