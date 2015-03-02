<?php
/**
 *  @package AkeebaSubs
 *  @copyright Copyright (c)2010-2015 Nicholas K. Dionysopoulos
 *  @license GNU General Public License version 3, or later
 */

defined('_JEXEC') or die();

class AkeebasubsHelperFormat
{
	public static function date($date, $format = null)
	{
		JLoader::import('joomla.utilities.date');
		$jDate = new JDate($date);

		if(empty($format)) {
			if(!class_exists('AkeebasubsHelperCparams')) {
				require_once JPATH_ADMINISTRATOR.'/components/com_akeebasubs/helpers/cparams.php';
			}
			$format = AkeebasubsHelperCparams::getParam('dateformat', 'Y-m-d H:i');
			$format = str_replace('%', '', $format);
		}

		return $jDate->format($format, true);
	}

	/**
	 * Check if the given string is a valid date
	 *
	 * @param   string  $date   Date as string
	 *
	 * @return  bool|JDate      False on failure, JDate if successful
	 */
	public static function checkDateFormat($date)
	{
		JLoader::import('joomla.utilities.date');
		$regex = '/^\d{1,4}(\/|-)\d{1,2}(\/|-)\d{2,4}[[:space:]]{0,}(\d{1,2}:\d{1,2}(:\d{1,2}){0,1}){0,1}$/';
		if(!preg_match($regex, $date))
		{
			return false;
		}

		return new JDate($date);
	}

	public static function formatLevel($id)
	{
		static $levels;

		if(empty($levels)) {
			$levelsList = F0FModel::getTmpInstance('Levels','AkeebasubsModel')
				->getItemList(true);
			if(!empty($levelsList)) foreach($levelsList as $level) {
				$levels[$level->akeebasubs_level_id] = $level->title;
			}
		}

		if(array_key_exists($id, $levels)) {
			return $levels[$id];
		} else {
			return '&mdash;&mdash;&mdash;';
		}
	}

	public static function formatLevelgroup($id)
	{
		static $levelgroups;

		if(empty($levelgroups)) {
			$levelgroupsList = F0FModel::getTmpInstance('Levelgroups', 'AkeebasubsModel')
				->savestate(0)
				->getItemList(true);
			if(!empty($levelgroupsList)) foreach($levelgroupsList as $levelgroup) {
				$levelgroups[$levelgroup->akeebasubs_levelgroup_id] = $levelgroup->title;
			} else {
				$levelgroups = array();
			}
		}

		if(array_key_exists($id, $levelgroups)) {
			return $levelgroups[$id];
		} else {
			return JText::_('COM_AKEEBASUBS_SELECT_LEVELGROUP');
		}
	}

	public static function formatInvTempLevels($ids)
	{
		if(empty($ids)) {
			return JText::_('COM_AKEEBASUBS_COMMON_LEVEL_ALL');
		}
		if(empty($ids)) {
			return JText::_('COM_AKEEBASUBS_COMMON_LEVEL_NONE');
		}

		if(!is_array($ids)) {
			$ids = explode(',', $ids);
		}

		static $levels;

		if(empty($levels)) {
			$levelsList = F0FModel::getTmpInstance('Levels','AkeebasubsModel')
				->getItemList(true);
			if(!empty($levelsList)) foreach($levelsList as $level) {
				$levels[$level->akeebasubs_level_id] = $level->title;
			}

			$levels[-1] =  JText::_('COM_AKEEBASUBS_COMMON_LEVEL_NONE');
			$levels[0] =  JText::_('COM_AKEEBASUBS_COMMON_LEVEL_ALL');
		}

		$ret = array();
		foreach($ids as $id) {
			if(array_key_exists($id, $levels)) {
				$ret[] = $levels[$id];
			} else {
				$ret[] = '&mdash;';
			}
		}

		return implode(', ',$ret);
	}

	public static function formatInvoicingExtension($extension)
	{
		static $map = null;

		if (is_null($map))
		{
			$map = F0FModel::getTmpInstance('Invoices', 'AkeebasubsModel')
			->getExtensions(2);
		}

		if (array_key_exists($extension, $map))
		{
			return $map[$extension];
		}
		else
		{
			return $extension;
		}
	}
}