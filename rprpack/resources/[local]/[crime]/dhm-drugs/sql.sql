CREATE TABLE `dhm_weed` (
  `weedid` int(11) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `progress` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Weed
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-weedseed', 'Weed Seed', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-weed', 'Weed Leaf', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-weedbud', 'Weed Bud', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-fertilizer', 'Fertilizer', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-rollpaper', 'Rolling Paper', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-weedjoint', 'Weed Joint', 1, 0, 1);

-- Heroin
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-poppyseed', 'Poppy Seed', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-poppypod', 'Poppy Seed Pod', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-needle', 'Unused Needle', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-opium', 'Opium', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-fentanyl', 'Fentanyl', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-heroin', 'Heroin Dose', 1, 0, 1);

-- Meth
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-methkit', 'Meth Kit', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-ephedrine', 'Ephedrine', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-ammonia', 'Ammonia', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-meth', 'Meth', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-pmeth', 'Packaged Meth', 1, 0, 1);

-- Coke
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-vicodin', 'Vicodin', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-vpowder', 'Vicodin Powder', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-cocaleaf', 'Coca Leaf', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-coke', 'Coke', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-pcoke', 'Packaged Coke', 1, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-acid', 'Acid', 1, 0, 1);

-- Meth & Coke
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dhm-baggie', 'Baggie', 1, 0, 1);

ALTER TABLE `users`
ADD `reputation` int(11) NOT NULL DEFAULT 0;
