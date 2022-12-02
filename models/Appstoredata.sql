{{ config(materialized='table') }}

with data_json as (
    SELECT _airbyte_data
    id, SAFE.PARSE_JSON(_airbyte_data) AS data_json_format
  FROM
   Appstore_raw2._airbyte_raw_sales_report

)

select
  JSON_VALUE(data_json_format.category) Category,
  JSON_VALUE(data_json_format.device) Device,
  JSON_VALUE(data_json.end_date) DateOfDownload,
  JSON_VALUE(data_json.end_date.sku) sku,
  JSON_VALUE(data_json_format.customer_currency) Currency,
  JSON_VALUE(data_json_format.version) Version,
  JSON_VALUE(data_json_format.country_code) Country,
  JSON_VALUE(data_json_format.supported_platforms) platforms

from data_json
