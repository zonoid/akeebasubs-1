<?php
/**
 * @package   AkeebaSubs
 * @copyright Copyright (c)2010-2015 Nicholas K. Dionysopoulos
 * @license   GNU General Public License version 3, or later
 */

namespace Akeeba\Subscriptions\Admin\Model;

defined('_JEXEC') or die;

use FOF30\Container\Container;
use FOF30\Model\DataModel;

class States extends DataModel
{
	public function __construct(Container $container, array $config = array())
	{
		parent::__construct($container, $config);

		// Always load the Filters behaviour
		$this->addBehaviour('Filters');

		// Some NOT NULL fields should be allowed to be set to an empty string, therefore have to be skipped by check()
		//$this->fieldsSkipChecks = ['country', 'akeebasubs_level_id'];
	}

	public function buildQuery($overrideLimits = false)
	{
		$query = parent::buildQuery($overrideLimits);

		$db = $this->getDbo();

		if ($this->getState('orderByLabels'))
		{
			$query->clear('order');
			$query->order('country ASC, label ASC');
		}

		return $query;
	}
}