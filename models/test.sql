-- with first_json as (
--     SELECT _airbyte_data
--     id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
--   FROM
--    Export1._airbyte_raw_basicmetricsmonthly

-- )

-- select * from first_json