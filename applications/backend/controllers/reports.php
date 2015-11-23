<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports extends MY_Controller {

	public function __construct()
	{
		parent::__construct();

		// only admin role can access this controller
		if ( !verify_role(['operator','patients']) )
		{
			redirect();
			exit;
		}

		$this->load->helper('crud');
		$this->load->model('Backend_user_model', 'backend_users');
	}

	public function index()
	{
		redirect('reports/report');
	}




	/**
	 *  Patient users
	 */
	public function report()
	{
		// CRUD table
		$crud = generate_crud('reports');
		$crud->set_subject('Patient Report');
//		$crud->columns('first_name', 'last_name','email', 'active','date_of_birth', 'created_at');
		$crud->unset_edit_fields('password','created_at','updated_at');

		$this->mTitle = "Patients";
		$this->mViewFile = '_partial/crud';
		$this->mViewData['crud_data'] = $crud->render();

	}


}