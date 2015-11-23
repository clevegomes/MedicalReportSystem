<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Menu
| -------------------------------------------------------------------------
| This file lets you define navigation menu items on sidebar.
|
*/

$config['menu'] = array(

	'home' => array(
		'name'      => 'Home',
		'url'       => site_url(),
		'icon'      => 'fa fa-home'
	),

	'reports' => array(
		'name'      => 'Reports',
		'url'       => site_url('reports/report'),
		'icon'      => 'fa fa-list'
	),

	'patients' => array(
		'name'      => 'Patients',
		'url'       => site_url('admin/patient_user'),
		'icon'      => 'fa fa-users'
	),

	'operators' => array(
		'name'      => 'Operators',
		'url'       => site_url('admin/backend_user'),
		'icon'      => 'fa fa-users'
	),

//
//	// end of example
//
//	'admin' => array(
//		'name'      => 'Administration',
//		'url'       => site_url('admin'),
//		'icon'      => 'fa fa-cog',
//		'children'  => array(
//			'Operator Users'		=> site_url('admin/backend_user'),
//			'Patient Users'		=> site_url('admin/patient_user'),
//		)
//	),

	'logout' => array(
		'name'      => 'Sign out',
		'url'       => site_url('account/logout'),
		'icon'      => 'fa fa-sign-out'
	),
);