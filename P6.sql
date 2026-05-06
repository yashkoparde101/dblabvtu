-- p6.sql
-- Parameterized cursor merge operation
-- Create sample Employee table and insert data
CREATE TABLE Employee (
    E_id INT AUTO_INCREMENT PRIMARY KEY,
    E_name VARCHAR(100),
    Age INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (E_name, Age, Salary) VALUES
    ('John Doe', 30, 50000.00),
    ('Jane Smith', 28, 60000.00),
    ('Michael Johnson', 35, 75000.00);

-- Create procedure to merge data from N_RollCall to O_RollCall using cursor
DROP PROCEDURE IF EXISTS merge_data;
DELIMITER //

CREATE PROCEDURE merge_data()
BEGIN
    -- Variable declarations
    DECLARE v_n_rollcall_id INT;
    DECLARE v_n_rollcall_data VARCHAR(255);
    DECLARE v_exists INT;
    DECLARE done BOOLEAN DEFAULT FALSE;

    -- Cursor for N_RollCall table
    DECLARE n_rollcall_cursor CURSOR FOR
        SELECT ID, Data FROM N_RollCall;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN n_rollcall_cursor;

    -- Loop through records
    n_rollcall_loop: LOOP

        FETCH n_rollcall_cursor 
        INTO v_n_rollcall_id, v_n_rollcall_data;

        IF done THEN
            LEAVE n_rollcall_loop;
        END IF;

        -- Check if record already exists in O_RollCall
        SELECT COUNT(*)
        INTO v_exists
        FROM O_RollCall
        WHERE Data = v_n_rollcall_data;

        IF v_exists = 0 THEN
            -- Insert new record if not exists
            INSERT INTO O_RollCall (ID, Data)
            VALUES (v_n_rollcall_id, v_n_rollcall_data);
        END IF;

    END LOOP;

    -- Close cursor
    CLOSE n_rollcall_cursor;
END//

DELIMITER ;
