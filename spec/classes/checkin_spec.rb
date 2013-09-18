require 'spec_helper'

describe 'nacs_management::checkin'  do

  it { should contain_class('nacs_management::checkin') }
  context 'with operatingsystem => Darwin' do
    let(:facts) { {:operatingsystem => 'Darwin'} }
    it do
      should contain_file('/opt/NACSManage/checkin.sh').with({
        'ensure'  => 'file',
        'owner'   => 'technology',
        'group'   => 'staff',
        'mode'    => '0755',
      })
    end

    it do 
    	should contain_exec('Checkin').with({
    	  'command' => '/bin/bash /opt/NACSManage/checkin.sh',
    	  'require' => 'File[/opt/NACSManage/checkin.sh]'
    	})
    end
  end

  context 'with operatingsystem => windows' do
  	let(:facts) { { :operatingsystem => 'windows'}}

  	it do
      should contain_file('C:/NACSManage/checkin.bat').with({
        'ensure'  => 'file',
        'owner'   => 'Administrator',
        'group'   => 'Administrators',
        'mode'    => '0755',
      })
    end

    it do 
  	  should contain_exec('Checkin').with({
  	    'command' => 'cmd.exe /c C:/NACSManage/checkin.bat',
  	    'require' => 'File[C:/NACSManage/checkin.bat]'
  	  })
    end
  end 
end
