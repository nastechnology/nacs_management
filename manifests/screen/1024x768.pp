class nacs_management::screen::1024x768 {
    registry::value { 'DefaultSettings.XResolution':
	key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0',
	type => dword,
	data => '00000400',
    }

    registry::value { 'DefaultSettings.YResolution':
	key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0',
	type => dword,
	data => '00000300',
    }
}
