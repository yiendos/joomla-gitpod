UPDATE `j_extensions` SET `enabled` = '1', `state` =0 WHERE `name` IN ('plg_system_joomlatools', 'com_pages');

REPLACE INTO `j_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
('101', 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_pages&view=page', 'component', '1', '1', '1', '10001', '0', '0000-00-00 00:00:00', '0', '1', ' ', '0', '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '41', '42', '1', '*', '0');