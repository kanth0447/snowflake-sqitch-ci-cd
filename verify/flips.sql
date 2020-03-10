-- Verify flipr:flips on snowflake

USE WAREHOUSE &COMPUTE_WH;
SELECT id, nickname, body, timestamp
  FROM flipr.flips
 WHERE FALSE;
