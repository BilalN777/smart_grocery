SELECT COLUMN_NAME, CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'food' 
AND TABLE_NAME = 'tableconvert.com_amyma8' 
AND CONSTRAINT_NAME = 'PRIMARY';