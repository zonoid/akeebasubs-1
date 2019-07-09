# User groups
TRUNCATE TABLE `#__usergroups`;

INSERT INTO `#__usergroups` VALUES
(1, 0, 1, 28, 'Public'),
(2, 1, 12, 19, 'Registered'),
(3, 2, 13, 18, 'Author'),
(4, 3, 14, 17, 'Editor'),
(5, 4, 15, 16, 'Publisher'),
(6, 1, 8, 11, 'Manager'),
(7, 6, 9, 10, 'Administrator'),
(8, 1, 26, 27, 'Super Users'),
(9, 1, 6, 7, 'Guest'),
(10, 1, 2, 3, 'Cookies Accepted'),
(11, 1, 4, 5, 'Cookies Declined'),
(12, 1, 20, 25, 'Subscriber'),
(13, 12, 23, 24, 'Data Compliance Subscriber'),
(14, 12, 21, 22, 'Contact Us Subscriber');

# View access levels

TRUNCATE TABLE `#__viewlevels`;

INSERT INTO `#__viewlevels` (`id`, `title`, `ordering`, `rules`)
VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]'),
(7, 'Cookies Allowed', 0, '[10]'),
(8, 'Cookies Forbidden', 0, '[11]'),
(9, 'Subscriber', 0, '[12,14,13]'),
(10, 'Subscriber - Contact Us', 0, '[14]'),
(11, 'Subscriber - Data Compliance', 0, '[13]');

# Users. Super User login is admin/admin

TRUNCATE TABLE `#__users`;

