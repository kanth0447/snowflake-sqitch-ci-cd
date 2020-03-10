-- Verify flipr:userflips on snowflake

USE WAREHOUSE &COMPUTE_WH;
SELECT id, nickname, fullname, twitter, body, timestamp
  FROM flipr.userflips
 WHERE FALSE;
