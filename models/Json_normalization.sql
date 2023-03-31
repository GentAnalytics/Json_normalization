{{ config(materialized='table') }}

with data_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Customer_churn._airbyte_raw_customer_id_day

)



select
JSON_VALUE(data_json_format.date) date,
JSON_VALUE(data_json_format.sessions) sessions,
JSON_VALUE(data_json_format.uuid) uuid,
JSON_VALUE(data_json_format, '$.customUser:user_id') AS User_id,
JSON_VALUE(data_json_format, '$.customUser:gender') AS User_gender,
JSON_VALUE(data_json_format, '$.customUser:user_age') AS User_age



from data_json


