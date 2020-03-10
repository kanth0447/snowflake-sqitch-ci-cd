-- Verify flipr:lists on snowflake

USE WAREHOUSE &COMPUTE_WH;
SELECT nickname, name, description, created_at
  FROM flipr.lists
 WHERE FALSE;
