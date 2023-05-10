{{ config(materialized='table') }}

with input_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_content__summary

),





first_part_of_data as (
    select
 JSON_VALUE(data_json_format,'$.customEvent:program_brand') AS program_brand,
 JSON_VALUE(data_json_format,'$.customEvent:program_category') AS program_category,
 JSON_VALUE(data_json_format,'$.customEvent:program_name') AS program_name,
 JSON_VALUE(data_json_format,'$.customEvent:program_variant') AS program_variant,
 JSON_VALUE(data_json_format,'$.customEvent:video_type') AS video_type
--  JSON_VALUE(data_json_format.eventName) eventName
--  JSON_VALUE(data_json_format.sessions) sessions
-- JSON_VALUE(data_json_format.uuid) uuid,
-- JSON_VALUE(data_json_format.property_id) property_id
from input_json
)

select * from first_part_of_data