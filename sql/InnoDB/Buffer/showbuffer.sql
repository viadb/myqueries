-- The Information Schema INNODB_BUFFER_PAGE table provides metadata about each page in the buffer pool, including change buffer index and change buffer bitmap pages.
-- Those pages are identified by PAGE_TYPE. And the pages shows the buffer index pages by IBUF_INDEX and Bitmap buffer pages by IBUF_INDEX
-- You can query the INNODB_BUFFER_PAGE table to determine the approximate number of IBUF_INDEX and IBUF_BITMAP pages as a 
-- percentage of total buffer pool pages.

SELECT (SELECT COUNT(*) FROM INFORMATION_SCHEMA.INNODB_BUFFER_PAGE
       WHERE PAGE_TYPE LIKE 'IBUF%') AS change_buffer_pages,
       (SELECT COUNT(*) FROM INFORMATION_SCHEMA.INNODB_BUFFER_PAGE) AS total_pages,
       (SELECT ((change_buffer_pages/total_pages)*100))
       AS change_buffer_page_percentage;
