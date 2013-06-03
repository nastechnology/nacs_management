require 'spec_helper'

describe 'nacs_management::checkin'  do 
    let(:facts) { :operatingsystem => 'Darwin' }

    it do 
	should contain_file('/opt/NACSManage/checkin.sh').with({
	    'ensure' => 'file',
	    'owner'  => 'technology',
	    'group'  => 'staff',
	    'mode'   => '0755',
	    'content'=> 'template("nacs_management/nonwindows_checkin.erb")',
	})
    end
end
