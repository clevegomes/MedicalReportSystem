<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends MY_Controller {

	public function __construct()
	{
		parent::__construct();

		// only admin role can access this controller
		if ( !verify_role(['operator','admin','staff']) )
		{
			redirect();
			exit;
		}

		$this->load->helper('crud');
		$this->load->model('Backend_user_model', 'backend_users');
	}

	public function index()
	{
		redirect('admin/backend_user');
	}




	/**
	 * Operator users
	 */
	public function patient_user()
	{
		// CRUD table
		$crud = generate_crud('users');
		$crud->set_subject('Patients');
		$crud->columns('first_name', 'last_name','email', 'active','date_of_birth', 'created_at');
		$crud->unset_edit_fields('password','created_at','updated_at');
		$crud->set_table('first_name');

		$this->mTitle = "Patients";
		$this->mViewFile = '_partial/crud';
		$this->mViewData['crud_data'] = $crud->render();

	}




	/**
	 * Backend users
	 */
	public function backend_user()
	{
		// CRUD table
		$crud = generate_crud('backend_users');
		$crud->set_subject('Operators');
		$crud->columns('role', 'username', 'full_name', 'active', 'created_at','updated_at');
		$crud->unset_edit_fields('password','created_at','updated_at');

		$crud->add_action('Reset Password', '', 'admin/reset_password', 'fa fa-rotate-left fa-lg');
		$crud->callback_before_insert(array($this, 'callback_before_create_user'));
		$crud->callback_before_update(array($this, 'callback_before_update_user'));
		$this->mTitle = "Operator Users";
		$this->mViewFile = '_partial/crud';
		$this->mViewData['crud_data'] = $crud->render();

	}

	/**
	 * Reset password for backend users
	 */
	public function reset_password($user_id)
	{
		$this->mTitle = "Operator Users";
		$this->mViewFile = 'admin/reset_password';
		$this->mViewData['target'] = $this->backend_users->get($user_id);

		if ( validate_form('', 'admin/reset_password') )
		{
			// update db
			$password = $this->input->post('password');
			$result = $this->backend_users->update($user_id, ['password' => hash_pw($password)]);

			// success or failed
			if ($result)
				set_alert('success', 'Successfully updated.');
			else
				set_alert('danger', 'Database error.');

			// refresh page to show alert msg
			redirect( current_url() );
		}
	}
	
	/**
	 * Grocery Crud callback functions
	 */
	public function callback_before_create_user($post_array)
	{
		$post_array['password'] = hash_pw($post_array['password']);
		return $post_array;
	}


	/**
	 * Grocery Crud callback functions
	 */
	public function callback_before_update_user($post_array)
	{
		$post_array['updated_at'] = 'CURRENT_TIMESTAMP';
		return $post_array;
	}
}