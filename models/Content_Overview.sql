{{ config(materialized='table') }}

with first_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_content__summary

),





first_part_of_data as (
    select
 JSON_VALUE(data_json_format,'$customEvent:program_brand') program_brand,
 JSON_VALUE(data_json_format,'$customEvent:program_category') program_category,
 JSON_VALUE(data_json_format,'$customEvent:program_name') program_name,
 JSON_VALUE(data_json_format,'$customEvent:program_variant') program_variant,
 JSON_VALUE(data_json_format,'$customEvent:video_type') video_type,
 JSON_VALUE(data_json_format.eventName) eventName,
 JSON_VALUE(data_json_format.sessions) sessions
-- JSON_VALUE(data_json_format.uuid) uuid,
-- JSON_VALUE(data_json_format.property_id) property_id
from first_json
)

select * from first_part_of_data