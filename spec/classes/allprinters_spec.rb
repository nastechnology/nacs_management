require 'spec_helper'

describe 'nacs_management::allprinters' do

  it 'should contain kyocera dmg' do
    should contain_package('Kyocera_OS_X_10.5_Web_build_2012.11.30.dmg')
  end

  it 'should conatin foomatic rip' do
    should contain_package('foomatic-rip-5.0.dmg')
  end 

  it 'should conatin ghost script' do
    should contain_package('gplgs-8.72.dmg')
  end

  it 'should conatin pxlmono' do
    should contain_package('pxlmono-2.0.dmg')
  end

  it 'should contain bizhub color copier c554' do
    should contain_package('bizhub_C554_108.dmg')
  end

  it 'should contain Konica Minolta bizhub copier' do
    should contain_package('bizhub_751_108.dmg')
  end
end