INSERT INTO `#__users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`)
VALUES
	(100, 'Super User', 'admin', 'admin@test.web', '$2y$10$ib5dgJyv9jVG6zCiboPOZOSzKbkt4kCUwU.wKqEujV5ZKonRzR16y', 0, 1, '2015-04-28 21:28:05', '2015-04-28 21:28:31', '0', '', '0000-00-00 00:00:00', 0, '', '', 0),
	(1000, 'User One', 'user1', 'user1@test.web', '$2y$10$vyC0MR3wtTRwD4JjvQylrOu0NGtFJ2HJSUJkpo9eDyHZO9L7.kj4m', 0, 0, '2015-04-29 18:13:57', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(1001, 'User Two', 'user2', 'user2@test.web', '$2y$10$LpoNGSf0UMrt6BCrANfFkOD0bwxvJobHULVr4Daz0cDVkmVjwFCqO', 1, 0, '2015-04-29 18:13:57', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(1002, 'User Three', 'user3', 'user3@test.web', '$2y$10$9ezk6XoWrpyXUXESQccRcOX65xsY0mX8NVLh6tDX7HMxbipQk/ji.', 1, 0, '2015-04-29 18:13:57', '0000-00-00 00:00:00', 'notempty', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(1010, 'User Four', 'user4', 'user4@test.web', '$2y$10$9ezk6XoWrpyXUXESQccRcOX65xsY0mX8NVLh6tDX7HMxbipQk/ji.', 1, 0, '2015-04-29 18:13:57', '2015-04-28 21:28:31', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
	(1011, 'User Five', 'user5', 'user5@test.web', '$2y$10$9ezk6XoWrpyXUXESQccRcOX65xsY0mX8NVLh6tDX7HMxbipQk/ji.', 1, 0, '2015-04-29 18:13:57', '2015-04-28 21:28:31', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0),
  (1020, 'Guinea Pig', 'guineapig', 'guineapig@test.web', '$2y$10$vyC0MR3wtTRwD4JjvQylrOu0NGtFJ2HJSUJkpo9eDyHZO9L7.kj4m', 0, 0, '2015-04-29 18:13:57', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0, '', '', 0);

# Users to user groups

TRUNCATE TABLE `#__user_usergroup_map`;

INSERT INTO `#__user_usergroup_map` (`user_id`, `group_id`)
VALUES
  (100, 8),
  (1000, 2),
  (1000, 10),
  (1001, 2),
  (1002, 2),
  (1010, 2),
  (1011, 2),
  (1011, 9),
  (1011, 11),
  (1020, 2);

# Akeeba Subscriptions: Users

TRUNCATE TABLE `#__akeebasubs_users`;

INSERT INTO `#__akeebasubs_users` (`akeebasubs_user_id`, `user_id`, `isbusiness`, `businessname`, `occupation`, `vatnumber`, `viesregistered`, `taxauthority`, `address1`, `address2`, `city`, `zip`, `country`, `params`, `notes`, `needs_logout`)
VALUES
  (1, 1010, 1, 'Η Εταιρία', 'Κατασκευή προγραμμάτων', '', 0, NULL, 'Μεγάλου Αλεξάνδρου 1', 'Γραφείο 101', 'Κωλοπετινίτσα', '99999', 'GR', '[]', '', 0),
  (2, 1011, 1, 'Τρία Κιλά Κώδικα ΑΕ', 'Εμπορία λογισμικού', '123456789', 2, NULL, 'Μακρυγιάννη 13', '', 'Μικρό Πεύκο', '99888', 'GR', '[]', '', 0),
  (3, 1000, 1, 'Unit Test Ltd', 'Software TEsting', '123456789', 1, NULL, '123 Someplace Drive', 'Suite 404', 'Beverly Hills', '90210', 'US', '{"baz": "bat", "something": 12.34}', 'This is a user note', 0);

# Subscription levels

TRUNCATE TABLE `#__akeebasubs_levels`;

INSERT INTO `#__akeebasubs_levels` (akeebasubs_level_id, title, slug, image, `description`, duration, price, related_levels, paddle_product_id, paddle_secret, upsell, paddle_plan_id, paddle_plan_secret, ordertext, only_once, recurring, forever, access, fixed_date, renew_url, content_url, params, enabled, ordering, created_on, created_by, modified_on, modified_by, locked_on, locked_by, notify1, notify2, notifyafter) VALUES
(1, 'DATACOMPLIANCE', 'datacompliance', 'images/levels/product-subscriptions.svg', '<p>One YEAR access to Akeeba Data Compliance downloads and support. Unlimited sites / domains.</p><p>FOO</p><p>BAR</p><p>BAZ</p><p>BAT</p><p>FOOBAR</p><p>FOOBAZ</p><p>FOOBAT</p><p>FOOBARBAZBAT</p><p>BARG</p>', 365, 50, '3', '556046', '1234567', 'always', '556090', 'abcdef0', '<h3>Thank you for your purchase of Akeeba Data Compliance!</h3>
<p>Your subscription will be active until [PUBLISH_DOWN].</p>
<p>This is some further text explaining what benefits you get from this subscription and the next steps you can follow.</p>', 0, 0, 0, 1, '0000-00-00 00:00:00', '', '', '{"joomla_addgroups":["12", "13"],"joomla_removegroups":["12", "13"]}', 1, 0, '2019-03-20 16:19:36', 70, '2019-04-15 12:54:28', 70, '0000-00-00 00:00:00', 0, 30, 15, 0),
(2, 'CONTACTUS', 'contactus', 'images/levels/product-releasesystem.svg', '<p>One YEAR access to Contact Us downloads and support. Unlimited sites / domains.</p>', 365, 50, '3', '556631', '1234567', 'always', '556725', 'abcdef0', '<h3>Thank you for your purchase of Contact Us!</h3>
<p>Your subscription will be active until [PUBLISH_DOWN].</p>
<p>This is some further text explaining what benefits you get from this subscription and the next steps you can follow.</p>', 0, 0, 0, 1, '0000-00-00 00:00:00', '', '', '{"joomla_addgroups":["12", "14"],"joomla_removegroups":["12", "14"]}', 1, 0, '2019-03-20 16:19:43', 70, '2019-04-15 10:30:16', 70, '0000-00-00 00:00:00', 0, 30, 15, 0),
(3, 'BUNDLE', 'bundle', 'images/levels/product-joomla-essentials.svg', '<p>One YEAR access to Akeeba Data Compliance and Contact Us downloads and support. Unlimited domains / sites.</p>', 365, 75, '', '556632', '1234567', 'always', '556729', 'abcdef0', '<h3>Thank you for your bundle purchase</h3>
<p>Here is some text explaining all the amazing stuff you can do with the software you just bought.</p>', 0, 0, 0, 1, '0000-00-00 00:00:00', '', '', '{"joomla_addgroups":["12", "14","13"],"joomla_removegroups":["12", "14","13"]}', 1, 0, '2019-03-20 16:22:43', 70, '2019-04-15 06:25:01', 70, '0000-00-00 00:00:00', 0, 30, 15, 0),
(6, 'FREE', 'free', 'images/joomla-black.png', '<p>Free as in beer.</p>', 365, 0, '', '', '', 'never', '', '', '<h3>Thank you for your free purchase</h3>', 0, 0, 0, 1, '0000-00-00 00:00:00', '', '', '{"joomla_addgroups":["12"],"joomla_removegroups":["12"]}', 1, 0, '2019-03-20 16:22:43', 70, '2019-04-15 06:25:01', 70, '0000-00-00 00:00:00', 0, 30, 15, 0);

# Coupons

TRUNCATE TABLE `#__akeebasubs_coupons`;
INSERT INTO `#__akeebasubs_coupons` (akeebasubs_coupon_id, title, coupon, publish_up, publish_down, subscriptions, user, email, params, hitslimit, userhits, usergroups, type, value, recurring_access, enabled, ordering, created_on, created_by, modified_on, modified_by, locked_on, locked_by, hits) VALUES
(1, 'Welcome Back', 'WELCOMEBACK', '2001-01-01 00:00:00', '2038-01-18 00:00:00', '', 0, '', '{"notes":""}', 0, 0, '', 'lastpercent', 30, 0, 1, 0, '2019-03-20 16:30:04', 70, '2019-03-20 16:34:47', 70, '0000-00-00 00:00:00', 0, 0),
(2, 'Renewal Discount', 'WELCOMEBACK30', '2001-01-01 00:00:00', '2038-01-18 00:00:00', '', 0, '', '{"notes":""}', 0, 0, '', 'percent', 40, 0, 1, 0, '2019-03-20 16:30:23', 70, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'Email', 'HELLOTHERE', '2001-01-01 00:00:00', '2038-01-18 00:00:00', '', 0, '', '{"notes":""}', 0, 0, '', 'percent', 20, 0, 1, 0, '2019-03-20 16:30:38', 70, '2019-04-15 12:00:14', 74, '0000-00-00 00:00:00', 0, 1);

# Subscriptions

TRUNCATE TABLE `#__akeebasubs_subscriptions`;

INSERT INTO `#__akeebasubs_subscriptions` (`akeebasubs_subscription_id`, `user_id`, `akeebasubs_level_id`, `publish_up`, `publish_down`, `notes`, `enabled`, `processor`, `processor_key`, `state`, `net_amount`, `tax_amount`, `gross_amount`, `tax_percent`, `created_on`, `params`, `ip`, `ip_country`, `akeebasubs_coupon_id`, `akeebasubs_upgrade_id`, `akeebasubs_invoice_id`, `prediscount_amount`, `discount_amount`, `contact_flag`, `first_contact`, `second_contact`, `after_contact`)
VALUES
  (1, 1000, 1, '2013-04-30 00:00:00', '2014-04-30 00:00:00', '', 0, 'none', '20130430000000', 'C', 80, 0, 80, 0, '2013-04-30 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2, 1000, 2, '2014-04-30 00:00:00', '2015-04-29 00:00:00', '', 0, 'none', '20140430000001', 'C', 90, 0, 90, 0, '2014-04-30 00:00:00', '{"subcustom":{"lol": "wut", "foo": 123}}', '', '', 3, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (3, 1011, 1, '2014-04-30 00:00:00', '2038-01-01 00:00:00', '', 0, 'none', '20140430000002', 'C', 90, 0, 90, 0, '2014-04-30 00:00:00', '', '', '', 3, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  # For AkpaymentBase testing
  (2000, 1234, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 'none', 'AKPBT2000', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2010, 2010, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 'none', 'AKPBT2010', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2020, 2020, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2020', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2030, 2030, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2030', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2040, 2040, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 'none', 'AKPBT2040', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2041, 2040, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2041', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2042, 2040, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2042', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2043, 2040, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 'none', 'AKPBT2043', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2044, 2040, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2044', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
  (2045, 2040, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 'none', 'AKPBT2045', 'C', 100, 0, 100, 0, '0000-00-00 00:00:00', '[]', '', '', 0, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

# Upgrade rules

TRUNCATE TABLE `#__akeebasubs_upgrades`;


INSERT INTO `#__akeebasubs_upgrades` (`akeebasubs_upgrade_id`, `title`, `from_id`, `to_id`, `min_presence`, `max_presence`, `type`, `value`, `combine`, `expired`, `enabled`, `ordering`, `created_on`, `created_by`, `modified_on`, `modified_by`, `locked_on`, `locked_by`, `hits`)
VALUES
(1, 'DATACOMPLIANCE early bird', 1, 1, 0, 790, 'percent', 40, 0, 0, 1, 0, '2019-03-20 16:23:24', 70, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'CONTACTUS early bird', 2, 2, 0, 730, 'percent', 40, 0, 0, 1, 0, '2019-03-20 16:23:50', 70, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'FREE to CONTACTUS', 6, 2, 0, 730, 'percent', 20, 0, 0, 1, 0, '2019-03-20 16:23:50', 70, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'FREE to DATACOMPLIANCE', 6, 1, 0, 730, 'percent', 30, 0, 0, 1, 0, '2019-03-20 16:23:50', 70, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0);

# Subscription level relations

TRUNCATE TABLE `#__akeebasubs_relations`;

INSERT INTO `#__akeebasubs_relations` (akeebasubs_relation_id, source_level_id, target_level_id, mode, type, amount, low_threshold, low_amount, high_threshold, high_amount, flex_amount, flex_period, flex_uom, flex_timecalculation, time_rounding, expiration, combine, enabled, ordering, created_on, created_by, modified_on, modified_by, locked_on, locked_by)
VALUES
(1, 1, 3, 'flexi', 'value', 0, 1, 5, 11, 37.5, 3, 1, 'm', 'future', 'round', 'replace', 1, 1, 0, '2019-03-20 16:27:44', 70, '2019-03-20 16:27:53', 70, '0000-00-00 00:00:00', 0),
(2, 2, 3, 'flexi', 'value', 0, 1, 5, 11, 37.5, 3, 1, 'm', 'future', 'round', 'replace', 1, 1, 0, '2019-03-20 16:28:44', 70, '2019-03-20 16:28:47', 70, '0000-00-00 00:00:00', 0),
(3, 6, 2, 'fixed', 'percent', 30, 0, 0, 0, 0, 0, 0, 'd', 'current', 'round', 'replace', 0, 1, 0, '2019-07-09 10:53:18.000', 100, NULL, 0, NULL, 0),
(4, 6, 1, 'fixed', 'percent', 20, 0, 0, 0, 0, 0, 0, 'd', 'current', 'round', 'replace', 0, 1, 0, '2019-07-09 10:53:18.000', 100, NULL, 0, NULL, 0);
