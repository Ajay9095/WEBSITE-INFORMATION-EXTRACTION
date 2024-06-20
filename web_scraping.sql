CREATE DATABASE web_scraping;

USE web_scraping;

CREATE TABLE website_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    social_media_links TEXT,
    tech_stack TEXT,
    meta_title VARCHAR(255),
    meta_description TEXT,
    payment_gateways TEXT,
    website_language VARCHAR(50),
    category VARCHAR(100)
);


select *
from website_info;

drop table website_info;

show databases;