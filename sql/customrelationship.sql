INSERT INTO `civicrm_custom_group` (`name`, `title`, `extends`, `extends_entity_column_id`, `extends_entity_column_value`, `style`, `collapse_display`, `help_pre`, `help_post`, `weight`, `is_active`, `table_name`, `is_multiple`, `min_multiple`, `max_multiple`, `collapse_adv_display`, `created_id`, `created_date`, `is_reserved`) VALUES 
 ('PCP_Relationship_Set', 'PCP Relationship Set', 'Relationship', NULL, NULL, 'Inline', 1, '', '', 3, 1, 'civicrm_value_pcp_relationship_set', 0, NULL, NULL, 0, NULL, NULL, 0)
 SELECT @custom_group_id := LAST_INSERT_ID();
 
 INSERT INTO `civicrm_custom_field` (`custom_group_id`, `name`, `label`, `data_type`, `html_type`, `default_value`, `is_required`, `is_searchable`, `is_search_range`, `weight`, `help_pre`, `help_post`, `mask`, `attributes`, `javascript`, `is_active`, `is_view`, `options_per_line`, `text_length`, `start_date_years`, `end_date_years`, `date_format`, `time_format`, `note_columns`, `note_rows`, `column_name`, `option_group_id`, `filter`, `in_selector`) VALUES
(@custom_group_id, 'PCP_A_B', 'PCP A B', 'Int', 'Text', NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 255, NULL, NULL, NULL, NULL, 60, 4, 'pcp_a_b', NULL, NULL, 0),
(@custom_group_id, 'PCP_B_A', 'PCP B A', 'Int', 'Text', NULL, 0, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 255, NULL, NULL, NULL, NULL, 60, 4, 'pcp_b_a', NULL, NULL, 0);

CREATE TABLE IF NOT EXISTS `civicrm_value_pcp_relationship_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Table that this extends',
  `pcp_a_b` int(11) DEFAULT NULL,
  `pcp_b_a` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entity_id` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

ALTER TABLE `civicrm_value_pcp_relationship_set`
  ADD CONSTRAINT `FK_civicrm_value_pcp_relationship_set_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `civicrm_relationship` (`id`) ON DELETE CASCADE;