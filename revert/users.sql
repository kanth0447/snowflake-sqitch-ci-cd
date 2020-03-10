-- Revert flipr:users from snowflake

USE WAREHOUSE &COMPUTE_WH;
DROP TABLE flipr.users;
