INSERT INTO `servermail`.`virtual_domains` (`id` ,`name`) VALUES ('1', 'ich.ovh');
INSERT INTO `servermail`.`virtual_users` (`id`, `domain_id`, `password` , `email`) VALUES ('1', '1', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'paul@ich.ovh');
INSERT INTO `servermail`.`virtual_aliases` (`id`, `domain_id`, `source`, `destination`) VALUES ('1', '1', 'spieker@ich.ovh', 'paul@ich.ovh');
INSERT INTO `servermail`.`virtual_domains` (`id` ,`name`) VALUES ('2', 'pink1.de');
INSERT INTO `servermail`.`virtual_users` (`id`, `domain_id`, `password` , `email`) VALUES ('2', '2', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'stephie@pink1.de');

