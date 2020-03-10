-- Verify flipr:hashtags on snowflake

USE WAREHOUSE &COMPUTE_WH;
SELECT flip_id, hashtag FROM flipr.hashtags WHERE FALSE;
