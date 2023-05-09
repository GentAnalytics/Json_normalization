
with first_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_basicmetricsdaily

),

second_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Export1._airbyte_raw_customer_retention_daily),



first_part_of_data as (
    select

PARSE_DATE('%Y%m%d', JSON_VALUE(data_json_format.date)) as date,
JSON_VALUE(data_json_format.streamName) streamName,
JSON_VALUE(data_json_format.sessions) sessions,
JSON_VALUE(data_json_format.totalUsers) totalUsers,
JSON_VALUE(data_json_format.activeUsers) activeUsers,
JSON_VALUE(data_json_format.newUsers) newUsers,
-- JSON_VALUE(data_json_format.uuid) uuid,
-- JSON_VALUE(data_json_format.property_id) property_id
from first_json
)


,

second_part_of_data as (
    select
PARSE_DATE('%Y%m%d', JSON_VALUE(data_json_format.date)) as date2,
JSON_VALUE(data_json_format.streamName) streamName2,
-- JSON_VALUE(data_json_format.newVsReturning) as User_type,
JSON_VALUE(data_json_format.totalUsers) totalReturningUsers
-- JSON_VALUE(data_json_format.property_id) property_id,
-- JSON_VALUE(data_json_format.uuid) uuid

FROM Export1._airbyte_raw_customer_retention_daily,
      UNNEST([SAFE.PARSE_JSON(_airbyte_data)]) AS data_json_format
    WHERE JSON_VALUE(data_json_format.newVsReturning) = 'returning' 
-- from data_json
-- WHERE JSON_VALUE(data_json_format.newVsReturning)='returning'
)

SELECT 
date,
streamName,
sessions,
totalUsers, 
activeUsers,
newUsers,
totalReturningUsers
FROM first_part_of_data
JOIN second_part_of_data
ON first_part_of_data.date = second_part_of_data.date2 AND first_part_of_data.streamName = second_part_of_data.streamName2
