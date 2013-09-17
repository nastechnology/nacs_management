class nacs_management::screen::1024x768 {
    if( $productname == 'E4610'){
    	registry::value { 'DefaultSettings.XResolution':
	    key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0\Mon80861100',
	    type => dword,
	    data => '1024',
    	}

    	registry::value { 'DefaultSettings.YResolution':
    	    key  => 'HKCC\System\CurrentControlSet\Services\iAlm\Device0\Mon80861100',
	    type => dword,
	    data => '768',
    	}
    }
}
