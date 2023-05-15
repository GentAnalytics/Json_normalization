 with first_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_user_aquisition

),




first_part_of_data as (
    select
PARSE_DATE('%Y%m%d', JSON_VALUE(data_json_format.date)) as date,
JSON_VALUE(data_json_format.streamName) streamName,
JSON_VALUE(data_json_format.firstUserSource) firstUserSource,
-- JSON_VALUE(data_json_format,'$.customEvent:program_name') AS program_name,
-- JSON_VALUE(data_json_format,'$.customEvent:program_variant') AS program_variant,
JSON_VALUE(data_json_format.newUsers) newUsers,
JSON_VALUE(data_json_format.screenPageViews) Views

from first_json)

select * from first_part_of_data

