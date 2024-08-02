ALTER TABLE `users`
ADD `org` VARCHAR(20) NOT NULL DEFAULT 'unemployed',
ADD `org_permissions` VARCHAR(255) NOT NULL DEFAULT '{}';