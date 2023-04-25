{{ config(materialized='table') }}

with data_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_allevents

)


JSON_VALUE(data_json_format.hour) hour,
JSON_VALUE(data_json_format.eventName) eventName,
JSON_VALUE(data_json_format,'$.customUser:user_id') AS userid,
JSON_VALUE(data_json_format.pageTitle) pageTitle,
JSON_VALUE(data_json_format, '$.customEvent:program_name') AS program_name,
JSON_VALUE(data_json_format, '$.customEvent:program_variant') AS program_variant,
JSON_VALUE(data_json_format.activeUsers) activeusers,
JSON_VALUE(data_json_format.property_id) property_id,
JSON_VALUE(data_json_format.uuid) uuid
from data_json
