require 'spec_helper'

describe 'nacs_management', :type => 'class' do
  it { should contain_class('nacs_management') }
  
  context 'operatingsystem => Darwin' do
    let(:facts) { { :operatingsystem => 'Darwin'} }

    it do
      should contain_file('/opt/NACSManage').with({
        'ensure' => 'directory',
        'owner'  => 'technology',
        'group'  => 'staff',
        'mode'   => '0755'
      })
    end

    it do
      should contain_property_list_key('LoginwindowText').with({
        'ensure' => 'present',
	    'path'   => '/Library/Preferences/com.apple.loginwindow.plist',
	    'key'    => 'LoginwindowText',
	    'value'  => 'Property of Napoleon Area City Schools, if found call 419-599-7015',
      })
    end

    #it do
    #  should contain_property_list_key('').with({

    #  })
    #end
  end

  context 'operatingsystem => windows' do
  	let(:facts) { { :operatingsystem => 'windows'} }

  	it do
  	  should contain_file('C:/NACSManage').with({
        'ensure' => 'directory',
        'owner'  => 'Everyone',
        'group'  => 'Everyone',
        'mode'   => '0777',
  	  })
  	end
  end

  context 'operatingsystem => Ubuntu' do
  	let(:facts) { { :operatingsystem => 'Ubuntu'} }

  	it do
      should contain_file('/opt/NACSManage').with({
        'ensure' => 'directory',
        'owner'  => 'technology',
        'group'  => 'staff',
        'mode'   => '0755'
      })
    end
  end
end